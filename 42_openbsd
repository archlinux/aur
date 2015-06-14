#!/bin/sh
# Filename:      42_openbsd
# Purpose:       grub-mkconfig helper script for OpenBSD rescue systems
# Authors:       Grml team (grml.org), (c) Andreas Gredler <jimmy@grml.org>, Michael Prokop <mika@grml.org>
#                Original creators
# Authors:       Thiago Perrotta <perrotta dot thiago at poli dot ufrj dot br>
#                Modified to make it work with OpenBSD
# License:       This file is licensed under the GPL v2+.
################################################################################

set -e

prefix=/usr
exec_prefix=${prefix}
bindir=${exec_prefix}/bin
libdir=${exec_prefix}/lib

if [ -r ${libdir}/grub/grub-mkconfig_lib ] ; then
  . ${libdir}/grub/grub-mkconfig_lib
elif [ -r /usr/share/grub/grub-mkconfig_lib ] ; then # fallback for e.g. Fedora
  . /usr/share/grub/grub-mkconfig_lib
else
  echo "Could not locate file grub-mkconfig_lib, please report a bug." >&2
fi

# default unless configured otherwise:
ISO_LOCATION="/boot/openbsd"

if [ -r /etc/default/openbsd-rescueboot ] ; then
  . /etc/default/openbsd-rescueboot
fi

resolve_dm_name() {
  retval="$1"
  base=${1##*/}
  for block in /sys/block /sys/class/block ; do
    [ ! -d ${block}/${base}/dm ] && continue
    retval="/dev/mapper/$(cat ${block}/${base}/dm/name)"
    break
  done
  case "$retval" in
    /dev/dm-*)
    minor=${retval##*-}
   retval="/dev/mapper/$(dmsetup info -C --noheadings -o name -j 253 -m $minor)"
    ;;
  esac

  echo "$retval"
}

get_dependencies() {
  device=${1}
  if [ -z ${device} ] ; then
    return
  fi
  device=$(readlink -f ${device})
  case "$device" in
    /dev/mapper/*)
    device="/dev/dm-$(dmsetup info -C --noheadings -o minor "$device")"
    ;;
  esac

  base=${device##*/}
  dependencies=""
  additional_dependencies=""
  for block in /sys/block /sys/class/block ; do
    [ ! -d ${block}/${base}/slaves ] && continue
    for file in  ${block}/${base}/slaves/* ; do
      dep_name="/dev/${file##*/}"
      dep_name=$(resolve_dm_name ${dep_name})

      # resolve recursively all dependencies
      additional_dependencies=$(get_dependencies ${dep_name})

      dependencies="$dependencies $additional_dependencies $dep_name"
    done
    break
  done
  echo $dependencies

}



iso_list=""
for file in "${ISO_LOCATION}"/*.iso ; do
     if grub_file_is_not_garbage "$file" ; then
       iso_list="$iso_list $file "
     fi
done

for openbsdiso in $iso_list ; do
  rel_dirname="$(make_system_path_relative_to_its_root $(dirname $openbsdiso))"
  openbsd="$(basename $openbsdiso)"
  device="$(${grub_probe} -t device ${openbsdiso})"

  additional_param=""

  case "$device" in
    /dev/mapper*|/dev/md*)
      dependencies=$(get_dependencies ${device})
      dep_string=""
      for dep in $dependencies $device ; do
        dep_string="$dep_string,$dep"
      done
      dep_string=${dep_string#,}
      additional_param="live-media=$dep_string"
    ;;
  esac

  echo "Found OpenBSD ISO image: $openbsdiso" >&2
  title="OpenBSD Rescue System ($openbsd)"
  grub_prep=$(prepare_grub_to_access_device "$device" | sed -e "s/^/        /")

  cat << EOF
menuentry "${title}" {
${grub_prep}
        iso_path="${rel_dirname}/${openbsd}"
        export iso_path
        kernelopts=" $CUSTOM_BOOTOPTIONS $additional_param "
        export kernelopts
        loopback loop "${rel_dirname}/$openbsd"
        set root=(loop)
        configfile /boot/grub/loopback.cfg
        kopenbsd /<version_string>/amd64/bsd.rd
}
EOF
done

## END OF FILE #################################################################
