#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Jan Alexander Steffens (heftig) <heftig@archlinux.org> ---> For the base PKGBUILD, config file, sphinx-workaround.patch
#and 0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
#Credits: Andreas Radke <andyrtr@archlinux.org> ---> For the base PKGBUILD, config file and sphinx-workaround.patch
#Credits: Bartłomiej Piotrowski <bpiotrowski@archlinux.org> ---> For the base api-headers package
#Credits: Linus Torvalds ---> For the linux kernel
#Credits: Joan Figueras <ffigue at gmail dot com> ---> For the base PKFBUILD, choose-gcc-optimization.sh and how to enable features
#Credits: Piotr Gorski <lucjan.lucjanov@gmail.com>  <https://github.com/sirlucjan/kernel-patches> ---> For the patches and the base pkgbuild
#Credits: Tk-Glitch <https://github.com/Tk-Glitch> ---> For some patches

#BUILD OPTIONS
#Set these variables to ANYTHING that is not null to enable them
#The default is make olddefconfig
#Set value y to enble and leave empty to disable

#Tweak kernel options prior to a build via nconfig
_make_nconfig=

#Tweak kernel options prior to a build via menuconfig
_make_menuconfig=

#Tweak kernel options prior to a build via xconfig
_make_xconfig=

#Tweak kernel options prior to a build via gconfig
_make_gconfig=

#Make olddefconfig if the user don't want to tweak the config file. (stock default)
_make_olddefconfig=y

#Choose CPU microarchtectures

#Available CPU microarchitectures:
#0) Generic (default)
#1) AMD K6/K6-II/K6-III
#2) AMD Athlon/Duron/K7
#3) AMD Opteron/Athlon64/Hammer/K8
#4) AMD Opteron/Athlon64/Hammer/K8 with SSE3
#5) AMD 61xx/7x50/PhenomX3/X4/II/K10
#6) AMD Family 10h (Barcelona)
#7) AMD Family 14h (Bobcat)
#8) AMD Family 16h (Jaguar)
#9) AMD Family 15h (Bulldozer)
#10) AMD Family 15h (Piledriver)
#11) AMD Family 15h (Steamroller)
#12) AMD Family 15h (Excavator)
#13) AMD Family 17h (Zen)
#14) AMD Family 17h (Zen 2)
#15) Transmeta Crusoe
#16) Transmeta Efficeon
#17) IDT Winchip C6
#18) Winchip-2/Winchip-2A/Winchip-3
#19) AMD Elan
#20) Geode GX1 (Cyrix MediaGX)
#21) AMD Geode GX and LX
#22) Cyrix III or C3
#23) VIA C3 "Nehemiah"
#24) VIA C7
#25) Intel Pentium 4, Pentium D and older Nocona/Dempsey Xeon CPUs with Intel 64bit
#26) Intel Atom
#27) Intel Core 2 and newer Core 2 Xeons (Xeon 51xx and 53xx)
#28) Intel 1st Gen Core i3/i5/i7-family (Nehalem)
#29) Intel 1.5 Gen Core i3/i5/i7-family (Westmere)
#30) Intel Silvermont
#31) Intel Goldmont (Apollo Lake and Denverton)
#32) Intel Goldmont Plus (Gemini Lake)
#33) Intel 2nd Gen Core i3/i5/i7-family (Sandybridge)
#34) Intel 3rd Gen Core i3/i5/i7-family (Ivybridge)
#35) Intel 4th Gen Core i3/i5/i7-family (Haswell)
#36) Intel 5th Gen Core i3/i5/i7-family (Broadwell)
#37) Intel 6th Gen Core i3/i5/i7-family (Skylake)
#38) Intel 6th Gen Core i7/i9-family (Skylake X)
#39) Intel 8th Gen Core i3/i5/i7-family (Cannon Lake)
#40) Intel 8th Gen Core i7/i9-family (Ice Lake)
#41) Xeon processors in the Cascade Lake family
#42) Native optimizations autodetected by GCC

#Set these variables to ANYTHING that is not null to enable them

