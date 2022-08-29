#!/bin/bash

for NAMESPACE_1 in $(kubectl get po --all-namespaces | egrep -i "Match" | cut -d " " -f1 | uniq);
do
	echo "Aplication Namespace: $NAMESPACE_1" >> noMatchNode.log
	for POD_NAME_STATUS_NO_MATCH in $(kubectl get po -n $NAMESPACE_1 | egrep -i "Match" | cut -d " " -f1);
	do
		#kubectl delete pod "$POD_NAME_STATUS_NO_MATCH" -n "$NAMESPACE_1" --force --grace-period=0 >> noMatchNode.log;
		echo "$POD_NAME_STATUS_NO_MATCH" >> noMatchNode.log;
		echo "##############################################" >> noMatchNode.log;
	done

done

for NAMESPACE_2 in $(kubectl get po --all-namespaces | egrep -i "Evicted" | cut -d " " -f1 | uniq);
do

	echo "Aplication Namespace: $NAMESPACE_2" >> evicted_pod.log;
	for POD_NAME_STATUS_EVICTED in $(kubectl get po -n $NAMESPACE_2 | egrep -i "Evicted" | cut -d " " -f1);
        do
                #kubectl delete pod "$POD_NAME_STATUS_EVICTED" -n "$NAMESPACE_2" --force --grace-period=0 >> evicted_pod.log;
                echo "$POD_NAME_STATUS_EVICTED" >> evicted_pod.log;
                echo "##############################################" >> evicted_pod.log;
        done

done

for NAMESPACE_3 in $(kubectl get po --all-namespaces | egrep -i "ImagePullBackOff" | cut -d " " -f1 | uniq);
do

        echo "Aplication Namespace: $NAMESPACE_3" >> imagePullBackOff.log;
        for POD_NAME_STATUS_IMAGE_PULL_BACKOFF in $(kubectl get po -n $NAMESPACE_3 | egrep -i "ImagePullBackOff" | cut -d " " -f1);
        do
                #kubectl delete pod "$POD_NAME_STATUS_IMAGE_PULL_BACKOFF" -n "$NAMESPACE_3" --force --grace-period=0 >> imagePullBackOff.log;
                echo "$POD_NAME_STATUS_IMAGE_PULL_BACKOFF" >> imagePullBackOff.log;
                echo "##############################################" >> imagePullBackOff.log;
        done

done

for NAMESPACE_4 in $(kubectl get po --all-namespaces | egrep -i "ErrImagePull" | cut -d " " -f1 | uniq);
do

        echo "Aplication Namespace: $NAMESPACE_4" >> errImagePull.log;
        for POD_NAME_STATUS_IMAGE_PULL in $(kubectl get po -n $NAMESPACE_4 | egrep -i "ErrImagePull" | cut -d " " -f1);
        do
                #kubectl delete pod "$POD_NAME_STATUS_IMAGE_PULL" -n "$NAMESPACE_4" --force --grace-period=0 >> errImagePull.log;
                echo "$POD_NAME_STATUS_IMAGE_PULL" >> errImagePull.log;
                echo "##############################################" >> errImagePull.log;
        done

done

for NAMESPACE_5 in $(kubectl get po --all-namespaces | egrep -i "CrashLoopBackOff" | cut -d " " -f1 | uniq);
do

        echo "Aplication Namespace: $NAMESPACE_5" >> crashLoopBackOff.log;
        for POD_NAME_STATUS_CRASH_LOOP_BACKOFF in $(kubectl get po -n $NAMESPACE_5 | egrep -i "CrashLoopBackOff" | cut -d " " -f1);
        do
                #kubectl delete pod "$POD_NAME_STATUS_CRASH_LOOP_BACKOFF" -n "$NAMESPACE_5" --force --grace-period=0 >> crashLoopBackOff.log;
                echo "$POD_NAME_STATUS_CRASH_LOOP_BACKOFF" >> crashLoopBackOff.log;
                echo "##############################################" >> crashLoopBackOff.log;
        done

done

for NAMESPACE_6 in $(kubectl get po --all-namespaces | egrep -i "Error" | cut -d " " -f1 | uniq);
do

        echo "Aplication Namespace: $NAMESPACE_6" >> pod_error_only.log;
        for POD_NAME_STATUS_ERROR_ONLY in $(kubectl get po -n $NAMESPACE_6 | egrep -i "Error" | cut -d " " -f1);
        do
                #kubectl delete pod "$POD_NAME_STATUS_ERROR_ONLY" -n "$NAMESPACE_6" --force --grace-period=0 >> pod_error_only.log;
                echo "$POD_NAME_STATUS_ERROR_ONLY" >> pod_error_only.log;
                echo "##############################################" >> pod_error_only.log;
        done

done

