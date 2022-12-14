# Maintainer: Simao Gomes Viana <devel@superboring.dev>
# Packager: Simao Gomes Viana <devel@superboring.dev>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Jonathan Chan <jyc@fastmail.fm>
# Contributor: misc <tastky@gmail.com>
# Contributor: NextHendrix <cjones12 at sheffield.ac.uk>
# Contributor: Shun Terabayashi <shunonymous at gmail.com>
# Contributor: Brad McCormack <bradmccormack100 at gmail.com>
# Contributor: Doug Johnson <dougvj at dougvj.net>

pkgbase=linux-nitrous
_srcname=linux-nitrous
pkgver=6.1.0
pkgrel=1
arch=('x86_64')
url="https://gitlab.com/xdevs23/linux-nitrous"
license=('GPL2')
makedepends=('bison' 'clang>=13' 'llvm>=13' 'lld>=13' 'xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'libelf' 'coreutils' 'rust')
options=('!strip')
source=('git+https://gitlab.com/xdevs23/linux-nitrous.git#tag=v'"$pkgver-$pkgrel"
        # standard config files for mkinitcpio ramdisk
        "${_srcname}.preset")
sha256sums=('SKIP'
            '59cf1dfe08c144868ad87705dd62a0400921c042b1e12691e42cf214fe9a9402')

_kernelname=${pkgbase#linux}

clang_major_ver() {
  clang --version | head -n1 | cut -d ' ' -f3 | cut -d '.' -f1
}

make_env_variant=""
make_with_lto="make CC=clang HOSTCC=clang NM=llvm-nm AR=llvm-ar HOSTLD=ld.lld LD=ld.lld OBJCOPY=llvm-objcopy STRIP=llvm-strip"
# "Modern performance" – modifies the config to enable
# performance tuned to your specific machine (native-intel or native-amd)
USE_MPERFORMANCE=${USE_MPERFORMANCE:=false}
# "Ancient" config – for older machines
FOR_ANCIENT=${FOR_ANCIENT:=false}

pkgver() {
  echo ${pkgver}
}

prepare() {
  :
}

_handle_lsmod() {
  if [ -f "$HOME/.config/modprobed.db" ]; then
    make HOSTCC=clang CC=clang LSMOD=$HOME/.config/modprobed.db localmodconfig
  fi
}

build() {
  cd "${_srcname}"

  # On Clang 11+ we *can* use LTO but we *don't* on desktop variants
  # since DKMS will have trouble with it (and even if it doesn't,
  # the modules won't work if you mix LTO with non-LTO)
  # We will use the right env anyway.
  make_env_variant="$make_with_lto"

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  _defconfig="nitrous_defconfig"

  rm -f .clang
  $make_env_variant $_defconfig
  _handle_lsmod

  if $USE_MPERFORMANCE; then
    local cpu_vendor="$(lscpu | grep "Vendor ID" | head -n1 | cut -d ':' -f2 | awk '{ print $1 }')"
    cpu_type="AMD"
    if [ "$cpu_vendor" == "GenuineIntel" ]; then
      cpu_type="INTEL"
    elif [ "$cpu_vendor" == "AuthenticAMD" ]; then
      cpu_type="AMD"
    fi
    # Enable native compilation
    sed -i -re "s/CONFIG_MSKYLAKE=y/# CONFIG_MSKYLAKE is not set/g" .config
    sed -i -re 's/CONFIG_LOCALVERSION=.*/CONFIG_LOCALVERSION="-nitrous-mperformance"/g' .config
    echo "CONFIG_MNATIVE_${cpu_type}=y" >> .config
  fi

  makeflags="${MAKEFLAGS}"
  if [[ "$MAKEFLAGS" != *"-j"* ]]; then
    makeflags="$makeflags -j$(nproc --all)"   
  fi
  $make_env_variant ${makeflags} bzImage modules
}

_package() {
  pkgdesc="Modified Linux kernel optimized for Haswell (and newer) compiled using clang (tagged git version), with Clear Linux patches"
  depends=('coreutils' 'kmod' 'initramfs')
  optdepends=(
    'crda: to set the correct wireless channels of your country'
    "linux-nitrous-headers=${pkgver}-${pkgrel}: to build DKMS modules against this kernel"
    'linux-firmware: Additional firmware blobs'
  )
  provides=(WIREGUARD-MODULE NTFS3-MODULE)
  __kernelname=linux-nitrous
  backup=("etc/mkinitcpio.d/linux-nitrous.preset")
  install=${pkgbase}.install

  cd "${_srcname}"

  make_env_variant="$make_with_lto"

  KARCH=x86

  # get kernel version
  _kernver="$(make kernelrelease)"
  _basekernel=${_kernver%%-*}
  _basekernel=${_basekernel%.*}

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  $make_env_variant INSTALL_MOD_PATH="${pkgdir}" modules_install

  local modulesdir="$pkgdir/lib/modules/${_kernver}"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  # Also initramfs generators are using this for install/remove/upgrade detection
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${__kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${__kernelname}.preset" "${pkgdir}/etc/mkinitcpio.d/${__kernelname}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${__kernelname}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${__kernelname}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${__kernelname}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${__kernelname}.preset"

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

  # add System.map
  install -D -m644 System.map "${pkgdir}/boot/System.map-${_kernver}"

  rm -f "${pkgdir}/"*.pkg.tar*
}

_package-headers() {
  pkgdesc="Header files and scripts for building modules for Linux kernel (tagged git version)"

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"
  mkdir -p "${pkgdir}/usr/lib/modules/build/"{include,arch/x86}


  cd "${_srcname}"

  # Fix for DKMS because clang doesn't like this
  # and to disable LTO
  for f in Makefile kernel/Makefile; do
    sed -i -re '/^.*[+]?= *(-Qunused-arguments|-mno-global-merge|-ftrivial-auto-var-init=pattern|-Wno-initializer-overrides|-Wno-gnu|-mretpoline.*|-ftrivial-auto-var-init=zero|-Wno-format-invalid-specifier|-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang|-flto(=[a-z]+)?)$/d' $f
    sed -i -re 's/-flto(=([a-z]+)?)//g' $f
  done
  echo -e "\nKBUILD_CFLAGS += -Wno-error -Wno-unused-variable -Wno-incompatible-pointer-types" >> Makefile
  echo -e "\nCONFIG_LTO := n" >> Makefile
  echo -e "\nLD = ld.lld" >> Makefile
  sed -i -re 's/^(.*(_|[A-Z]+)LTO(_.*)?)=y/\1=n/g' .config
  echo "CONFIG_LTO_NONE=y" >> .config

  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in $(ls include/); do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" || :
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # Fix file conflict with -doc package
  rm "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/kbuild"/Kconfig.*-*

  # Add objtool for CONFIG_STACK_VALIDATION
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"
  cp -a tools/objtool "${pkgdir}/usr/lib/modules/${_kernver}/build/tools"

  chown -R root:root "${pkgdir}/usr/lib/modules/${_kernver}/build"
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
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,csky,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,nds32,nios2,openrisc,parisc,powerpc,ppc,riscv,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}

  rm -f "${pkgdir}/"*.pkg.tar*
}

_package-docs() {
  pkgdesc="Kernel hackers manual - HTML documentation that comes with the Linux kernel (tagged git version)"

  cd "${_srcname}"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}" -type f -exec chmod 444 {} \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # remove files already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/Kconfig"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
