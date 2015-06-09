#!/bin/sh -e

echo "System Rescue CD" >&2

if [ -r /etc/default/systemrescuecd ] ; then
  . /etc/default/systemrescuecd
fi

cat << EOF
menuentry "System Rescue (x86_64)"{
  linux ${BASE_DIR}/sysrescue/rescue64 subdir=${BASE_DIR}/sysrescue ${CUSTOM_BOOTOPTIONS}
  initrd ${BASE_DIR}/sysrescue/initram.igz
}

menuentry "System Rescue (i586)"{
	linux ${BASE_DIR}/sysrescue/rescue32 subdir=${BASE_DIR}/sysrescue ${CUSTOM_BOOTOPTIONS}
	initrd ${BASE_DIR}/sysrescue/initram.igz
}

menuentry "System Rescue (alternative x86_64)"{
  linux ${BASE_DIR}/sysrescue/altker64 subdir=${BASE_DIR}/sysrescue ${CUSTOM_BOOTOPTIONS}
  initrd ${BASE_DIR}/sysrescue/initram.igz
}

menuentry "System Rescue (alternative i586)"{
  linux ${BASE_DIR}/sysrescue/altker32 subdir=${BASE_DIR}/sysrescue ${CUSTOM_BOOTOPTIONS}
  initrd ${BASE_DIR}/sysrescue/initram.igz
}
EOF
