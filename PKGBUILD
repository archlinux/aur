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

pkgbase=linux-echo
pkgver=6.9.0
_pkgver=6.9
pkgrel=1
major=6.9
commit=1e29f0ecf2221b2fbf580752f42ab5040d88b5e0
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
        0004-docs-kernel_include.py-Fix-build-with-docutils-0.21..patch
        # ECHO
        # All commits from Hamad Al Marri in the linux-6.8.y-echo branch
        # Some commits are not in the official path from the  ECHO-CPU-Scheduler repo
        0001-initial-baby-6.7.y-commit-Thu-Mar-21-04-32-59-PM-03-.patch
        0002-added-yield-from-tt.patch
        0003-added-lat_sensitive.patch
        0004-added-entity_end_min_slice-with-min-slice-7us.patch
        0005-fix-update-candidate-to-pick-cfs_rq-head.patch
        0006-make-quota-for-preempted-task-preserved.patch
        0007-change-bs_shared_quota-to-105us.patch
        0008-port-select_task_fair-from-TT.patch
        0009-ECHO-Scheduler.patch
        0010-Fix-missing-sched_idle_cpu-when-enabling-NUMA.patch
        0011-fair_group-and-autogroup-must-be-disabled-by-default.patch
        0012-add-help-in-HZ_625-config.patch
        0013-port-to-6.8.y.patch
        0014-add-CONFIG_ECHO_SCHED.patch
        0015-removed-lat_sens.patch
        0016-ECHO-CPU-scheduler-v6.8.patch
        0017-Change-the-shared-quota-from-105us-to-500ns.patch
        0018-RR_TIMESLICE-to-1ms.patch
        0019-Revert-RR_TIMESLICE-to-1ms.patch
        0020-35us-for-shared-quota-seems-better-suited-for-defaul.patch
        0021-sysctl_sched_base_slice-to-4200ULL.patch
        0022-disable-NO_HZ_FULL-there-is-a-bug-in-ECHO-that-keep-.patch)

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

  # Setup ECHO
  # https://github.com/hamadmarri/ECHO-CPU-Scheduler?tab=readme-ov-file#defaults-and-sysctls
  msg "Setup ECHO"

  # Enable ECHO
  msg2 "Enable ECHO CPU Scheduler"
  scripts/config --enable CONFIG_ECHO_SCHED

  sleep 2s

  msg2 "Enable CONFIG_HZ_625"
  scripts/config --disable CONFIG_HZ_300
  scripts/config --enable CONFIG_HZ_625

  sleep 2s

  msg2 "Disable CONFIG_FAIR_GROUP_SCHED"
  scripts/config --disable CONFIG_FAIR_GROUP_SCHED

  sleep 2s

  msg2 "Disable CONFIG_SCHED_AUTOGROUP"
  scripts/config --disable CONFIG_SCHED_AUTOGROUP

  sleep 2s

  msg2 "Disable CONFIG_SCHED_CORE"
  scripts/config --disable CONFIG_SCHED_CORE

  sleep 2s

  plain ""

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
  pkgdesc='The Linux kernel and modules - With ECHO CPU Scheduler by Hamad Al Marri'
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

sha256sums=('24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149'
            '5f8a4de3f17d6d1b624e70514327b05fafffe8af913f95829b9c6830b4a8a4e3'
            'e3ff7450ac5ce41729febf471cba26446f88c3e711808cb01a012ed4d9f8d345'
            '29c297704b3e6a8b865457061dd829e449e4c7a5fda29b74352738643ef649cc'
            '87470fae9a8a0080c2cb3d38be224b3ccbcb2004316207e0d148ff8a62764a9e'
            '1e36095b05ee849ad05e3696f3e16cc15e0467b7065ec8fe4624bffa3afaf6b5'
            'decfd4c32e2a20accd20b1df6209b5821f97bf6b567c00e4be0f1209d94190dc'
            'd2d9b13bd70047c44eec1a65d85ad7f868aac95f61e589a754d34a429f526075'
            '6149cd3f81aaa2bdf9e976fd9f23427fc744cc95a27908421600d1c60d6f203b'
            '527fe7fe67e795256589914e9e24b0189d2e13e6779f2616939dc4fcc18e9874'
            '73d93134935cf83f8cab18fec9f0878f00b2acd20ff68b7f16b16494e7837923'
            'cd5b0483ef9da761138a53d31e8d7b4111a024c1e72d433608a1aad57e6e59e0'
            'f4a501cace9e3152f32ee08f1740b7acd48f9e6cc3827dfc4e95b5a8170063e3'
            '992e1eacde82228ad29bcd13013df0ec3bcb4042f418a3cb36af8abc80203599'
            '2235123851f3d93da93b90db5f182983aff71086428290ee9f90649e6dc478f3'
            'b0596dceaad088d555e29240794016bce240532dd71c72657a1f3ec78a2bed35'
            '574be7a1d09f27c73039f34a85cb5475504cc9c0d04b67927dfa458c6eb664d9'
            '245eae3bb6098d8b036bf482beb19b4f09688e77db544f8b59e80a746acc35cd'
            '82ae578ea6415bb368575ef56932614311a6c833e2e80d2d676523d6b8aa016a'
            '640449359fb0305a441bcd14777fe8bcb416087bdaea3332427dc3f46fc6a611'
            '6afa0e024891a1252f2cd9400d0a0387483d600c3cd3b7453c5a8d819fa967f5'
            'a31a307a4184187d962a25f1132d0e1b0330fcdb694a9fc53f969eff4dce17b4'
            'db1da37203484a3b1f7c369552d6c1086620ad7431c80ffb3a7b629b01efd2b3'
            'bb5699ff08ae9f8b0a9ae1ebe8f59df2cf984035fe14034fe61397c89de637bf'
            'd0b38a0b1750b43cd378b4ee0e9fafbc6f95159c3747a3289a661803e0fbb1c8'
            '48b0d67cc4534438b4c59873931ced019ddd61331d94e516c40bc85ec5ab7c5a'
            '5d321257ccf6cd2e39fa10532c21e1dfcc0599291bf7de474422cf6d5a0c5120'
            '0c60881992731ed2cadc71d07ec2aefd061161543ca7a8730b82237e25adf424')

pkgname=($pkgbase $pkgbase-headers)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
