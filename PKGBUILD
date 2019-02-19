# AArch64 multi-platform
# Maintainer: Kevin Mihelich <kevin@archlinuxarm.org>

buildarch=8

pkgbase=linux-aarch64-raspberrypi-4.14
pkgname=linux-aarch64-raspberrypi-4.14
_srcname=linux
_kernelname=${pkgbase#linux}
_desc="AArch64 multi-platform"
pkgver=4.14.98
pkgrel=1
arch=('aarch64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'aarch64-linux-gnu-binutils' 'aarch64-linux-gnu-gdb' 'aarch64-linux-gnu-gcc' 'aarch64-linux-gnu-glibc' 'aarch64-linux-gnu-linux-api-headers' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'dtc')
options=('!strip')
source=("git+https://github.com/raspberrypi/linux.git#commit=877656cd145497db7c09a7de06ea85db98bd72a3"
        'add-nexmon.patch'
        'config'
	'config.txt'
	'cmdline.txt'
	'dmi.patch'
        'cpucache.patch'
        'linux.preset'
	'scripts.tar.gz::https://cloud.it-kraut.net/s/FDPnGq3ksBifKcA/download'
        '99-linux.hook')
md5sums=('SKIP'
         '7462ced7cee9e33aa7925ea63771f0ad'
         '4a15ee05656193d4bcc2ef9d1c08a56b'
         'c724d9c086060a17a2170c7d98dae908'
         '6f4a4da9a6dec38507ff6e3a536f834a'
         'f80e2bf1fda4ff65606afea2939cc4a5'
         '7e546c1c09fd7caf443f2d3441ab8ca7'
         '5898b5308f7afb2b9b091de62eb321f3'
         'a9ebd99b39fe2a7a13d1ec353f99d8ad'
         '60f0317bfdda4cf9fa06f075cd3617c0')

prepare() {
  cd "${srcdir}/${_srcname}"

  # firmware: dmi: handle missing DMI data gracefully
  patch -Np1 -i ../dmi.patch

  # cpucache dt patch
  patch -p0 -i ../cpucache.patch

  # add upstream patch
  cat "${srcdir}/config" > ./.config

  # add nexmon
  #patch -Np1 -i ../add-nexmon.patch

  # add pkgrel to extraversion
  sed -ri "s|^(EXTRAVERSION =)(.*)|\1 \2-${pkgrel}|" Makefile

  # patch for mmc driver
  sed -i "s|depends on MMC_BCM2835_MMC && MMC_BCM2835_DMA|depends on MMC_BCM2835_MMC|" drivers/mmc/host/Kconfig

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh
}

build() {
  cd "${srcdir}/${_srcname}"
  unset CFLAGS
  export KCFLAGS="-march=armv8-a+crc -mtune=cortex-a53 -O2 -pipe"
  unset CXXFLAGS
  export KCXXFLAGS="-march=armv8-a+crc -mtune=cortex-a53 -O2 -pipe"
  unset LDFLAGS
  export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now"
  unset CPPFLAGS
  export CPPFLAGS="-D_FORTIFY_SOURCE=2"

  make prepare

  # build!
  unset LDFLAGS
  make ${MAKEFLAGS} Image Image.gz modules
  # Generate device tree blobs with symbols to support applying device tree overlays in U-Boot
  make  ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

_package() {
  pkgdesc="The Linux Kernel and modules - ${_desc}"
  depends=('coreutils' 'raspberrypi-bootloader' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=('kernel26' "linux=${pkgver}")
  replaces=('linux-armv8')
  conflicts=('linux')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset" "boot/config.txt" "boot/cmdline.txt")
  install=${pkgname}.install

  cd "${srcdir}/${_srcname}"

  KARCH=arm64

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware}
  make INSTALL_MOD_PATH="${pkgdir}" modules_install
  make INSTALL_DTBS_PATH="${pkgdir}/boot" dtbs_install
  cp arch/$KARCH/boot/Image "${pkgdir}/boot/kernel8.img"
  cp "${pkgdir}/boot"/broadcom/* "${pkgdir}/boot"/
  rm -rf "${pkgdir}/boot"/broadcom
  cp "${srcdir}/${_srcname}"/arch/arm64/boot/dts/overlays/README "${pkgdir}/boot"/overlays/

  # set correct depmod command for install
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${pkgname}.install"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  install -D -m644 "${srcdir}/config.txt" "${pkgdir}/boot/config.txt"
  install -D -m644 "${srcdir}/cmdline.txt" "${pkgdir}/boot/cmdline.txt"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"${_kernver}\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
 sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/99-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "$pkgdir" -F System.map "$_kernver"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "$pkgdir/lib" "$pkgdir/usr"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for linux kernel - ${_desc}"
  provides=("linux-headers=${pkgver}")
  replaces=('linux-armv8-headers')
  conflicts=('linux-headers')

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic clocksource config crypto drm generated keys linux \
    math-emu media net pcmcia scsi soc sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p ${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH
  cp -a arch/$KARCH/include ${pkgdir}/usr/lib/modules/${_kernver}/build/arch/$KARCH/

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  tar xzf "${srcdir}"/scripts.tar.gz  -C "${pkgdir}"/usr/lib/modules/"${_kernver}"/build/
  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # copy module linker script
  cp arch/$KARCH/kernel/module.lds "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
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
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,x86,xtensa}
}
pkgname=("${pkgbase}" "${pkgbase}-headers" )
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
