# Maintainers:
#	Claire Farron <diesal3@googlemail.com>
#	Andes Ho <mxah002@live.rhul.ac.uk> (Secondary Package Tester)
# Former Maintainer(s)
#	Ido Rosen <ido@kernel.org>
#	xerc <aur[at]xerc.de>
# Contributor: tresor-patch-3.6.2_i686.patch and consolidation of patches
#	Seth Dickson <whefxlr@gmail.com>
# Contributor(s) of the linux PKGBUILD
#	Tobias Powalowski <tpowa@archlinux.org>
#	Thomas Baechler <thomas@archlinux.org>

### Do not edit below this line unless you know what you're doing

pkgbase=linux-lts-tresor    # Build stock -lts kernel with TRESOR patches
#pkgbase=linux-custom       # Build kernel with a different name
_srcname=linux-3.14
pkgname=linux-lts-tresor # placeholder
pkgdesc="Linux longterm stable kernel and modules with integrated TRESOR"
pkgver=3.14.48
pkgrel=1
arch=('i686' 'x86_64')
url="http://www1.informatik.uni-erlangen.de/tresor"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')

source=("https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.sign"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign"
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "${pkgbase}.preset"
        "${pkgbase}.install"
        'change-default-console-loglevel.patch'
		'0001-Bluetooth-allocate-static-minor-for-vhci.patch'
		'0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch'
		'0003-module-remove-MODULE_GENERIC_TABLE.patch'
		'0006-genksyms-fix-typeof-handling.patch'
        'http://www1.informatik.uni-erlangen.de/filepool/projects/tresor/tresor_sysfs.c'
		'gcc5_buildfixes.diff')
source_i686+=("http://www1.informatik.uni-erlangen.de/filepool/projects/tresor/tresor-patch-3.6.2_i686"
              'tresor-patch-3.6.2_i686.patch'
              'tresor-patch-3.6.2_i686.patch.asc')
source_x86_64+=("http://www1.informatik.uni-erlangen.de/filepool/projects/tresor/tresor-patch-3.8.2_aesni"
              'tresor-patch-3.8.2_aesni.patch'
              'tresor-patch-3.8.2_aesni.patch.asc')

sha256sums=('61558aa490855f42b6340d1a1596be47454909629327c49a5e4e10268065dffa'
            'SKIP'
            'd654e53b889fd9244ce2ec9d8ab4cb5fe68d0c4ae6a49efa517850cbd22ebcd5'
            'SKIP'
            '4e99472f8281b485a9ef3468de13e909597c9d921706b306fbb26960941d595e'
            '145a66ef4f702ed516a57d846dd00b5acac7b5cc1eff86d1e7ee6bd5a66040b2'
            '003b45593f1b5cdb81ea2da6ab67deef04402eb15aae231921ff55f65948fbdd'
            'edb6d4ed9ca2af1ffc15ddbf195152c219e77bd12da3ea176c5c24afc0a779d4'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '6d72e14552df59e6310f16c176806c408355951724cd5b48a47bf01591b8be02'
            '52dec83a8805a8642d74d764494acda863e0aa23e3d249e80d4b457e20a3fd29'
            '65d58f63215ee3c5f9c4fc6bce36fc5311a6c7dbdbe1ad29de40647b47ff9c0d'
            'cf2e7a2d00787f754028e7459688c2755a406e632ce48b60952fa4ff7ed6f4b7'
            'd6fcbd0ea7a5a4c42d326286b60bbd5b1d476b8a6752046fa28133e05351c1fe'
            '9c89039a0f876888fda3be6f574bca5a120e3587d8342747bbc0723b0b4cde7a')
sha256sums_i686=('9a286a85c16ca5b6a02419af1aedbfe6e8b89bcabdcb32670ead3f26c09eadfd'
                 '5a1b40d6702a91986a429e2e17100975c460e5761dc6d26620fd913c941fa98b'
                 'SKIP')
