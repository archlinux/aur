#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>
#Credits: Luca Stefani <luca.stefani.ge1@gmail.com>

################################# Arch ################################

ARCH=x86

################################# Grep GCC version ################################

_gccversion=$(gcc -dumpversion)

################################# CC/CXX/HOSTCC/HOSTCXX ################################

#Set kernel to build with LLVM/CLANG
BUILD_FLAGS=(CC=clang CXX=clang++ HOSTCC=clang HOSTCXX=clang++ LD=ld.lld LLVM=1 LLVM_IAS=1)

###################################################################################

pkgbase=linux-llvm
pkgver=6.6.0
_pkgver=6.6
pkgrel=1
major=6.6
commit=3175f498d244950892b9c8ef2c3093d01a491047
arch=(x86_64)
url='https://www.kernel.org/'
license=(GPL2)
makedepends=(bc cpio gettext git libelf pahole perl python tar xz kmod xmlto)
makepends+=(graphviz imagemagick python-sphinx texlive-latexextra) # htmldocs
makedepends+=(bison flex zstd make patch gcc gcc-libs glibc binutils)
makedepends+=(clang llvm llvm-libs lld python)
options=(!strip)

archlinuxpath=https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/$commit

source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz
        ${archlinuxpath}/config
        # Arch patches
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        0002-drivers-firmware-skip-simpledrm-if-nvidia-drm.modese.patch)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd ${srcdir}/linux-$_pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  plain ""

  # Copy the config file first
  # Copy "${srcdir}"/config to "${srcdir}"/linux-${_pkgver}/.config
  msg "Copy "${srcdir}"/config to "${srcdir}"/linux-$_pkgver/.config"
  cp "${srcdir}"/config .config

  sleep 2s

  plain ""

  #  # Remove gcc-plugin if gcc version = 13.0.0
  #  if [[ "$_gccversion" = "13.0.0" ]]; then
  #
  #    msg "Remove GCC_PLUGINS"
  #    scripts/config --disable CONFIG_HAVE_GCC_PLUGINS
  #    scripts/config --disable CONFIG_GCC_PLUGINS
  #
  #    sleep 2s
  #    plain ""
  #  fi

  # Set LTO with CLANG/LLVM

  msg "Enable THIN LTO"
  scripts/config --enable CONFIG_LTO
  scripts/config --enable CONFIG_LTO_CLANG
  scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
  scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
  scripts/config --disable CONFIG_LTO_NONE
  scripts/config --enable CONFIG_HAS_LTO_CLANG
  scripts/config --disable CONFIG_LTO_CLANG_FULL
  scripts/config --enable CONFIG_LTO_CLANG_THIN
  scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

  #msg "Enable FULL LTO"
  #scripts/config --enable CONFIG_LTO
  #scripts/config --enable CONFIG_LTO_CLANG
  #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
  #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
  #scripts/config --disable CONFIG_LTO_NONE
  #scripts/config --enable CONFIG_HAS_LTO_CLANG
  #scripts/config --enable CONFIG_LTO_CLANG_FULL
  #scripts/config --disable CONFIG_LTO_CLANG_THIN
  #scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

  #msg "Disable LTO"
  #scripts/config --enable CONFIG_LTO_NONE

  sleep 2s

  plain ""

  msg "Apply some Archlinux config"

  msg2 "Compress modules by default (following Arch's kernel)"
  scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD

  sleep 2s

  msg2 "CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team"
  scripts/config --enable CONFIG_STACK_VALIDATION

  sleep 2s

  msg2 "Enable IKCONFIG following Arch's philosophy"
  scripts/config --enable CONFIG_IKCONFIG
  scripts/config --enable CONFIG_IKCONFIG_PROC

  sleep 2s

  msg2 "Enable FUNCTION_TRACER/GRAPH_TRACER"
  scripts/config --enable CONFIG_FUNCTION_TRACER
  scripts/config --enable CONFIG_STACK_TRACER

  sleep 2s

  msg2 "Enable CONFIG_USER_NS_UNPRIVILEGED"
  scripts/config --enable CONFIG_USER_NS

  sleep 2s

  plain ""

  msg "Supress depmod"
  sed -i '2iexit 0' scripts/depmod.sh

  sleep 2s

  plain ""

  # Setting localversion
  msg "Setting localversion..."
  # --save-scmversion as been removed in upstream
  # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/setlocalversion?h=v6.3-rc1&id=f6e09b07cc12a4d104bb19fe7566b0636f60c413
  # scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  plain ""

  # Config
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} olddefconfig

  plain ""

  make -s kernelrelease > version
  msg "Prepared $pkgbase version $(<version)"

  plain ""
}

build(){
  cd ${srcdir}/linux-$_pkgver

  msg "make -j$(nproc) all..."
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
}

_package(){
  pkgdesc='The Linux kernel and modules - Build with LLVM/CLANG'
  depends=(coreutils initramfs kmod)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd ${srcdir}/linux-$_pkgver

  local kernver="$(<version)"
  local modulesdir="${pkgdir}"/usr/lib/modules/${kernver}

  msg "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg "Installing modules..."
  ZSTD_CLEVEL=19 make ARCH=${ARCH} ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # remove build and source links
  msg "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the $pkgbase package"
  depends=("${pkgbase}" pahole)

  cd ${srcdir}/linux-$_pkgver

  local builddir="$pkgdir"/usr/lib/modules/"$(<version)"/build

  msg "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map *localversion* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
  fi

  msg "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  msg "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -Sib "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  msg "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

sha256sums=('d926a06c63dd8ac7df3f86ee1ffc2ce2a3b81a2d168484e76b5b389aba8e56d0'
            'd2060f5045a30832d70a7747c780f1358a9f4cfc1811c8ccaeaab9c027b59ee4'
            '5d5a766ea646d6b6e64f56867cbd10c64704107ac6f15123387c4b65e49d71c3'
            'cf80842fc0b2df079905c3212faeecddde7a4c4fd0742364564f10df4f7f6aa3')

pkgname=($pkgbase $pkgbase-headers)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
