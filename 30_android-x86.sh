#! /bin/sh
set -e

# grub-mkconfig helper script.
# Copyright (C) 2006,2007,2008,2009  Free Software Foundation, Inc.
#
# GRUB is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# GRUB is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GRUB.  If not, see <http://www.gnu.org/licenses/>.

. "$pkgdatadir/grub-mkconfig_lib"

export TEXTDOMAIN=grub
export TEXTDOMAINDIR="${datarootdir}/locale"

CLASS="--class android --class os"
OS="Android"

# Default to disabling partition uuid support to maintian compatibility with
# older kernels.
GRUB_DISABLE_LINUX_PARTUUID=${GRUB_DISABLE_LINUX_PARTUUID-true}

# Android x68 supported file systems
# Note that by default, Android initrds don't support btrfs and some other
# filesystems
ANDROID_SUPPORTED_FS=${ANDROID_SUPPORTED_FS-"ext2 ext3 ext4 vfat ntfs"}

# Default parameters
# GRUB_CMDLINE_ANDROID=${GRUB_CMDLINE_ANDROID-"androidboot.hardware=android_x86_64 androidboot.selinux=permissive acpi_sleep=s3_bios,s3_mode"}
. /etc/default/grub

_android_entry() {
	title="$1"
	src="$2"
	kernel="$3"
	initrd="$4"
	disk="$5"
	devid="$6"
	type="$7"

	if [ "$type" != "default" ]; then
		title="$title, with kernel ${kernel##*/}, and initrd ${initrd##*/}"
	fi

	echo "menuentry '$(echo "$title" | grub_quote)' ${CLASS} \$menuentry_id_option '$OS-${src##*/}-${kernel##*/}-${initrd##*/}-$type-$devid' {" | sed "s/^/$submenu_indentation/"

	save_default_entry | grub_add_tab

	# Use ELILO's generic "efifb" when it's known to be available.
	# FIXME: We need an interface to select vesafb in case efifb can't be used.
	if [ ! "$GRUB_GFXPAYLOAD_LINUX" ]; then
		echo "	load_video" | sed "s/^/$submenu_indentation/"
		if grep -qx "CONFIG_FB_EFI=y" "${config}" 2>/dev/null &&
			grep -qx "CONFIG_VT_HW_CONSOLE_BINDING=y" "${config}" 2>/dev/null; then
			echo "	set gfxpayload=keep" | sed "s/^/$submenu_indentation/"
		fi
	else
		if [ "x$GRUB_GFXPAYLOAD_LINUX" != xtext ]; then
			echo "	load_video" | sed "s/^/$submenu_indentation/"
		fi
		echo "	set gfxpayload=$GRUB_GFXPAYLOAD_LINUX" | sed "s/^/$submenu_indentation/"
	fi

	echo "	insmod gzio" | sed "s/^/$submenu_indentation/"

	echo "$disk" | sed "s/^/$submenu_indentation	/"

	echo "	linux $kernel $GRUB_CMDLINE_ANDROID root=/dev/ram0 SRC=$src" | sed "s/^/$submenu_indentation/"
	echo "	initrd $initrd" | sed "s/^/$submenu_indentation/"

	sed "s/^/$submenu_indentation/" <<EOF
}
EOF
}

_mount_fs() {
	disktmp="$(mktemp)"
	rm -f "$disktmp"
	mkdir -p "$disktmp" || true
	mount -o ro${2:+,$2} -t "${3:-auto}" "$1" "$disktmp"
	echo "$disktmp"
}

_find_buildprop() {
	if [ -d "$1" ]; then
		if [ -f "$1/system/build.prop" ]; then
			cat "$1/system/build.prop"
		elif [ -f "$1/build.prop" ]; then
			cat "$1/build.prop"
		fi
	elif [ -f "$1" ]; then
		case "$1" in
		*system.img)
			imgdir="$(_mount_fs "$1" loop)"
			_find_buildprop "$imgdir"
			umount -lf "$imgdir"
			rm -rf "$imgdir"
			;;
		*system.?fs)
			sfsdir="$(_mount_fs "$1" loop)"
			_find_buildprop "$sfsdir/system.img"
			umount -lf "$sfsdir"
			rm -rf "$sfsdir"
			;;
		esac
	fi
}

_grep_find() {
	grep "$2" <<EOF
${1}
EOF
}

