# Maintainer: Joey Pabalinas <alyptik@protonmail.com>
# Contributor: Matthew Wardrop <mister.wardrop@gmail.com>

pkgbase=linux-surfacepro3-rt
_srcname=linux-4.9.6
pkgver=${_srcname#linux-}
_rtver=rt4
pkgrel=2.25
arch=('i686' 'x86_64')
url="https://github.com/alyptik/linux-surfacepro3-rt"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'elfutils')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/projects/rt/${pkgver%.*}/older/patch-${pkgver}-${_rtver}.patch.xz"
        "https://www.kernel.org/pub/linux/kernel/projects/rt/${pkgver%.*}/older/patch-${pkgver}-${_rtver}.patch.sign"
        # Brain Fuck Scheduler & other personal patches
        'https://raw.githubusercontent.com/alyptik/linux-surfacepro3-rt/github/bfq.patch'
        'https://raw.githubusercontent.com/alyptik/linux-surfacepro3-rt/github/bfs.patch'
        'https://raw.githubusercontent.com/alyptik/linux-surfacepro3-rt/github/bfs-fixes1.patch'
        'https://raw.githubusercontent.com/alyptik/linux-surfacepro3-rt/github/bfs-fixes2.patch'
        'https://raw.githubusercontent.com/alyptik/linux-surfacepro3-rt/github/bfs-fixes3.patch'
        'init.patch' 'kconfig.patch' 'xattr.patch'
	'touchscreen_multitouch_fixes1.patch' 'touchscreen_multitouch_fixes2.patch'
	'wifi.patch'
        'multitouch.patch'
        'change-default-console-loglevel.patch'
        # the main kernel config files
        'config' 'config.x86_64' 'config.sp3'
        # standard config files for mkinitcpio ramdisk
        'linux.preset'
)

sha256sums=('f493af770a5b08a231178cbb27ab517369a81f6039625737aa8b36d69bcfce9b'
            'SKIP'
            'a5492f54815b759c661db94665d4fe6ef2518462e50258bf566ff1cb27886b78'
            'SKIP'
            '242d32d0fe819852e74d93b8a044cf24a40a9474d6f00ca93a19aa98298dcefa'
            '51f91681b708149fe91e565f5c40811477428e2aa86f8726a20e0e7c55c5407c'
            'cec65d71766429be99bdc9da7897584fdc4bf4df3a4b26d228ff55a76ea3d8ea'
            '48d0d2e549ceddc18a59cc5f0d9325db5727ac82a9a4829c99a781ce979e1a6d'
            '1a178463958f6b7f05a32c437f2674ecb25f2b1a0bf0cb2880d504efd8ba59c6'
            'ec655100ebc32d6699a258d7682953f928d1eb1042b895b04283d85ae57b80c1'
            'f479a5ca6abe4d50ca4c09e6e83a027369fcd3efff8d5ce60f0699d8fa47beb8'
            '4633ae19b9a9871a3cfffba98ec7c3cd240f64bef8a0eebcf1212219c80972fd'
            'cc78e8844d9ec4bd29cce392a3e4683061646e1ad7c100c4958a5cadabb25b52'
            '34b4e00ffcf9efc43ab47444d14febb94432d340d0f1d5bcd56153879d1be113'
            '52e7c895aeb505bc8d3b5321a346fcdbb749f8035cacc97a237c24c1f527adbc'
            '87bde6cc0f45629aa8406b364dfbbe2c59bce2621b451b6e504160f96cf9475f'
            '1256b241cd477b265a3c2d64bdc19ffe3c9bbcee82ea3994c590c2c76e767d99'
            '0fcd0b22fe9ec58ba41b81b463f68d619b6898a5c405fb26c85237a183240371'
            'ed9b9e6efaf4f23e7ae3406322b4d1d3080e8dbc7ab3f03bcbf728ca2010e21b'
            '33518bda35c07da11c8a48c4f62bb03cb6ad576001338c5ee27d320f815e59b6'
            'f0d90e756f14533ee67afda280500511a62465b4f76adcc5effa95a40045179c')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              'A2F5DE1C32B6B93E3E4884BF2E02D725AF202DC1' # Joey Pabalinas
             )

