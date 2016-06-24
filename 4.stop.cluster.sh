#!/bin/bash

# Stop local Docker cluster

# If this cluster had been started by 'oc cluster up', below command would destroy all traces of the cluster.
# This cluster has been started by '3.start.cluster.sh config.sh'.
# This method of starting a cluster preserves data among restarts.
# You will be able to restart it by '3.start.cluster.sh config.sh'.

# This script does not need to be passed any configuration file.
# It stops the currently running cluster.

oc cluster down