_find_os() {
	avail_mntpt="$(lsblk -pndo mountpoints "$1" | tail -1)"
	if [ "$avail_mntpt" ]; then
		device="$avail_mntpt"
	else
		[ "$2" = "ntfs" ] && isntfs="ntfs-3g"
		device="$(_mount_fs "$1" "" "$isntfs")"
	fi

	# The damn `find` command
	foundpaths="$(find $device \( \
		-iname 'system' -o \
		-iname 'system.img' -o \
		-iname 'system.sfs' -o \
		-iname 'system.efs' \) \
		-not \( -path "$device/bin/*" -prune \) \
		-not \( -path "$device/boot/efi/*" -prune \) \
		-not \( -path "$device/dev/*" -prune \) \
		-not \( -path "$device/etc/*" -prune \) \
		-not \( -path "$device/lib/*" -prune \) \
		-not \( -path "$device/lib64/*" -prune \) \
		-not \( -path "$device/lib32/*" -prune \) \
		-not \( -path "$device/proc/*" -prune \) \
		-not \( -path "$device/run/*" -prune \) \
		-not \( -path "$device/sbin/*" -prune \) \
		-not \( -path "$device/sys/*" -prune \) \
		-not \( -path "$device/usr/*" -prune \) \
		-not \( -path "$device/var/*" -prune \) \
		-not \( -path "$device/tmp/*" -prune \) \
		-not \( -path "$device/Program\ Files/*" -prune \) \
		-not \( -path "$device/Program\ Files\ (x86)/*" -prune \) \
		-not \( -path "$device/ProgramData/*" -prune \) \
		-not \( -path "$device/Windows/*" -prune \) \
		-not \( -path "$device/EFI/*" -prune \) \
		2>/dev/null)"

	if [ ! "$foundpaths" ]; then
		if [ ! "$avail_mntpt" ]; then
			umount -lf "$device"
			rm -rf "$device"
		fi
		return
	fi

	# get device info (in grub)
	disk="$(prepare_grub_to_access_device "$1")"
	boot_device_id="$(grub_get_device_id "$1")"

	IFS="
"
	for path in $foundpaths; do
		[ "${path}" ] || continue
		systempath="$path"

		path=${path%/*}

		# Getting build.prop contents
		buildprop="$(_find_buildprop "$systempath")"
		[ "${buildprop}" ] || continue

		buildver="$(
			grep -E "ro.([a-z]*).version" <<EOF | grep -v build
${buildprop}
EOF
		)"
		# for ver in "${buildver[@]}"; do echo "> $ver"; done
		# continue
		for version in $buildver; do
			case $version in
			ro.bliss.version*)
				os="Bliss OS"
				ver="$(_grep_find "$buildprop" "ro.bliss.version=")"
				break
				;;
			ro.lineage.version*)
				os="Lineage OS"
				ver="$(_grep_find "$buildprop" "ro.lineage.version=")"
				;;
			ro.phoenix.version*)
				os="Phoenix OS"
				ver="$(_grep_find "$buildprop" "ro.phoenix.version.code=")"
				break
				;;
			ro.primeos.version*)
				os="Prime OS"
				ver="$(_grep_find "$buildprop" "ro.primeos.version.name=")"
				break
				;;
			*)
				os="AOSP"
				ver="$(_grep_find "$buildprop" "ro.build.version.release=") $(_grep_find "$buildprop" "ro.build.flavor=")"
				;;
			esac
		done

		src=$(echo "${path#"$device"}" | sed 's/ /\\ /g')
		ver=${ver##*=}
		isdefault="default"

		echo "Found $os version $ver on $1" >&2

		MAIN_ENTRY=""
		EXTENDED_ENTRIES=""

		# Extra indentation to add to menu entries in a submenu. We're not in a submenu
		# yet, so it's empty. In a submenu it will be equal to '\t' (one tab).
		submenu_indentation=""

		for kernel in "$path"/vmlinu[xz]* "$path"/kernel*; do
			[ -f "$kernel" ] || continue

			# Checking for cpu id/manufacturer and microcode file
			cpuid=$(grep vendor_id /proc/cpuinfo | head -1 | awk '{print $3}')
			case "$cpuid" in
			"GenuineIntel")
				brand="intel"
				;;
			"AuthenticAMD")
				brand="amd"
				;;
			esac
			microcode=$(find "$path" -maxdepth 1 -type f \( -iname "$brand-ucode.img" -o -iname "$brand-microcode.img" \) -print -quit 2>/dev/null)

			for initrd in "$path"/initrd*.img "$path"/initramfs*.img; do
				[ -e "$initrd" ] || continue

				entry="$(_android_entry "$os $ver" "$src" "${src}${kernel#"$path"}" "${microcode:+"${src}${microcode#"$path"} "}${src}${initrd#"$path"}" "$disk" "$boot_device_id" "$isdefault")"

				if [ "$isdefault" = "default" ]; then
					MAIN_ENTRY="$entry"
					isdefault="extended"
					submenu_indentation="$grub_tab"
					EXTENDED_ENTRIES="$EXTENDED_ENTRIES$(
						sed "s/^/$submenu_indentation/" <<EOF
$entry
EOF
					)
"
				else
					EXTENDED_ENTRIES="$EXTENDED_ENTRIES$entry
"
				fi
			done
		done

		cat <<EOF
$MAIN_ENTRY

submenu '$(echo "Advanced options for $os $ver" | grub_quote)' \$menuentry_id_option '$OS-${src##*/}-$isdefault-$boot_device_id' { 
$EXTENDED_ENTRIES
}

EOF
	done
	unset IFS

	if [ ! "$avail_mntpt" ]; then
		umount -lf "$device"
		rm -rf "$device"
	fi
}

echo "Detecting android..." >&2

# Scan for Android partitions that contain both system(folder, .img, .sfs)
# and data(folder, .img, .sfs)
BLKLIST="$(ls /sys/class/block/ | grep ".*[0-9]$" | grep -Ev "loop|ram|nbd|fd" | sed "s|^|/dev/|g")"
for blk in $BLKLIST; do
	blkfs=$(lsblk -prndo fstype "$blk")
	[ "$blkfs" ] && { echo "$ANDROID_SUPPORTED_FS" | grep "$blkfs" >/dev/null; } || continue
	cat <<EOF
$(_find_os "$blk" "$blkfs")
EOF
done