multitouch='y'
bcache='n'
bfs='n'
bfq='n'
personal='y'
sp3config='y'

_kernelname=${pkgbase#linux}

prepare() {
  cd "${srcdir}/${_srcname}"

  ##
  ## Options which are currently buggy/broken: BFS/BFQ patches and unsupported BCache module
  if [ "$bfq" = 'y' ]; then patch -p1 -i "${srcdir}/bfq.patch"; fi
  if [ "$bfs" = 'y' ]; then for i in bfs bfs-fixes{1..3}; do patch -p1 -i "${srcdir}/${i}.patch"; done; fi
  if [ "$bcache" = 'y' ]; then
    sed -i '\%^diff --git a/drivers/md/bcache/Kconfig b/drivers/md/bcache/Kconfig$%,+11 d' \
      "${srcdir}/patch-${pkgver}-${_rtver}.patch"
    cp "${srcdir}/linux-${pkgver}/include/linux/rwsem.h" "${srcdir}/linux-${pkgver}/drivers/md/bcache/"
    sed -i '/#include "bcache.h"/i #include "rwsem.h"\n' "${srcdir}/linux-${pkgver}/drivers/md/bcache/request.c"
  fi
  ## Options which are currently buggy/broken: BFS/BFQ patches and unsupported BCache module
  ##

  ## Add personal patches
  if [ "$personal" = 'y' ]; then for i in init kconfig xattr; do patch -p1 -i "${srcdir}/${i}.patch"; done; fi
  if [ "$multitouch" = 'y' ]; then patch -p1 -i "${srcdir}/multitouch.patch"; fi

  # Add RT patches
  patch -p1 -i ${srcdir}/patch-${pkgver}-${_rtver}.patch

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # This patch disables some wireless optimisations which cause trouble on Surface devices.
  patch -p1 -i "${srcdir}/wifi.patch"

  # These patches work around buggy hardware implementations
  # in the surface pro 3 touchscreen module.
  patch -p1 -i "${srcdir}/touchscreen_multitouch_fixes1.patch"
  patch -p1 -i "${srcdir}/touchscreen_multitouch_fixes2.patch"

  ## If sp3config='y' use personal config as a base
  if [ "$sp3config" = 'y' ]; then
    cat "${srcdir}/config.sp3" >./.config
  elif [ "$CARCH" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" >./.config
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

  # load configuration
  # Configure the kernel. Replace the line below with one of your choice.
  #make menuconfig # CLI menu for configuration
  #make xconfig # X-based configuration
  #make nconfig # new CLI menu for configuration
  #make olddefconfia # Use current kernel configuration
  # ... or manually edit .config

  printf '\n \033[32m %s \033[0m ' "[Run local([m]odconfig|[y]esconfig) or [s]kip? (m/y/S)]"; read -r; echo
  case $REPLY in
          [Mm]*) make localmodconfig ;;
          [Yy]*) make localyesconfig ;;
          *) printf ' \033[32m %s \n\033[0m ' "Continuing..." ;;
  esac

  printf '\n \033[32m %s \033[0m ' "[Run make ([n]config|[o]lddefconfig) or [s]kip? (n/o/S)]"; read -r; echo
  case $REPLY in
          [Nn]*) make nconfig ;; # new CLI menu for configuration
          [Oo]*) make olddefconfig ;;
          *) printf ' \033[32m %s \n\033[0m ' "Continuing..."; ;;
  esac

  # get kernel version
  make prepare

  # rewrite configuration
  yes "" | make config >/dev/null
}

build() {
  cd "${srcdir}/${_srcname}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
  [ "${pkgbase}" = "linux" ] && groups=('base')
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'xf86-input-libinput')
  optdepends=('crda: to set the correct wireless channels of your country')
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=linux.install

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
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
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
  # removed in 3.17 series
  # cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [ -f tools/objtool/objtool ];  then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool"
      cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/
  fi

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

  # remove a files already in linux-docs package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-01"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.recursion-issue-02"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild/Kconfig.select-break"
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

  cd "${srcdir}/${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
