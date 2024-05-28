#Maintainer: archdevlab <https://github.com/archdevlab>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#Credits: Andreas Radke <andyrtr@archlinux.org>

################################# Arch ################################

ARCH=x86

################################# Grep GCC version ################################

_gccversion=$(gcc -dumpversion)

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

pkgbase=linux-baby
pkgver=6.7.12
_pkgver=6.7.12
pkgrel=1
major=6.7
commit=0bd29eb1601f9b1d256cf8b402ba7d5e2a04b441
arch=(x86_64)
url='https://www.kernel.org/'
license=(GPL-2.0-only)
makedepends=(
  bc
  cpio
  gettext
  libelf
  pahole
  perl
  python
  tar
  xz
  kmod
  xmlto
  # htmldocs
  graphviz
  imagemagick
  python-sphinx
  python-yaml
  texlive-latexextra
)
makedepends+=(
  bison
  flex
  zstd
  make
  patch
  gcc
  gcc-libs
  glibc
  binutils
  git
)
if [[ "$_compiler" = "2" ]]; then
  makedepends+=(
    clang
    llvm
    llvm-libs
    lld
    clang
    python
  )
fi
options=(
  !debug
  !strip
)
archlinuxpath=https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/$commit
source=(https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$_pkgver.tar.xz
        ${archlinuxpath}/config
        # Arch patches
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        0002-drivers-firmware-skip-simpledrm-if-nvidia-drm.modese.patch
        0003-arch-Kconfig-Default-to-maximum-amount-of-ASLR-bits.patch
        # BABY CPU Scheduler
        0001-initial-baby-6.7.y-commit-Thu-Mar-21-04-32-59-PM-03-.patch
        0002-added-yield-from-tt.patch
        0003-added-lat_sensitive.patch
        0004-added-entity_end_min_slice-with-min-slice-7us.patch
        0005-fix-update-candidate-to-pick-cfs_rq-head.patch
        0006-make-quota-for-preempted-task-preserved.patch
        0007-change-bs_shared_quota-to-105us.patch
        0008-port-select_task_fair-from-TT.patch
        0009-Fix-missing-sched_idle_cpu-when-enabling-NUMA.patch
        0010-fair_group-and-autogroup-must-be-disabled-by-default.patch)

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
  msg "Copy the config file first..."
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

  if [[ "$_compiler" = "2" ]]; then

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
  fi

  # Supress depmod
  msg "Supress depmod..."
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
  msg "make olddefconfig..."
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} olddefconfig

  plain ""

  make -s kernelrelease > version
  msg "Prepared $pkgbase version $(<version)"

  plain ""
}

build(){
  cd ${srcdir}/linux-$_pkgver

  msg "make all"
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) all
  msg "make -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1"
  make ARCH=${ARCH} ${BUILD_FLAGS[*]} -j$(nproc) -C tools/bpf/bpftool vmlinux.h feature-clang-bpf-co-re=1
}

_package(){
  pkgdesc='The Linux kernel and modules - With BABY CPU Scheduler by Hamad Al Marri'
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )
  provides=(
    KSMBD-MODULE
    VIRTUALBOX-GUEST-MODULES
    WIREGUARD-MODULE
  )
  replaces=(
    virtualbox-guest-modules-arch
    wireguard-arch
  )

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
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map *localversion* version vmlinux tools/bpf/bpftool/vmlinux.h
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

  msg "Installing Kconfig files..."
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

sha256sums=('6c2979e3948806a0dbacba193f8453ea42c179c1eb9f6136e3c35d87e5707984'
            '04143712e593d45a597661fe00f89cf92d52c62df3468c68a46c952c2ef4db64'
            'aeb197c66194491abac9c25fea4d10d2475a54d192ed99b91bc25b2881a22dd3'
            '45f9a013518e1fab0abaeddb3c65cc767fc8816809d44158009bc2ac969216e7'
            'f58ac52150003e61210a8254b2235fc8a0e9bc5a91621e9407f3a6b841b0a964'
            'd33e3f8781ce2ff5ab381129b20eb8f0cc3cbf4171655af6945d75f2a2231f83'
            '3d7b8d1e9d677210b365da6193e6ee3ec294092ee0a6bae025bfb4bb967b0950'
            '585f895a260a53bcfb02b39e059fbb23627c3002aaf8a9ea6b333560dd244d22'
            '4b17bbd832f37f29900abd1bd6e143157714424beb8f2e719d634a2808bdbd08'
            'ef22fb9d816770f7186b594ff067560ab07a44986f713ab48be131d6a3ebf3eb'
            'c279015e0ed1ce30026c7ec4d7119cf7a14bde8a9ef94fced9b9f25f44c96154'
            '4e5fd316f0ea661254ef29a5f23c611f3e6bbb73983a10ba22731da574a8c63a'
            '0fbf457173232f9f31e0bb5ab4a48b6f48bb45830994ac0b88c7327c34b26291'
            'bf440d4290a80ac267ee04790e9ec545facb4564f6bb6ff89b1ff983b1cfe287'
            '09271c58da92d0cb5792461ae1a17fbf7ae5ae422592866ab0ab7898da538764')

pkgname=($pkgbase $pkgbase-headers)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