_microarchitecture=0

#Disable/enable NUMA

#Disable NUMA since most users do not have multiple processors. Breaks CUDA/NvEnc.
#Archlinux and Xanmod enable it by default.
#NUMA is optimized for multi-socket motherboards.
#A single multi-core CPU actually runs slower with NUMA enabled.
#Set value to y to disable (possibly increase performance)
#leave empty to enable
#default value is set to y

_disable_numa=y

#Disable/enable FUNCTION_TRACER/GRAPH_TRACER

#For performance you can disable FUNCTION_TRACER/GRAPH_TRACER. Limits debugging and analyzing of the kernel.
#Set value to y to disable (possibly increase performance)
#leave empty to enable
#default value is set to y

_disable_tracers=y

#Enable/disable CONFIG_USER_NS_UNPRIVILEGED

#Disable CONFIG_USER_NS_UNPRIVILEGED flag
#Set value to y to disable
#leave empty to enable
#default value is set to y

_disable_ns=y

################################# Attention ################################
########### In this section you need to have at least one enable ###########

#Disable Kyber I/O scheduler
# Set variable disable_kyber n to keep enable (stock kernel)
#                            y to disable
#default value is set to y
_disable_kyber=y

#Disable Deadline I/O scheduler
# Set variable disable_mq_dealine n to keep enable (stock kernel)
#                                 y to disable
#default value is set to y
_disable_mq_deadline=y

#Disable BFQ I/O scheduler
# Set variable disable_bfq n to keep enable (stock kernel)
#                          y to disable
#default value is set to n
_disable_bfq=n

############################################################################

#Patch level. base/full
#leave empty for a vanilla kernel
#set value base (recommended) (stock default)
#set value full (can cause build problems)
#default value is set to base
#If you have some problems while compiling with the base or full patches just
#leave this value empty! If you have the patience you can remove some patches and try building the kernel.
_patch_level=base

pkgbase=linux-kernel
pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done
pkgver=5.9.8
pkgrel=3
modulestag=${pkgver}-${pkgbase}
pkgdesc="Stable linux kernel, modules, headers and docs"
arch=(x86_64)
url="https://www.kernel.org/"
license=(GPL-2.0)
makedepends=("bison" "flex" "valgrind" "git" "cmake" "make" "extra-cmake-modules" "libelf" "elfutils"
            "python" "python-appdirs" "python-mako" "python-evdev" "python-sphinx_rtd_theme" "python-graphviz" "python-sphinx"
            "clang" "lib32-clang" "bc" "gcc" "gcc-libs" "lib32-gcc-libs" "glibc" "lib32-glibc" "pahole" "patch" "gtk3"
            "kmod" "libmikmod" "lib32-libmikmod" "xmlto" "xmltoman" "graphviz" "imagemagick" "imagemagick-doc" "rsync" "cpio" "inetutils")
patchsource=https://raw.githubusercontent.com/kevall474/patches/main/${pkgbase}/
source=("https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar.xz"
        "${pkgbase}.preset"
        "config"
        "${patchsource}/choose-gcc-optimization.sh"
        "${patchsource}/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch"
        "${patchsource}/sphinx-workaround.patch"
        "${patchsource}/0001-block-patches.patch")
md5sums=("8ff3b8f25f5234b03e15540846540594"   #linux-5.9.8.tar.xz
          "3f8fc418c35db69ecc839e9c5bd4b3dc"  #linux-kernel.preset
          "e1f2fa957d481d0ca9e737bb92528b67"  #config version 5.9.4
          "b3f0a4804b6fe031f674988441c1af35"  #choose-gcc-optimization.sh
          "a724ee14cb7aee1cfa6e4d9770c94723"  #0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-CLONE_NEWUSER.patch
          "2cebdad39da582fd6a0c01746c8adb42"  #sphinx-workaround.patch
          "35db7bfb80ed2867b2e8d5ed92cadb31") #0001-block-patches.patch

