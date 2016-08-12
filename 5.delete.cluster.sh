#!/bin/bash

CONFIG_FILE="$1"


# This script destroys all traces of the cluster.
# The cluster is identified by the configuration file.
# You need to run this script as root

# Script will:
# stop and delete docker containers that have openshift in their image name.
#   This is okay, because all such containers belong to currently running cluster.
#   If you have installed another cluster then all its containers have been deleted already. They will be recreated upon restart.
# delete docker images pushed into embedded docker registry.
# delete docker images that have openshift in their repository name.
#   This is okay, because any docker images required by another cluster will be re-fetched from docker hub if needed.
# unmount any volumes that may have been mounted from within openshift.local.volumes, thus preventing the next step.
# delete the folder containing all configuration, persistent data and temporary volumes shared among the host and the cluster.

_setup() {
    oc login -u system:admin
    oc project default
    tempfile=$(mktemp)
    oc status | grep svc/docker-registry > $tempfile
    line=$(oc status | grep svc/docker-registry)
    registryAddress=$(sed -e 's/svc\/docker-registry - //g' $tempfile)
    echo $registryAddress
    rm $tempfile
}


_stop_and_delete_containers() {
    containerRows=$(docker ps -a --format "{{.ID}};{{.Image}}" | grep openshift)
    mapfile -t containers <<< "$containerRows"
    if [ -z "$containerRows" ]; then return; fi
    for i in "${containers[@]}"; do
        IFS=';' read -ra container <<< "$i"
        docker stop "${container[0]}"
        docker rm "${container[0]}"
        echo Deleted container "${container[1]}"
    done
}

__delete_images() {
    for i in "$@"; do
        IFS=';' read -ra image <<< "$i"
        docker rmi "${image[0]}"
        echo "Deleted image ${image[1]}:${image[2]}"
    done
}

_delete_images() {

    imageRows=$(docker images --format "{{.ID}};{{.Repository}};{{.Tag}}" | grep $registryAddress)
    __delete_images $imageRows

    imageRows=$(docker images --format "{{.ID}};{{.Repository}};{{.Tag}}" | grep openshift | grep $VERSION)
    __delete_images $imageRows

}

_unmount_volumes() {

    umount ${ORIGIN_HOME}/openshift.local.volumes/pods/*/volumes/kubernetes.io~secret/*/

}

main() {

    if [ -z "${CONFIG_FILE}" ]; then
        echo "You have to pass configuration file."
        echo "Usage:     delete.cluster.sh <path-to-config-file>"
        echo "Example: ./delete.cluster.sh ./config.sh"
    fi

    if [ ! "$(whoami)" = "root" ]; then
        echo "ERROR: You need to run this script as root."
        exit 1
    fi

    source "0.read.config.sh"
    read_config

    OLD_IFS=$IFS

    _setup

    _stop_and_delete_containers

    _delete_images

    _unmount_volumes

    echo "Removing ${ORIGIN_HOME}..."
    rm -rf "${ORIGIN_HOME}"

    export IFS=$OLD_IFS

}

main
