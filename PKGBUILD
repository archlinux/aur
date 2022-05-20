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
pkgver=5.17.9
pkgrel=1
pkgdesc='Linux'
url="https://gitlab.com/alfredchen/linux-prjc"
arch=(x86_64)
license=(GPL2)
makedepends=(bc kmod libelf pahole cpio xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick git)
[[ -n "$_clangbuild" ]] && makedepends+=(clang llvm lld python)
options=('!strip')
_srcname=linux-${pkgver}
_arch_config_commit=d74d6d98d884285f2ca0aea4c598a83dd64a4b72
_prjc_version=5.17-r2
_prjc_patch="prjc_v${_prjc_version}.patch"
_gcc_more_v=20220315
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "${pkgbase}-${pkgver}-config::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_arch_config_commit}/trunk/config"
  "${_prjc_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_prjc_version%-*}/${_prjc_patch}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-${pkgbase}-${pkgver}-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://github.com/archlinux/linux/commit/4f6107494a5c5840961a246d8de3c7441d75c6b1.patch"
  "0002-${pkgbase}-${pkgver}-random-treat-bootloader-trust-toggle-the-same-way-as.patch::https://github.com/archlinux/linux/commit/5e79fc7d70e5c6e409254060066e7ab1b1d1a768.patch"
  "0003-${pkgbase}-${pkgver}-tick-Detect-and-fix-jiffies-update-stall.patch::https://github.com/archlinux/linux/commit/03b70547975933214e3edcbb3c99e05142172266.patch"
  "0004-${pkgbase}-${pkgver}-tick-rcu-Remove-obsolete-rcu_needs_cpu-parameters.patch::https://github.com/archlinux/linux/commit/1f17192df29b2410380147075754e8f40dc7af5b.patch"
  "0005-${pkgbase}-${pkgver}-tick-rcu-Stop-allowing-RCU_SOFTIRQ-in-idle.patch::https://github.com/archlinux/linux/commit/68deadf9632ac7c3044f20ad630f13dc11cb66ab.patch"
  "0006-${pkgbase}-${pkgver}-lib-irq_poll-Declare-IRQ_POLL-softirq-vector-as-ksof.patch::https://github.com/archlinux/linux/commit/c4d817dfd4c11840db24143aa39e9e437f05bc33.patch"
  "0007-${pkgbase}-${pkgver}-NFSv4.1-provide-mount-option-to-toggle-trunking-disc.patch::https://github.com/archlinux/linux/commit/cf8e6ac5eabd91ea2ed8eb7dbf12718bfd5cb9b8.patch"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('83dc3cf66933f42a3cdce0015716017ed7fd7810a380a9374bac495b9f0a96b1b95b05bd012332c4156189f6a02d8a9b8b33c9391458adb9909a75bf661d8547'
        'SKIP'
        'a1a93cf57d199419c94e30cee3d0a7e18168166a72d278db32da8a19eb00ec9373888146643eb5c874daa74789c03f1272955a6a0b2dcc18e8f2672eb360e121'
        '75c53846e39333523d53beefa4f1a2873d06595a701bd60ea6645f108dddfab7e5a543ff0e95a6b4bb43bd9eaa1e6e75c12a9926431b4e0fd22df7290c16b2b1'
        '20674a8fcc0a85726e06460a7dbccfe731c46bf377cc3bf511b7591175e7df892f271bc1909e77d9a02913c753d241493502c5ab15d9f78e95f31aa4399c2c27'
        '6f00023f115418191284e04545a78c4af4e697513a0e09329297b799451382059ed8acad4b9bc2f4bac291f9014fd5903bfe27422e9a4737d567e548f65c4552'
        '0b0baeba00a43805ae6eb63cfb85f52620e6ffd22cf3b049dc689ab2b40e85e1d94a3f195ff0a928f67f5f1cedee0608f848fcee0d4574bd840af666b2d380a9'
        'd79796dec0bb418dcd89b3956120709fff893961a3c60249ffad432261f587a3886c8295897417f606f99c51bb39acc5fe132fdeba09ce9e9dc6c2b31a2d4e8f'
        '174b6b757d0d86c9ddea2390c3bee5f5cb9fba3b6046c9befd764467cf3a0f86cd5132c27e3902839496e16729d1973c19bc684285b209728c3b87fb045fd576'
        '6a49e6e2fe090f7cecbf551de62d1a0992ae5867127da935ca9b1723dd7115cf2a8517e9c3d4c627591ca41feea72b3ec853a74c114cac687fa74d7e71277bd8'
        '672326968e4d43c821b2f1e26bb90634679297a7ed8a6062762775247aecd01bbf7de46ea1e07f94bff2a54fe86b246e2dc784149b5d93504726a02ca946b0d4'
        '02280eef8158dad525347b37a2b3a504c3b3a20103ffeb0602e28613d334b96db7c64194bd247e66ecd3615eec20e441005f922f38f85a784cbee0aa7a7da3d4')

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
  optdepends=('crda: to set the correct wireless channels of your country'
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