#Base patches
if [ "$_patch_level" = "base" ]; then
source+=("${patchsource}/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${patchsource}/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${patchsource}/0001-bfq-patches.patch"
        "${patchsource}/0001-btrfs-patches.patch"
        "${patchsource}/0001-ntfs3-patches.patch"
        "${patchsource}/0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch"
        "${patchsource}/0001-ZEN-Add-VHBA-driver.patch"
        "${patchsource}/0011-ZFS-fix.patch")
md5sums+=("d15597054a4c5e405f980d07d5eac11a"  #0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch
          "f99b82d6f424d1a729a9b8c5a1be2b84"  #0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch
          "ac5c3aa9b6f6faf02a760eb2d78f2fc5"  #0001-bfq-patches.patch
          "ad0dd4477201efb9fa86b33231ce62d8"  #0001-btrfs-patches.patch
          "50d1cb09cf619482ceb6b5d868681448"  #0001-ntfs3-patches.patch
          "34764d6a1af6ab2e06ef6efa95aaa467"  #0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch
          "a0188e575abe3f27bde9ec09462b067e"  #0001-ZEN-Add-VHBA-driver.patch
          "c19fd76423bfc4af45d99585cedb2623") #0011-ZFS-fix.patch

#Full patches
elif [ "$_patch_level" = "full" ]; then
source+=("${patchsource}/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${patchsource}/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${patchsource}/0001-bfq-patches.patch"
        "${patchsource}/0001-btrfs-patches.patch"
        "${patchsource}/0001-ntfs3-patches.patch"
        "${patchsource}/0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch"
        "${patchsource}/0001-ZEN-Add-VHBA-driver.patch"
        "${patchsource}/0011-ZFS-fix.patch"
        #Added patches bellow
        "${patchsource}/0001-clearlinux-patches.patch"
        "${patchsource}/0001-ksm-patches.patch"
        "${patchsource}/0001-init-add-support-for-zstd-compressed-modules.patch"
        "${patchsource}/0001-zstd-dev-patches.patch"
        "${patchsource}/0001-futex-patches.patch"
        "${patchsource}/0001-fsgsbase-patches.patch"
        "${patchsource}/0001-fixes-miscellaneous.patch"
        "${patchsource}/0001-iomap-patches.patch")
