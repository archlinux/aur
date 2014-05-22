# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# SELinux Contributor: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)

pkgbase=linux-selinux       # Build stock -ARCH kernel
#pkgbase=linux-custom       # Build kernel with a different name
_srcname=linux-3.14
pkgver=3.14.4
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')
groups=(selinux)
source=("https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        'linux-selinux.preset'
        'change-default-console-loglevel.patch'
        '0001-Bluetooth-allocate-static-minor-for-vhci.patch'
        '0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch'
        '0003-module-remove-MODULE_GENERIC_TABLE.patch'
        '0004-fs-Don-t-return-0-from-get_anon_bdev.patch'
        '0005-Revert-Bluetooth-Enable-autosuspend-for-Intel-Blueto.patch'
        '0006-genksyms-fix-typeof-handling.patch'
        '0010-iwlwifi-mvm-delay-enabling-smart-FIFO-until-after-be.patch'
        '0011-kernfs-fix-removed-error-check.patch'
        '0012-fix-saa7134.patch'
        '0013-net-Start-with-correct-mac_len-in-skb_network_protocol.patch'
        '0015-fix-xsdt-validation.patch'
        )
sha256sums=('61558aa490855f42b6340d1a1596be47454909629327c49a5e4e10268065dffa'
            'af640ea64e923d525a8238832e8452381e6dc76a3bf28046411cadd67c408114'
            '68d36c33637d0431372d8f679b61d6641b36ccc079419405024dfc3b88e37ba4'
            '3bad2b8b6c2c3e1879422046abd6b28a0964996b0544cb8c36c3d19f252e47ad'
            '375da3b030f17581cbf5be9140b79029ca85eebc70197f419a4de77e00fa84e9'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '6d72e14552df59e6310f16c176806c408355951724cd5b48a47bf01591b8be02'
            '52dec83a8805a8642d74d764494acda863e0aa23e3d249e80d4b457e20a3fd29'
            '65d58f63215ee3c5f9c4fc6bce36fc5311a6c7dbdbe1ad29de40647b47ff9c0d'
            '1e1ae0f31f722e80da083ecada1f1be57f9ddad133941820c4483b0240e494c1'
            '3fffb01cf97a5a7ab9601cb277d2468c0fb1e1cceba4225915f3ffae3a5694ec'
            'cf2e7a2d00787f754028e7459688c2755a406e632ce48b60952fa4ff7ed6f4b7'
            'c0af4622f75c89fef62183e18b7d49998228d4eaa906c6accaf4aa4ff0134f85'
            '04f44bf5c181d6dc31905937c1bdccb0f5aecaad3a579e99b302502b9cbe0f7a'
            '79359454c9d8446eb55add2b1cdbf8332bd67dafb01fefb5b1ca090225f64d18'
            'f2a5e22c1ba6e9b8a32a7bd4a5327ee95538aa10edcee3cd12578f8ff49bf6be'
            '384dd13fd4248fd6809da8c6ae29ced55d4a5cacc33ac2ae7522093ec0fb26d4')

_kernelname=${pkgbase#linux}

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # Fix vhci warning in kmod (to restore every kernel maintainer's sanity)
  patch -p1 -i "${srcdir}/0001-Bluetooth-allocate-static-minor-for-vhci.patch"

  # Fix atkbd aliases
  patch -p1 -i "${srcdir}/0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
  patch -p1 -i "${srcdir}/0003-module-remove-MODULE_GENERIC_TABLE.patch"

  # Fix various bugs caused by rootfs having FSID 0
  # See http://www.spinics.net/lists/kernel/msg1716924.html
  patch -p1 -i "${srcdir}/0004-fs-Don-t-return-0-from-get_anon_bdev.patch"

  # Disable usb autosuspend for intel btusb
  # See http://www.spinics.net/lists/kernel/msg1716461.html
  # Until a solution is found, make sure the driver leaves autosuspend alone
  patch -p1 -i "${srcdir}/0005-Revert-Bluetooth-Enable-autosuspend-for-Intel-Blueto.patch"

  # Fix generation of symbol CRCs
  # http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dc53324060f324e8af6867f57bf4891c13c6ef18
  patch -p1 -i "${srcdir}/0006-genksyms-fix-typeof-handling.patch"

  # https://git.kernel.org/cgit/linux/kernel/git/iwlwifi/iwlwifi-fixes.git/commit/?id=12f853a89e29f50b17698e17e73c328a35f1498d
  # FS#39815
  patch -p1 -i "${srcdir}/0010-iwlwifi-mvm-delay-enabling-smart-FIFO-until-after-be.patch"
  
  # fix Xorg crash with i810 chipset due to wrong removed error check
  # References: http://lkml.kernel.org/g/533D01BD.1010200@googlemail.com
  patch -Np1 -i "${srcdir}/0011-kernfs-fix-removed-error-check.patch"

  # fix saa7134 video
  # https://bugs.archlinux.org/task/39904
  # https://bugzilla.kernel.org/show_bug.cgi?id=73361
  patch -Np1 -i "${srcdir}/0012-fix-saa7134.patch"

  # fix tun/openvpn performance
  # https://bugs.archlinux.org/task/40089
  # https://bugzilla.kernel.org/show_bug.cgi?id=74051
  patch -Np1 -i "${srcdir}/0013-net-Start-with-correct-mac_len-in-skb_network_protocol.patch"

  # fix xsdt validation bug
  # https://bugs.archlinux.org/task/39811
  # https://bugzilla.kernel.org/show_bug.cgi?id=73911
  patch -Np1 -i "${srcdir}/0015-fix-xsdt-validation.patch"

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
  fi

  # set extraversion to pkgrel
  sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # get kernel version
  make prepare

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make nconfig # new CLI menu for configuration
  #make xconfig # X-based configuration
  #make oldconfig # using old config from previous kernel version
  # ... or manually edit .config

  # rewrite configuration
  yes "" | make config >/dev/null

  # save configuration for later reuse
  if [ "${CARCH}" = "x86_64" ]; then
    cat .config > "${startdir}/config.x86_64.last"
  else
    cat .config > "${startdir}/config.last"
  fi
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  groups=('selinux')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26${_kernelname}=${pkgver}")
  conflicts=("kernel26${_kernelname}")
  replaces=("kernel26${_kernelname}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux-selinux.install

  cd "${srcdir}/${_srcname}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  provides=("kernel26${_kernelname}-headers=${pkgver}")
  conflicts=("kernel26${_kernelname}-headers")
  replaces=("kernel26${_kernelname}-headers")

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

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
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
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
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

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
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"
  provides=("kernel26${_kernelname}-docs=${pkgver}")
  conflicts=("kernel26${_kernelname}-docs")
  replaces=("kernel26${_kernelname}-docs")

  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

true && pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done

workaround_for_the_aur_webinterface='
pkgname="linux-selinux"
pkgdesc="The Linux-SELinux kernel and modules"
'

# vim:set ts=8 sts=2 sw=2 et:
