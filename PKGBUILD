# Maintainer: Leonidas Spyropoulos <artafinde AT archlinux DOT org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Any/all of the next three variables may be set to ANYTHING
# that is not null to enable their respective build options

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile select modules to reduce the number of modules built
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Compile using clang rather than gcc
_clangbuild=

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
_subarch=36
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3) (NEW)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10) (NEW)
#  4. AMD Barcelona (MBARCELONA) (NEW)
#  5. AMD Bobcat (MBOBCAT) (NEW)
#  6. AMD Jaguar (MJAGUAR) (NEW)
#  7. AMD Bulldozer (MBULLDOZER) (NEW)
#  8. AMD Piledriver (MPILEDRIVER) (NEW)
#  9. AMD Steamroller (MSTEAMROLLER) (NEW)
#  10. AMD Excavator (MEXCAVATOR) (NEW)
#  11. AMD Zen (MZEN) (NEW)
#  12. AMD Zen 2 (MZEN2) (NEW)
#  13. AMD Zen 3 (MZEN3) (NEW)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM) (NEW)
#  18. Intel Westmere (MWESTMERE) (NEW)
#  19. Intel Silvermont (MSILVERMONT) (NEW)
#  20. Intel Goldmont (MGOLDMONT) (NEW)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS) (NEW)
#  22. Intel Sandy Bridge (MSANDYBRIDGE) (NEW)
#  23. Intel Ivy Bridge (MIVYBRIDGE) (NEW)
#  24. Intel Haswell (MHASWELL) (NEW)
#  25. Intel Broadwell (MBROADWELL) (NEW)
#  26. Intel Skylake (MSKYLAKE) (NEW)
#  27. Intel Skylake X (MSKYLAKEX) (NEW)
#  28. Intel Cannon Lake (MCANNONLAKE) (NEW)
#  29. Intel Ice Lake (MICELAKE) (NEW)
#  30. Intel Cascade Lake (MCASCADELAKE) (NEW)
#  31. Intel Cooper Lake (MCOOPERLAKE) (NEW)
#  32. Intel Tiger Lake (MTIGERLAKE) (NEW)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS) (NEW)
#  34. Intel Rocket Lake (MROCKETLAKE) (NEW)
#  35. Intel Alder Lake (MALDERLAKE) (NEW)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2) (NEW)
#  38. Generic-x86-64-v3 (GENERIC_CPU3) (NEW)
#  39. Generic-x86-64-v4 (GENERIC_CPU4) (NEW)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL) (NEW)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD) (NEW)

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-prjc
pkgver=5.18.5
pkgrel=1
pkgdesc='Linux'
url="https://gitlab.com/alfredchen/linux-prjc"
arch=(x86_64)
license=(GPL2)
makedepends=(bc libelf cpio perl tar xz)
[[ -n "$_clangbuild" ]] && makedepends+=(clang llvm lld python)
options=('!strip')
_srcname=linux-${pkgver}
_arch_config_commit=65b8d97deef9185ec16a39f5391c36f3364761e9
_prjc_version=5.18-r1
_prjc_patch="prjc_v${_prjc_version}.patch"
_gcc_more_v=20220315
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "${pkgbase}-${pkgver}-config::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_arch_config_commit}/trunk/config"
  "${_prjc_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_prjc_version%-*}/${_prjc_patch}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-${pkgbase}-${pkgver}-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://github.com/archlinux/linux/commit/9baf57b4c2d9348bd5adecbb893870d1d79fade1.patch"
  "0002-${pkgbase}-${pkgver}-HID-apple-Properly-handle-function-keys-on-Keychron-.patch::https://github.com/archlinux/linux/commit/e410435c977a01e386fda83b5215540365a0086f.patch"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('d2670e53d72fc5f0cf637394452a701c7ab41473be526d29deba7b60789dc56e1c369f3ae05a76f67890822588a36d0b497f267b4b75c33d0a98ad5131c697c9'
        'SKIP'
        'eab78c88e45d9c8c365b12369f0e787fd70554c4e7efb8ce5d3360eaf5ef6036bed484b673ecc1ad58c7d120c261b0bcc71f443dcbd96665d06ae545f119d608'
        '81000dd93c038389ab1bbe04e1e9706062244e70571da03388c2ab0d382bd817d86d8b12adfe607b49adf7bbab3624640a70ba6df2e97bd7f55f9d2def73e88f'
        '20674a8fcc0a85726e06460a7dbccfe731c46bf377cc3bf511b7591175e7df892f271bc1909e77d9a02913c753d241493502c5ab15d9f78e95f31aa4399c2c27'
        '610fb62adbaf1ca851071840f400b31e3c53efd09adcb700d4775736127b59f12c477edcff7a3a81f760f4e866c61c08fb62bbb445af8e357c46ac4093d7b430'
        '71651890d29033ee2fe8d180681802d07806b8f0b245d8132ecc6633ec0964e04253f8c1ab02417cafce8d4b084fa4b1a3ad0cd5a3dc1f20104e2e6c16aec5ea')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-prjc}
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../${pkgbase}-${pkgver}-config .config

  # disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # and can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  scripts/config --enable CONFIG_PSI_DEFAULT_DISABLED

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_SCHED_DEBUG

  # FS#66613
  # https://bugzilla.kernel.org/show_bug.cgi?id=207173#c6
  scripts/config --disable CONFIG_KVM_WERROR

  echo "Applying patch ${_prjc_patch}..."
  patch -Np1 -i "$srcdir/${_prjc_patch}"

  if [[ -n "$_clangbuild" ]]; then
    scripts/config -e LTO_CLANG_THIN
    export _LLVM=1
    export _LLVM_IAS=$_LLVM
  fi

  # non-interactively apply prjc default options
  # this isn't redundant if we want a clean selection of subarch below
  make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig
  # diff -u ../${pkgbase}-${pkgver}-config .config || :

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.17+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | make LLVM=$_LLVM LLVM_IAS=$_LLVM oldconfig
  else
    # no subarch defined so allow user to pick one
    make LLVM=$_LLVM LLVM_IAS=$_LLVM oldconfig
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      make LLVM=$_LLVM LLVM_IAS=$_LLVM LSMOD="$HOME/.config/modprobed.db" localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi

  make -s kernelrelease > version
  echo "Prepared ${pkgbase} version $(<version)"

  [[ -z "$_makenconfig" ]] || make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd $_srcname
  make LLVM=$_LLVM LLVM_IAS=$_LLVM all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C patch set"
  depends=(coreutils kmod initramfs)
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make LLVM=$_LLVM LLVM_IAS=$_LLVM INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
    DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgbase/linux/Linux} kernel"
  depends=('linux-prjc')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  #install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
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

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