md5sums+=("d15597054a4c5e405f980d07d5eac11a"  #0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch
          "f99b82d6f424d1a729a9b8c5a1be2b84"  #0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch
          "ac5c3aa9b6f6faf02a760eb2d78f2fc5"  #0001-bfq-patches.patch
          "ad0dd4477201efb9fa86b33231ce62d8"  #0001-btrfs-patches.patch
          "50d1cb09cf619482ceb6b5d868681448"  #0001-ntfs3-patches.patch
          "34764d6a1af6ab2e06ef6efa95aaa467"  #0001-sched-autogroup-Add-kernel-parameter-and-config-opti.patch
          "a0188e575abe3f27bde9ec09462b067e"  #0001-ZEN-Add-VHBA-driver.patch
          "c19fd76423bfc4af45d99585cedb2623"  #0011-ZFS-fix.patch
          "eb812a74ec92add2108b48f5a9f048fc"  #0001-clearlinux-patches.patch
          "06a50579d091f2f913dbbf85a98dfd9e"  #0001-ksm-patches.patch
          "803d689c22ebc334ac3becc212f84cba"  #0001-init-add-support-for-zstd-compressed-modules.patch
          "9d780edd3397bc742d20e053949a4eb3"  #0001-zstd-dev-patches.patch
          "980962c54d0236ba2ae2366f81037b97"  #0001-futex-patches.patch
          "8c14e662be90e3cdb51c1d226b8a8600"  #0001-fsgsbase-patches.patch
          "49b3a04f54138892bf5a76c5d5350bde"  #0001-fixes-miscellaneous.patch
          "3dc5b4c062e368834341adb4a39a7828") #0001-iomap-patches.patch
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=${pkgbase}
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare(){
  cd linux-${pkgver}

  if [[ "$_patch_level" = "base" ]]; then
    msg2 "You choose the base patch level"
  elif [[ "$_patch_level" = "full" ]]; then
    msg2 "You choose the full patch level"
  fi

  # Apply any patch
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  # cpopy the config file first
  # Copy "${srcdir}"/config to linux-${pkgver}/.config
  msg2 "Copy "${srcdir}"/config to linux-${pkgver}/.config"
  cp "${srcdir}"/config .config

  #Optimize for performance
  #You can always edit these variables
  msg2 "Optimize for performance/powersave"
  msg2 "Set CONFIG_CPU_FREQ_DEFAULT_GOV"
  #Enable one, disable the others
  scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE           #|
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE            #|
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE            #|
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND             #|
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE         #|
  scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL            #|
  msg2 "Set CONFIG_CPU_FREQ_GOV"                                            #|
  #Enable one, disable the others                                           #| ---> these have to match
  scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE                   #|
  scripts/config --disable CONFIG_CPU_FREQ_GOV_POWERSAVE                    #|
  scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE                    #|
  scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND                     #|
  scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE                 #|
  scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL                    #|
  msg2 "Set CONFIG_HZ"
  #Enable one, disable the others
  scripts/config --enable CONFIG_HZ_1000  #Have to match the set-val command
  scripts/config --set-val CONFIG_HZ 1000 #You can put any of these value 100, 300, 750, 1000 (750 is only for the base or full patch level)
  scripts/config --disable CONFIG_HZ_300
  scripts/config --disable CONFIG_HZ_750  #You can set this value only in the base or full patch level
  scripts/config --disable CONFIG_HZ_250
  scripts/config --disable CONFIG_HZ_100

  # CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team
  msg2 "Enable CONFIG_STACK_VALIDATION gives better stack traces. Also is enabled in all official kernel packages by Archlinux team"
  scripts/config --enable CONFIG_STACK_VALIDATION

  # Enable IKCONFIG following Arch's philosophy
  msg2 "Enable CONFIG_IKCONFIG/CONFIG_IKCONFIG_PROC following Arch's philosophy"
  scripts/config --enable CONFIG_IKCONFIG \
                 --enable CONFIG_IKCONFIG_PROC

  # User set. See at the top of this file
  if [[ "$_disable_tracers" = "y" ]]; then
    msg2 "Disabling FUNCTION_TRACER/GRAPH_TRACER..."
    scripts/config --disable CONFIG_FUNCTION_TRACER \
                   --disable CONFIG_STACK_TRACER
  fi

  #Enable/Disable NUMA
  if [[ $_disable_numa = "y" ]]; then
    msg2 "Disabling NUMA..."
    scripts/config --disable CONFIG_NUMA
  fi

  #Enable/Disable CONFIG_USER_NS_UNPRIVILEGED
  if [[ "$_disable_ns" = "y" ]]; then
    msg2 "Disabling CONFIG_USER_NS_UNPRIVILEGED"
    scripts/config --disable CONFIG_USER_NS_UNPRIVILEGED
  fi

  #Enable/disable BFQ I/O scheduler
  if [[ "$_disable_bfq" = "y" ]]; then
    msg2 "Disabling BFQ I/O scheduler..."
    scripts/config --disable CONFIG_IOSCHED_BFQ
    scripts/config --disable CONFIG_BFQ_GROUP_IOSCHED
  elif [[ "$_disable_bfq" = "n" ]]; then
    msg2 "Enable BFQ I/O scheduler..."
    scripts/config --enable CONFIG_IOSCHED_BFQ
    scripts/config --enable CONFIG_BFQ_GROUP_IOSCHED
  fi

  #Enable/disable Kyber I/O scheduler
  if [[ "$_disable_kyber" = "y" ]]; then
    msg2 "Disabling Kyber I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
  elif [[ "$_disable_kyber" = "n" ]]; then
    msg2 "Enable Kyber I/O scheduler..."
    scripts/config --enable CONFIG_MQ_IOSCHED_KYBER
  fi

  #Enable/disable MQ-Deadline I/O scheduler
  if [[ "$_disable_mq_deadline" = "y" ]]; then
    msg2 "Disabling Deadline I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE_NODEFAULT
  elif [[ "$_disable_mq_deadline" = "n" ]]; then
    msg2 "Enable Deadline I/O scheduler..."
    scripts/config --enable CONFIG_MQ_IOSCHED_DEADLINE
    scripts/config --enable CONFIG_MQ_IOSCHED_DEADLINE_NODEFAULT
  fi

  #Let's user choose microarchitecture optimization in GCC
  sh ${srcdir}/choose-gcc-optimization.sh $_microarchitecture

  msg2 "Setting localversion..."
  scripts/setlocalversion --save-scmversion
  echo "-${pkgbase}" > localversion

  #Config
  if [[ "$_make_nconfig" = "y" ]]; then
  msg2 "make nconfig"
  make nconfig
  fi

  if [[ "$_make_menuconfig" = "y" ]]; then
  msg2 "make menuconfig"
  make menuconfig
  fi

  if [[ "$_make_xconfig" = "y" ]]; then
  msg2 "make xconfig"
  make xconfig
  fi

  if [[ "$_make_gconfig" = "y" ]]; then
  msg2 "make gconfig"
  make gconfig
  fi

  if [[ "$_make_olddefconfig" = "y" ]]; then
  msg2 "make olddefconfig"
  make olddefconfig
  fi
}

