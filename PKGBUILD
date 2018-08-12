# Maintainer: redfish <redfish@galactica.pw>
# Author: Kevin Mihelich <kevin@archlinuxarm.org>
# Author: Mike Brown <mbrown@archlinuxarm.org>

pkgbase=linux-odroid-u3-git
pkgmain=linux-odroid
pkgname=('linux-odroid-u3-git' 'linux-headers-odroid-u3-git')
_kernelname=${pkgname#linux}
_basekernel=4.17.14
pkgver=${_basekernel}
pkgrel=1
arch=('armv7h')
url="http://kernel.org"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'git' 'inetutils' 'bc' 'uboot-tools')
options=('!strip')
source=("https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${pkgver}.tar.xz"
	'config_u3'
        'linux-odroid.preset'
        'arch-logo.ppm'
	'uEnv-mainline.txt')

_repodir=linux-${pkgver}

# Kernel and initrd images go here
_bootdir=/boot

prepare() {
  cd "${srcdir}/${_repodir}"

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  cp "${srcdir}/config_u3" ${srcdir}/${_repodir}/.config
}

build_kernel_package() {
  local config=$1

  cd "${srcdir}/${_repodir}"

  install -m644 ${startdir}/arch-logo.ppm drivers/video/logo/logo_linux_clut224.ppm

  make ${MAKEFLAGS} menuconfig
  make ${MAKEFLAGS} zImage modules
  
  KARCH=arm

  # get kernel version
  _kernver="$(make kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/zImage "${pkgdir}/${_bootdir}/zImage"

  make exynos4412-odroidu3.dtb

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -e  "s|BOOT_DIR=.*|BOOT_DIR=${_bootdir}|g" \
    -i "${startdir}/${pkgbase}.install"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${startdir}/${pkgmain}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgmain}.preset"
  sed \
    -e "s|ALL_kver=.*|ALL_kver=${_kernver}|" \
    -e "s|BOOT_DIR=.*|BOOT_DIR=${_bootdir}|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgmain}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' |xargs -P 2 -n 1 gzip -9
  # make room for external modules
  ln -s "../extramodules-${_basekernel}-${_kernelname:-ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}-${_kernelname:-ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}-${_kernelname:-ARCH}/version"

  # Now we call depmod...
  depmod -b "$pkgdir" -F System.map "$_kernver"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "$pkgdir/lib" "$pkgdir/usr"

  install -D -m644 "${startdir}/uEnv-mainline.txt" "${pkgdir}${_bootdir}/uEnv-mainline.txt"
  install -D -m644 "arch/arm/boot/dts/exynos4412-odroidu3.dtb" "${pkgdir}${_bootdir}/exynos4412-odroidu3.dtb"
}

package_linux-odroid-u3-git() {
  pkgdesc="The (mostly) mainline Linux Kernel and modules for ODROID U3"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26' "linux=${pkgver}")
  conflicts=('linux-odroid-u2' 'linux-odroidx' 'linux-odroid-x' 'linux-odroid-x-mali' 'linux-odroid-u2-mali' 'linux-odroid-x2')
  replaces=('linux-odroid-u2-mali')
  backup=("etc/mkinitcpio.d/${pkgmain}.preset")
  install=${pkgbase}.install

  build_kernel_package config_u3
}

package_linux-headers-odroid-u3-git() {
  pkgdesc="Header files and scripts for building modules for linux kernel for ODROID U3"
  provides=("linux-headers=${pkgver}")
  conflicts=('linux-headers-odroidx' 'linux-headers-odroid')
  replaces=('linux-headers-odroidx')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${pkgdir}/usr/lib/modules/${_kernver}"
  ln -sf ../../../src/linux-${_kernver} build

  cd "${srcdir}/${_repodir}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/src/linux-${_kernver}/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/src/linux-${_kernver}/.config"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/src/linux-${_kernver}/include/"
  done

  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH
  cp -a arch/$KARCH/include ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/mach-exynos
  cp -a arch/$KARCH/mach-exynos/include ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/mach-exynos/
  mkdir -p ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/plat-samsung
  cp -a arch/$KARCH/plat-samsung/include ${pkgdir}/usr/src/linux-${_kernver}/arch/$KARCH/plat-samsung/

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/src/linux-${_kernver}"
  cp -a scripts "${pkgdir}/usr/src/linux-${_kernver}"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/src/linux-${_kernver}/scripts"
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/.tmp_versions"

  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/"

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/src/linux-${_kernver}/arch/${KARCH}/kernel/"

  # add headers for lirc package
  # pci
  for i in bt8xx cx88 saa7134; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
    cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/pci/${i}"
  done
  # usb
  for i in cpia2 em28xx pwc; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
    cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
  done
  # i2c
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c"
  cp drivers/media/i2c/*.h  "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
  for i in cx25840; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
    cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/${i}"
  done

  # add dm headers
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/src/linux-${_kernver}/include/linux/"

  # add wireless headers
  if [ -d net/mac80211 ]
  then
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
    cp net/mac80211/*.h "${pkgdir}/usr/src/linux-${_kernver}/net/mac80211/"
  fi

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  #if [ -d drivers/media/dvb-core ]
  #then
  #  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core"
  #  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-core/"
  #fi
  ## and...
  ## http://bugs.archlinux.org/task/11194
  #if [ -d include/config/dvb ]
  #then
  #  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
  #  cp include/config/dvb/*.h "${pkgdir}/usr/src/linux-${_kernver}/include/config/dvb/"
  #fi

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  #if [ -e drivers/media/dvb-frontends/lgdt330x.h ]
  #then
  #  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
  #  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/dvb-frontends/"
  #fi
  #if [ -e drivers/media/i2c/msp3400-driver.h ]
  #then
  #  mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
  #  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/i2c/"
  #fi

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  #for folder in usb/dvb-usb dvb-frontends tuners
  #do
  #  if [ -d drivers/media/$folder ]
  #  then
  #    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/$folder"
  #    cp drivers/media/$folder/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/$folder/"
  #  fi
  #done

  # add xfs and shmem for aufs building
  if [ -e fs/xfs/xfs_sb.h ]
  then
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs"
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/mm"
    cp fs/xfs/xfs_sb.h "${pkgdir}/usr/src/linux-${_kernver}/fs/xfs/xfs_sb.h"
  fi

  # copy in Kconfig files
  for i in `find . -name "Kconfig*"`; do
    mkdir -p "${pkgdir}"/usr/src/linux-${_kernver}/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/src/linux-${_kernver}/${i}"
  done

  chown -R root.root "${pkgdir}/usr/src/linux-${_kernver}"
  find "${pkgdir}/usr/src/linux-${_kernver}" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/src/linux-${_kernver}/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,sh,sh64,sparc,sparc64,um,v850,x86,xtensa}
}

sha256sums=('c846038df44ee74dd910d19b346044a100f62a5b933eec2264d17008758cbaaf'
            '4bd24a542259d06459bb7764c420cd1e7fa6608a914f8ba3c9d99efcc3ab72fa'
            '8fa78f0372deb78ad2d24b895c734da95b5bece05729312762b8310e886df7ca'
            '781ec4b25b1e8fc52fa283225fee9240e7c9b37eb68aa3bbb6f6f57e30beaafe'
            'a0deabebc9e00693b514fdaeb70b6888c7c5610e79b41d324026c616c3ec10f7')