sha256sums_x86_64=('54009b369b95a77ab13f6dd7cdbe22b0785b6314cae3a6c39190b48f4c4b12ce'
                   '40d174c6aca8543b7e7796606d949f379be790755504c9f740bee0b9a81d8b84'
                   'SKIP')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '5F885602C7FD0951F565E27949F67298E6366A92' # Claire Farron
              '7BAAB17AF28252273C039775B481EC58DCE0E484' # Andes Ho
             )

[[ "$CARCH" = "i686" ]] && _tresorpatch="tresor-patch-3.6.2_i686"
[[ "$CARCH" = "x86_64" ]] && _tresorpatch="tresor-patch-3.8.2_aesni"

_kernelname=${pkgbase#linux}

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  patch -p1 -i "${srcdir}/patch-${pkgver}"

	# buildfixes for gcc5
	# https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/scsi/qla2xxx/qla_nx2.c?id=9493c2422cae272d6f1f567cbb424195defe4176
	# https://lkml.org/lkml/2014/11/9/27
	# https://lkml.org/lkml/2014/12/14/55
	patch -p1 -i "${srcdir}/gcc5_buildfixes.diff"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

	# Fix vhci warning in kmod (to restore every kernel maintainer's sanity)
	msg "Patching source to fix vhci warning in kmod"
	patch -p1 -i "${srcdir}/0001-Bluetooth-allocate-static-minor-for-vhci.patch"

	# Fix atkbd aliases
	msg "Patching source to fix atkbd aliases"
	patch -p1 -i "${srcdir}/0002-module-allow-multiple-calls-to-MODULE_DEVICE_TABLE-p.patch"
	patch -p1 -i "${srcdir}/0003-module-remove-MODULE_GENERIC_TABLE.patch"

	# Fix generation of symbol CRCs
	# http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dc53324060f324e8af6867f57bf4891c13c6ef18
	msg "Patching source to fix generation of symbol CRCs"
	patch -p1 -i "${srcdir}/0006-genksyms-fix-typeof-handling.patch"

  # TRESOR Runs Encryption Securely Outside RAM
  # i.e. the purpose of this package :-)
  msg "Patching TRESOR for linux"

  # Initialized the patched TRESOR file with the upstream patch.
  cp "${srcdir}/${_tresorpatch}" "${_tresorpatch}.patched"
  patch --follow-symlinks "${_tresorpatch}.patched" "${srcdir}/${_tresorpatch}.patch"

  msg "Patching source with TRESOR"
  patch -p1 -i "${_tresorpatch}.patched"

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

  cd "${srcdir}"
  cc tresor_sysfs.c -o tresor_sysfs

  cd "${srcdir}/${_srcname}"

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
  #yes "" | make config >/dev/null
  make oldconfig

  # save configuration for later reuse
#  if [ "${CARCH}" = "x86_64" ]; then
#    cat .config > "${startdir}/config.x86_64.last"
#  else
#    cat .config > "${startdir}/config.last"
#  fi
}

build() {
  cd "${srcdir}/${_srcname}"

	make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
  true && pkgdesc="The ${pkgbase/linux/Linux} kernel and modules - stable longtime supported with integrated TRESOR"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country')
  provides=("kernel26${_kernelname}=${pkgver}")
  conflicts=("kernel26${_kernelname}")
  replaces=("kernel26${_kernelname}")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")
  install=${pkgbase}.install

  # TRESOR sysfs utility - not necessary but nice to have, in case someone
  # enables CONFIG_TRESOR_SYSFS in a fork of this PKGBUILD...
  cd "${srcdir}"
  install -D -m755 tresor_sysfs "${pkgdir}/usr/bin/tresor_sysfs"

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
  install -D -m644 "${srcdir}/${pkgbase}.preset" \
    "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
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
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" \
    "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > \
    "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

_package-headers() {
  true && pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
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
    cp arch/${KARCH}/Makefile_32.cpu \
      "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

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
  cp drivers/media/dvb-core/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

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
  true && pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"
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

# true && is a workaround for AUR problem with split packages:
true && pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    _package${_p#${pkgbase}}
  }"
done