build(){
  cd linux-${pkgver}

  # make -j$(nproc) all
  echo "make -j$(nproc) all"
  make -j$(nproc) all
}

_package(){
  pkgdesc="Stable linux kernel and modules with few patches from sirlucjan github repo and linux-tkg"
  depends=("coreutils" "kmod" "initramfs" "mkinitcpio")
  optdepends=("linux-firmware" "crda")
  install=${pkgbase}.install

  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr
  install -dm755 "${pkgdir}"/boot
  install -dm755 "${pkgdir}"/etc/mkinitcpio.d

  cd linux-${pkgver}

  # Installing modules
  msg2 "Installing modules"
  make INSTALL_MOD_PATH="${pkgdir}"/usr INSTALL_MOD_STRIP=1 -j$(nproc) modules_install

  # Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}
  msg2 "Copy bzImage to "${pkgdir}"/boot/vmlinuz-${pkgbase}"
  cp arch/x86/boot/bzImage "${pkgdir}"/boot/vmlinuz-${pkgbase}

  # Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}
  msg2 "Copy System.map to "${pkgdir}"/boot/System.map-${pkgbase}"
  cp System.map "${pkgdir}"/boot/System.map-${pkgbase}

  # Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz
  msg2 "Copy bzImage to "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz"
  cp arch/x86/boot/bzImage "${pkgdir}"/usr/lib/modules/${modulestag}/vmlinuz

  # Copy linux-kernel.preset to "${pkgdir}"/etc/mkinitcpio.d/
  msg2 "Copy linux-kernel-git.preset to "${pkgdir}"/etc/mkinitcpio.d/"
  cp "${srcdir}"/${pkgbase}.preset "${pkgdir}"/etc/mkinitcpio.d/

  # Remove build dir and source dir
  msg2 "Remove build dir and source dir"
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/build
  rm -rf "${pkgdir}"/usr/lib/modules/${modulestag}/source
}

_package-headers(){
  pkgdesc="Headers and scripts for building modules for the ${pkgbase} package"
  depends=("${pkgbase}")

  # Create system tree
  msg2 "Create system tree"
  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${pkgver}

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map vmlinux localversion
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
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

  msg2 "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
  pkgdesc="Documentation for the ${pkgbase} package"
  depends=("${pkgbase}")

  # Create system tree
  msg2 "Create system tree"

  install -dm755 "${pkgdir}"/usr/lib/modules/${modulestag}/build

  cd linux-${pkgver}

  # make -j$(nproc) htmldocs
  msg2 "make -j$(nproc) htmldocs"
  make -j$(nproc) htmldocs

  local builddir="$pkgdir/usr/lib/modules/${modulestag}/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}
