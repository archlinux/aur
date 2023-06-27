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
# option is 39.
_subarch=39

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
#  14. AMD Zen 4 (MZEN4) (NEW)
#  15. Intel P4 / older Netburst based Xeon (MPSC)
#  16. Intel Core 2 (MCORE2)
#  17. Intel Atom (MATOM)
#  18. Intel Nehalem (MNEHALEM) (NEW)
#  19. Intel Westmere (MWESTMERE) (NEW)
#  20. Intel Silvermont (MSILVERMONT) (NEW)
#  21. Intel Goldmont (MGOLDMONT) (NEW)
#  22. Intel Goldmont Plus (MGOLDMONTPLUS) (NEW)
#  23. Intel Sandy Bridge (MSANDYBRIDGE) (NEW)
#  24. Intel Ivy Bridge (MIVYBRIDGE) (NEW)
#  25. Intel Haswell (MHASWELL) (NEW)
#  26. Intel Broadwell (MBROADWELL) (NEW)
#  27. Intel Skylake (MSKYLAKE) (NEW)
#  28. Intel Skylake X (MSKYLAKEX) (NEW)
#  29. Intel Cannon Lake (MCANNONLAKE) (NEW)
#  30. Intel Ice Lake (MICELAKE) (NEW)
#  31. Intel Cascade Lake (MCASCADELAKE) (NEW)
#  32. Intel Cooper Lake (MCOOPERLAKE) (NEW)
#  33. Intel Tiger Lake (MTIGERLAKE) (NEW)
#  34. Intel Sapphire Rapids (MSAPPHIRERAPIDS) (NEW)
#  35. Intel Rocket Lake (MROCKETLAKE) (NEW)
#  36. Intel Alder Lake (MALDERLAKE) (NEW)
#  37. Intel Raptor Lake (MRAPTORLAKE) (NEW)
#  38. Intel Meteor Lake (MMETEORLAKE) (NEW)
#  39. Generic-x86-64 (GENERIC_CPU)
#  40. Generic-x86-64-v2 (GENERIC_CPU2) (NEW)
#  41. Generic-x86-64-v3 (GENERIC_CPU3) (NEW)
#  42. Generic-x86-64-v4 (GENERIC_CPU4) (NEW)
#  43. Intel-Native optimizations autodetected by the compiler (MNATIVE_INTEL) (NEW)
#  44. AMD-Native optimizations autodetected by the compiler (MNATIVE_AMD) (NEW)

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-prjc
pkgver=6.4
pkgrel=1
pkgdesc='Linux'
url="https://gitlab.com/alfredchen/linux-prjc"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc
  cpio
  gettext
  git
  libelf
  pahole
  python
  perl
  tar
  xz
)
[[ -n "$_clangbuild" ]] && makedepends+=(clang llvm lld)
options=('!strip')
_srcname=linux-${pkgver}
_kernel_base_commit=6995e2de6891c724bfeb2db33d7b87775f913ad1
_kernel_arch_tag=${pkgver}-arch1
_arch_config_commit=50de1591172a64cb6fac2820e9653a179fd8a230
_prjc_version=6.4-r0
_prjc_patch="prjc_v${_prjc_version}.patch"
_gcc_more_v=20230105
source=(
  "https://www.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar".{xz,sign}
  "${pkgbase}-${pkgver}-config::https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/raw/${_arch_config_commit}/config"
  "${_prjc_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_prjc_version%-*}/${_prjc_patch}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-${pkgbase}-${pkgver}-v${_kernel_arch_tag}.patch::https://github.com/archlinux/linux/compare/${_kernel_base_commit}..v${_kernel_arch_tag}.patch"
)

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('b59eb04a8715af9f686978812e6d4a466172bb859f80657076de14cd0828b4fac15b688ff8959f5c65485f7f6bef26590412c66821e720de843cb8666f226c90'
        'SKIP'
        '66e3411d77df938089541bb087474b0ebb733a86eb91c8f5e783a92a8156cf4d3addaa6f58048fac17f2a92195aff9b3b0bff77138421f4dd404f71b5daa64ea'
        '73438f4785fc533c901c6f4fd538f0e4a23526b15d43bfb35cc70c066c24d60006797a08e9c1bb388ca7feb7d946a7fce3b21f1065c66eeab5e8f923f817e96b'
        'd178dad69501967382d5c841f65e4f57651042bee8117041a9baa35ab3fa73af8174b8b999ae9e72ec381c52744ccaaabb77944d59f123c04b6ed5626432d843'
        '51899017ff42c3c8d5d4d4630665c8bbe8f17549c4034acdfe2de5ed8f2e78c97d88f00ec68f3964b36cb65aeb58a54e32cb224ed349044fd4088d514cd3e635')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-prjc}
export EXTRAVERSION=""
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

_make() {
  test -s version
  make KERNELRELEASE="$(<version)" "$@"
}

prepare() {
  cd $_srcname

  echo "Setting version..."
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname
  make defconfig
  make -s kernelrelease > version
  make mrproper

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

  # https://gitlab.com/alfredchen/linux-prjc/-/issues/81
  # Disable mellanox module
  scripts/config --disable CONFIG_MLX5_CORE

  echo "Applying patch ${_prjc_patch}..."
  patch -Np1 -i "$srcdir/${_prjc_patch}"

  if [[ -n "$_clangbuild" ]]; then
    scripts/config -e LTO_CLANG_THIN
    export _LLVM=1
    export _LLVM_IAS=$_LLVM
  fi

  # EXTRAVERSION is set by arch patch, we reset it to empty
  sed -ri 's/^(EXTRAVERSION\s=\s)(\-[a-z0-9]+)$/\1/' Makefile

  # non-interactively apply prjc default options
  # this isn't redundant if we want a clean selection of subarch below
  _make LLVM=$_LLVM LLVM_IAS=$_LLVM olddefconfig
  # diff -u ../${pkgbase}-${pkgver}-config .config || :

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.17+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | _make LLVM=$_LLVM LLVM_IAS=$_LLVM oldconfig
  else
    # no subarch defined so allow user to pick one
    _make LLVM=$_LLVM LLVM_IAS=$_LLVM oldconfig
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      _make LLVM=$_LLVM LLVM_IAS=$_LLVM LSMOD="$HOME/.config/modprobed.db" localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi

  echo "Prepared ${pkgbase} version $(<version)"

  [[ -z "$_makenconfig" ]] || _make LLVM=$_LLVM LLVM_IAS=$_LLVM nconfig

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd $_srcname
  _make LLVM=$_LLVM LLVM_IAS=$_LLVM all EXTRAVERSION=""
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C patch set"
  depends=(
    coreutils
    initramfs
    kmod
  )
  optdepends=(
    'wireless-regdb: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices'
  )

  cd $_srcname
  local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(_make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  _make LLVM=$_LLVM LLVM_IAS=$_LLVM INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
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
  install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

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
  strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

}

pkgname=(
  "$pkgbase"
  "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
