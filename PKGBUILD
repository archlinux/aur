# Maintainers:
#	Claire Farron <diesal3@googlemail.com> (Submitter)
#	Andes Ho <mxah002@live.rhul.ac.uk> (Secondary Package Tester)
# Contributors of the linux PKGBUILD
#	Tobias Powalowski <tpowa@archlinux.org>
#	Thomas Baechler <thomas@archlinux.org>
# Contributor of the -ck PKGBUILD
#	graysky <graysky AT archlinux DOT us>
# Contributor of PKGBUILD fixes
#	fsckd <fsckdaemon -at- gmail dot com>

### Do not edit below this line unless you know what you're doing

pkgname=linux-lts312
_pkgname=${pkgname}
_kernelname=${_pkgname#linux}
_basekernel=3.12
true && pkgname=(${_pkgname} ${_pkgname}-headers)
pkgver=3.12.40
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
source=("https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign"
        'linux-lts312.preset'
        'change-default-console-loglevel.patch'
        'config' 'config.x86_64'
        'criu-no-expert.patch'
        '0001-nfs-sunrpc-create-a-new-dummy-pipe-for-gssd-to-hold.patch'
        '0002-nfs-sunrpc-replace-sunrpc_net-gssd_running-flag-with.patch'
        '0003-nfs-check-if-gssd-is-running-before-attempting-to-us.patch'
        '0004-nfs-rpc_pipe-remove-the-clntXX-dir-if-creating-the-p.patch'
        '0005-nfs-sunrpc-add-an-info-file-for-the-dummy-gssd.patch'
        '0006-nfs-rpc_pipe-fix-cleanup-of-dummy-gssd-directory-whe.patch')

sha256sums=('2e120ec7fde19fa51dc6b6cc11c81860a0775defcad5a5bf910ed9a50e845a02'
            'SKIP'
            '16b14d54a638b4f5c7c65acf630f79a70c6588c2b893d84996f7b30f4f7f7aa4'
            'SKIP'
            'cdad2ad2f3165be86d903f37f6e761f1707cba51bccb802e08ae259445113cad'
            'faced4eb4c47c4eb1a9ee8a5bf8a7c4b49d6b4d78efbe426e410730e6267d182'
            '49125a441a42726eb796d4a20c14c99d7afb02b311356b82973ad52448e98e88'
            '1b6a52b8bbc552f058b25c26393b15b755ed71f6870abe913397863fde32cc46'
            'daa75228a4c45a925cc5dbfeba884aa696a973a26af7695adc198c396474cbd5'
            '6ed0d7b259dca7a3cb4ed5cba10e87d2f9b29ecab6438e47f70d6961cc0eb665'
            '3e3a2f5531b18fa6494bf1d555be981aef288c5d74480569d907629be06b54b3'
            '52d8d897e2a2a1605a904d200ff123b453f2edbeebe623480bf5ee58d87ac4e2'
            'df5c98b5719b97accbee16d387b81781cd9694801cf1f1d831fdf5069942fda1'
            'ed41c98da84dc0003777edca3101d4923be76701d6b494cd7c512a4da39de710'
            'b54af31bf32ea47dd47c48113481cc3288c04d844f5b4814663b108f43f415a7')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

prepare() {
  cd "${srcdir}/linux-${_basekernel}"

  # add upstream patch
  msg "Patching source to v$pkgver"
  patch -p1 -i "${srcdir}/patch-${pkgver}"

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git

  # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
  # remove this when a Kconfig knob is made available by upstream
  # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
  patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

  # allow criu without expert option set
  # patch from fedora
  patch -Np1 -i "${srcdir}/criu-no-expert.patch"
	
  # fix 15 seocnds nfs delay
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=4b9a445e3eeb8bd9278b1ae51c1b3a651e370cd6
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=89f842435c630f8426f414e6030bc2ffea0d6f81
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=6aa23d76a7b549521a03b63b6d5b7880ea87eab7
  # fix nfs kernel oops
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=3396f92f8be606ea485b0a82d4e7749a448b013b
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=e2f0c83a9de331d9352185ca3642616c13127539
  # http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=23e66ba97127ff3b064d4c6c5138aa34eafc492f
  msg "Patching source with NFS patches"
  for p in $(ls ${srcdir}/000{1,2,3,4,5,6}-nfs*.patch); do
    msg " $p"
    patch -Np1 -i "$p"
  done

  # Clean tree and copy ARCH config over
  msg "Running make mrproper to clean source tree"
  make mrproper

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
  #yes "" | make config >/dev/null
  make oldconfig

  # save configuration for later reuse
  if [ "${CARCH}" = "x86_64" ]; then
    cat .config > "${startdir}/config.x86_64.last"
  else
    cat .config > "${startdir}/config.last"
  fi
}

build() {
  cd "${srcdir}/linux-${_basekernel}"

  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-lts312() {
  pkgdesc='The linux-lts312 kernel and modules - 3.12 longterm stable kernel'
  #_Kpkgdesc='The linux-lts312 kernel and modules - 3.12 longterm stable kernel'
  #pkgdesc="${_Kpkgdesc}"
  depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
  optdepends=('crda: to set the correct wireless channels of your country' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
  backup=("etc/mkinitcpio.d/linux-lts312.preset")
  install=linux-lts312.install

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts312"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts312/g" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/linux-lts312.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts312.preset"
  sed \
    -e "1s|'linux.*'|'linux-lts312'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts312\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts312.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts312-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/linux-lts312.preset"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # gzip -9 all modules to save 100MB of space
  find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:lts312}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts312}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts312}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 
}

package_linux-lts312-headers() {
  pkgdesc='Header files and scripts to build modules for linux-lts312.'
  #_Hpkgdesc='Header files and scripts to build modules for linux-lts312.'
  #pkgdesc="${_Hpkgdesc}"
  depends=('linux-lts312') # added to keep kernel and headers packages matched

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/linux-${_basekernel}"
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

  # add headers for lirc package
  # pci
  for i in bt8xx cx88 saa7134; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
    cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
  done
  # usb
  for i in cpia2 em28xx pwc sn9c102; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/${i}"
    cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/${i}"
  done
  # i2c
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c"
  cp drivers/media/i2c/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  for i in cx25840; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
    cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
  done

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
  [[ -n $(ls include/config/dvb/*.h &>/dev/null) ]] && cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
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
  rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc="The ${_pkgname} kernel and modules - 3.12 longterm stable kernel"
