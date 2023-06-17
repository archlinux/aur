#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>
#Credits: Peter Jung ptr1337 <admin@ptr1337.dev> && Piotr Gorski <piotrgorski@cachyos.org>
#Credits: Tobias Powalowski <tpowa@archlinux.org>
#Credits: Thomas Baechler <thomas@archlinux.org>

################################# Arch ################################

ARCH=x86

################################# CC/CXX/HOSTCC/HOSTCXX ################################

#Set compiler to build the kernel
#Set '1' to build with GCC
#Set '2' to build with CLANG and LLVM
#Default is empty. It will build with GCC. To build with different compiler just use : env _compiler=(1 or 2) makepkg -s
if [ -z ${_compiler+x} ]; then
  _compiler=
fi

if [[ "$_compiler" = "1" ]]; then
  _compiler=1
  BUILD_FLAGS=(CC=gcc CXX=g++ HOSTCC=gcc HOSTCXX=g++)
elif [[ "$_compiler" = "2" ]]; then
  _compiler=2
  BUILD_FLAGS=(CC=clang CXX=clang++ HOSTCC=clang HOSTCXX=clang++ LD=ld.lld LLVM=1 LLVM_IAS=1)
else
  _compiler=1
  BUILD_FLAGS=(CC=gcc CXX=g++ HOSTCC=gcc HOSTCXX=g++)
fi

###################################################################################

pkgbase=linux-bore
pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
pkgver=6.3.8
_pkgver=6.3.8
pkgrel=1
major=6.3
commit=e7308a977d83f3cf94ed228b0f6b9b65a4d9139c
arch=(x86_64)
pkgdesc='The Linux kernel and modules with Masahito Suzuki BORE CPU scheduler and Arch patches'
url='https://www.kernel.org/'
license=(GPL2)
makedepends=(bc kmod libelf pahole cpio perl tar xz xmlto git)
makedepends+=(bison flex zstd make patch gcc gcc-libs glibc binutils)
if [[ "$_compiler" = "2" ]]; then
  makedepends+=(clang llvm llvm-libs lld python)
fi
options=(!strip)

archlinuxpath=https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/$commit
patchpath=https://raw.githubusercontent.com/blacksky3/patches/main/$major
patchpathbore=https://raw.githubusercontent.com/blacksky3/patches/main/

source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz
        ${archlinuxpath}/config
        # PRJC patch
        0001-linux6.1.y-bore2.4.0.patch
        0002-constgran-vanilla-max.patch
        # Arch patches
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch)

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
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  plain ""

  # Copy the config file first
  # Copy "${srcdir}"/config to "${srcdir}"/linux-${_pkgver}/.config
  msg2 "Copy "${srcdir}"/config to "${srcdir}"/linux-$_pkgver/.config"
  cp "${srcdir}"/config .config

  sleep 2s

  plain ""

  # Remove gcc-plugin if gcc version = 13.0.0
  if [[ "$_gccversion" = "13.0.0" ]]; then

    msg2 "Remove GCC_PLUGINS"
    scripts/config --disable CONFIG_HAVE_GCC_PLUGINS
    scripts/config --disable CONFIG_GCC_PLUGINS

    sleep 2s
    plain ""
  fi

  # Set LTO with CLANG/LLVM
  if [[ "$_compiler" = "2" ]]; then

    msg2 "Enable THIN LTO"
    scripts/config --enable CONFIG_LTO
    scripts/config --enable CONFIG_LTO_CLANG
    scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
    scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
    scripts/config --disable CONFIG_LTO_NONE
    scripts/config --enable CONFIG_HAS_LTO_CLANG
    scripts/config --disable CONFIG_LTO_CLANG_FULL
    scripts/config --enable CONFIG_LTO_CLANG_THIN
    scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

    #msg2 "Enable FULL LTO"
    #scripts/config --enable CONFIG_LTO
    #scripts/config --enable CONFIG_LTO_CLANG
    #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG
    #scripts/config --enable CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN
    #scripts/config --disable CONFIG_LTO_NONE
    #scripts/config --enable CONFIG_HAS_LTO_CLANG
    #scripts/config --enable CONFIG_LTO_CLANG_FULL
    #scripts/config --disable CONFIG_LTO_CLANG_THIN
    #scripts/config --enable CONFIG_HAVE_GCC_PLUGINS

    #msg2 "Disable LTO"
    #scripts/config --enable CONFIG_LTO_NONE

    sleep 2s
    plain ""
  fi

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

  msg "Patch addition config"

  msg2 "Enable BORE CPU scheduler"
  scripts/config --enable CONFIG_SCHED_BORE

  sleep 2s

  plain ""

  msg2 "Supress depmod"
  sed -i '2iexit 0' scripts/depmod.sh

  sleep 2s

  plain ""

  # Setting localversion
  msg2 "Setting localversion..."
  # --save-scmversion as been removed in upstream
  # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/scripts/setlocalversion?h=v6.3-rc1&id=f6e09b07cc12a4d104bb19fe7566b0636f60c413
  # scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  plain ""

  # Config
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} olddefconfig
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} olddefconfig
  fi

  plain ""

  make -s kernelrelease > version
  msg2 "Prepared $pkgbase version $(<version)"

  plain ""
}

build(){
  cd ${srcdir}/linux-$_pkgver

  # make -j$(nproc) all
  msg2 "make -j$(nproc) all..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
  fi
}

_package(){
  pkgdesc='The Linux kernel and modules with Masahito Suzuki BORE CPU scheduler and Arch patches'
  depends=(coreutils kmod initramfs)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd ${srcdir}/linux-$_pkgver

  local kernver="$(<version)"
  local modulesdir="${pkgdir}"/usr/lib/modules/${kernver}

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  #install -Dm644 arch/${ARCH}/boot/bzImage "$modulesdir/vmlinuz"
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  if [[ "$_compiler" = "1" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  elif [[ "$_compiler" = "2" ]]; then
    make ARCH=${ARCH} ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install
  fi

  # remove build and source links
  msg2 "Remove build dir and source dir..."
  rm -rf "$modulesdir"/{source,build}
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the $pkgbase package"
  depends=("${pkgbase}" pahole)

  cd ${srcdir}/linux-$_pkgver

  local builddir="$pkgdir"/usr/lib/modules/"$(<version)"/build

  msg2 "Installing build files..."
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

  msg2 "Installing headers..."
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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    msg2 "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

sha256sums=('4323d421250e2e444c35d36f4aa8ddb56591dedc25c68d359d19c4ef9dd20955'
            '6508516de94ed941ae755d89807610dc51fe1229dbfecdf8a82604a8d33242ce'
            'e788c1d25df2ffa710c3be4786dd477a82e8271d2950ddca89b56957035b4a5f'
            '466d7231d2bba65edb53da48e0ec444499e4ba526e9067b517fb78bf09973486'
            'd4edb692d0a1772af639730d898282e92a3c06acc46e5a55429315b2a5763e82')
