# Maintainer:  Michael Beasley <youvegotmoxie@gmail.com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgbase=linux-next-git
pkgname=("${pkgbase}")
_srcname=linux-next
pkgver=20150709
pkgrel=1
arch=('any')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'linux-firmware' 'mkinitcpio')
options=('!strip')
source=(git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git)
md5sums=('SKIP')

_kernelname=${pkgbase#linux}

#######
# Set to e.g. menuconfig, xconfig or gconfig and etc.
#
# For a full list of supported commands, please have a look
# at "Configuration targets" section of `make help`'s output
# or the help target in scripts/kconfig/Makefile
# https://kernel.org/doc/makehelp.txt
#
# If unset or set to an empty or space-only string, the
# (manual) kernel configuration step will be skipped.
#
linux_next_git_config_cmd="${linux_next_git_config_cmd:-olddefconfig}"

#######
# Directory with patches
# linux_next_git_patches_dir="path"

#######
# Use local config (non empty -> yes)
# linux_next_git_local_config=1

######
# Reset to specified tag
# linux_next_git_tag=""

pkgver() {
  cd "${_srcname}"
  git describe --always | tr -d 'next-'
}

prepare() {
  cd "${_srcname}"

  git reset --hard ${linux_next_git_tag}

  #################
  # Apply patches
  #################
  if [ -d "${linux_next_git_patches_dir}" ]; then
    msg "Applying patches..."
    for i in "${linux_next_git_patches_dir}"/*; do
      [[ ${i##*/} =~ .*\.patch$ ]] && msg "Applying ${i##*/}..." && \
      git apply "$i" || (error "Applying ${i##*/} failed" && return 1)
      msg "---"
    done
  fi

  if [ -n "${linux_next_git_local_config}" ]; then
          [ -f /proc/config.gz ] && zcat /proc/config.gz > ./.config
  fi

  ###########################
  # Start the configuration
  ###########################
  msg "Updating configuration..."
  yes "" | make config  > /dev/null
  msg "Running make $linux_next_git_config_cmd..."
  make ${linux_next_git_config_cmd}

  # set localversion to git commit
  sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"-$(date +%H%M)-ARCH\"|g" ./.config

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

export KARCH=not_supported
[ "${CARCH}" = "i686" ]   && KARCH=x86
[ "${CARCH}" = "x86_64" ] && KARCH=x86
[ "${CARCH}" = "armv7h" ] && KARCH=arm

build() {
  cd "${_srcname}"
  [ -d .git ] && rm -rf .git &
  if [ "${KARCH}" == "not_supported" ]; then
    echo "$CARCH not supported by package, report to the maintainer"
    exit 1
  fi

  export HOSTCFLAGS=$CFLAGS
  export HOSTCXXFLAGS=$CXXFLAGS

  if [ "${KARCH}" == "x86" ]; then
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
  fi
  if [ "${KARCH}" == "arm" ]; then
    make ${MAKEFLAGS} LOCALVERSION= uImage zImage dtbs modules
  fi
  echo "Start packaging..."
}

package() {
  pkgdesc="The Linux next kernel and modules (git version)"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=18')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26${_kernelname}=${pkgver}" "kernel26${_kernelname}-headers=${pkgver}")
  conflicts=("kernel26${_kernelname}" "kernel26${_kernelname}-headers")
  replaces=("kernel26${_kernelname}" "kernel26${_kernelname}-headers")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgbase}.install

  cd "${_srcname}"

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install

  [ "${KARCH}" == "x86" ] && cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  if [ "${KARCH}" == "arm" ]; then
    mkdir -p "${pkgdir}"/boot/dtbs
    cp arch/$KARCH/boot/zImage "${pkgdir}/boot/zImage"
    cp arch/$KARCH/boot/uImage "${pkgdir}/boot/uImage"
    cp arch/$KARCH/boot/dts/*.dtb "${pkgdir}/boot/dtbs"
  fi

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
      -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
      -i "${startdir}/${install}"

  mkdir -p ${pkgdir}/etc/mkinitcpio.d/

cat << EOF > "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
# mkinitcpio preset file for the 'linux-next-git' package

ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-${pkgbase}"

PRESETS=('default' 'fallback')

#default_config="/etc/mkinitcpio.conf"
default_image="/boot/initramfs-${pkgbase}.img"
#default_options=""

#fallback_config="/etc/mkinitcpio.conf"
fallback_image="/boot/initramfs-${pkgbase}-fallback.img"
fallback_options="-S autodetect"
EOF

  # remove build and source links
  rm -f "${pkgdir}/lib/modules/${_kernver}"/{source,build} &
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware" &
  wait

  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"
  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv -f "${pkgdir}/lib" "${pkgdir}/usr/"

  #########################################################
  # Set up extramodules directory (for external modules)
  #########################################################
  {
          local extramodules="$pkgdir/usr/lib/modules/extramodules-$(cut -d. -f1,2 <<<$_basekernver)"
          local modversion=$(grep '^CONFIG_LOCALVERSION=' .config | cut -d'"' -f2)
          [ -n $modversion ] && extramodules+=$modversion
          install -dm755 "${extramodules}-next-git"
          echo $_kernver > "${extramodules}-next-git/version"
          ln -s "../${extramodules##*/}-next-git" "$pkgdir/usr/lib/modules/$_kernver/extramodules"
  }

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"

  ##############################################################################
  # Linux Headers Part
  ##############################################################################
  tmp="${pkgdir}/usr/lib/modules/${_kernver}"
  install -dm755 "${tmp}"

  install -D -m644 Makefile        "$tmp/build/Makefile"
  install -D -m644 kernel/Makefile "$tmp/build/kernel/Makefile"
  install -D -m644 .config         "$tmp/build/.config"

  mkdir -p "$tmp/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "$tmp/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "$tmp/build/arch/${KARCH}"
  cp -a arch/${KARCH}/include "$tmp/build/arch/${KARCH}/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "$tmp/build"
  cp -a scripts "$tmp/build"

  # fix permissions on scripts dir
  chmod og-w -R "$tmp/build/scripts"
  mkdir -p "$tmp/build/.tmp_versions"

  mkdir -p "$tmp/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "$tmp/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "$tmp/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "$tmp/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile "$tmp/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "$tmp/build/drivers/md"
  cp drivers/md/*.h "$tmp/build/drivers/md"

  # add inotify.h
  mkdir -p "$tmp/build/include/linux"
  cp include/linux/inotify.h "$tmp/build/include/linux/"

  # add wireless headers
  mkdir -p "$tmp/build/net/mac80211/"
  cp net/mac80211/*.h "$tmp/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "$tmp/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "$tmp/build/drivers/media/dvb-core/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "$tmp/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "$tmp/build/drivers/media/dvb-frontends/"
  mkdir -p "$tmp/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "$tmp/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "$tmp/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "$tmp/build/drivers/media/usb/dvb-usb/"
  mkdir -p "$tmp/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "$tmp/build/drivers/media/dvb-frontends/"
  mkdir -p "$tmp/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "$tmp/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "$tmp/build/fs/xfs/libxfs"
  mkdir -p "$tmp/build/mm"
  cp fs/xfs/libxfs/xfs_sb.h "$tmp/build/fs/xfs/libxfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "$tmp/build/"$(echo "${i}" | sed 's|/Kconfig.*||')
    cp "${i}" "$tmp/build/${i}"
  done

  chown -R root.root "$tmp/build"
  find "$tmp/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "$tmp/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  for i in "$tmp/build/arch/"{alpha,x86,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}; do
    [ ${i##*/} == "$KARCH" ] && continue
    rm -rf "$i"
  done
}
