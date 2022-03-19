# Maintainer:  antman666 <945360554@qq.com>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile select modules to reduce the number of modules built
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# optimization (default O3)
if [ -z ${_use_O3+x} ];then
  _use_O3=y
fi

# cpufreq gov (available:performance,ondemand,conservative,userspace,schedutil,powersave)
if [ -z ${_cpufreq+x} ]; then
  _cpufreq=performance
fi

# LRU setting
if [ -z ${_use_lru+x} ]; then
  _use_lru=y
fi

# zram setting
if [ -z ${_use_zram+x} ]; then
  _use_zram=y
fi

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
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
if [ -z ${_subarch+x} ]; then
  cpu=`grep vendor_id /proc/cpuinfo | awk -F: '{print $2}' | tail -1`
  if [ $cpu == 'GenuineIntel' ]; then
    _subarch=40
  elif [ $cpu == 'AuthenticAMD' ]; then
    _subarch=41
  else
    _subarch=36
  fi
fi

### IMPORTANT: Do no edit below this line unless you know what you're doing
pkgbase=linux-ck-uksm
pkgver=5.16.15
pkgrel=2
_major=5.16
arch=(x86_64)
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=(GPL2)
makedepends=(
  bc kmod libelf cpio perl tar xz
)
options=('!strip')

_gcc_more_v=20211114
_patches_url="https://gitlab.com/sirlucjan/kernel-patches/-/raw/master/${_major}"
_jobs=$(nproc)
# https://ck-hack.blogspot.com/2021/08/514-and-future-of-muqss-and-ck-once.html
# thankfully xanmod keeps the hrtimer patches up to date
_commit=c8fd0bce08e6219df068e717c53aa08a7fbb496d
_xan=linux-5.16.y-xanmod

source=("https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${pkgver}.tar".{xz,sign}
        config         # the main kernel config file
        "more-uarches-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/${_gcc_more_v}.tar.gz"
        "xanmod-patches-from-ck-${_commit}.tar.gz::https://github.com/xanmod/linux-patches/archive/${_commit}.tar.gz"
        0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
        0002-Bluetooth-btintel-Fix-bdaddress-comparison-with-garb.patch
        0003-Bluetooth-Read-codec-capabilities-only-if-supported.patch
        0004-Bluetooth-fix-deadlock-for-RFCOMM-sk-state-change.patch
        0005-mt76-mt7921-add-support-for-PCIe-ID-0x0608-0x0616.patch
        0006-mt76-mt7921-reduce-log-severity-levels-for-informati.patch
        0007-Revert-NFSv4.1-query-for-fs_location-attr-on-a-new-f.patch
        "0008-UKSM.patch::${_patches_url}/uksm-patches/0001-UKSM-for-${_major}.patch"
        "0009-bbr2.patch::${_patches_url}/bbr2-patches/0001-bbr2-${_major}-introduce-BBRv2.patch"
        "0010-block.patch::${_patches_url}/block-patches/0001-block-patches.patch"
        "0011-amd.patch::${_patches_url}/amd64-patches/0001-amd64-patches.patch"
        "0012-cpufreq.patch::${_patches_url}/cpufreq-patches-v5/0001-cpufreq-patches.patch"
        "0013-f2fs.patch::${_patches_url}/f2fs-patches-v4/0001-f2fs-patches.patch"
        "0014-O3.patch::https://github.com/xanmod/linux-patches/raw/master/linux-5.16.y-xanmod/xanmod/0011-XANMOD-init-Kconfig-Enable-O3-KBUILD_CFLAGS-optimiza.patch"
)

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('5b14c19cca863da26f226b30f7a04d5767c90a882f9ff06241659f54632410868863a00e6ba91d82272e315d20238d3edcb7d4b6475bcb0162dfc47b6890ecc5'
        'SKIP'
        '67bfa31e67ba32e55d8619a7a1b6a1c4dcb11db6a9777347c43bc35b781e8392c31f3c48e267e538e7d1739f3edbd1ecc9781fcdad04f66651058cf3c63a338d'
        '534091fb5034226d48f18da2114305860e67ee49a1d726b049a240ce61df83e840a9a255e5b8fa9279ec07dd69fb0aea6e2e48962792c2b5367db577a4423d8d'
        '47843d5eae56b388742ef6d73372962a2f28c03d73501ddf30b62a194b81b781d0d5ce73131e30c70d09cdb27a2960bf952ed9e4767222c5bd44605047087ee7'
        'fcbd8714ac56ee03e8c61615773fbc104db77a2ebe761b3e94449889733b0c61779c54f891998fe46c9fe6238517c82c39d9073f053760590396552a6ae28e98'
        'b742a79eb3829e0798f01e0a4f76164a2a5ed53c1eeb751735e28ec60976a58c3383a48a17c8165aa7b0c38996f9c99ab34912b0f116d3e76efa6de43a11f330'
        '146afd039830cc2f8752f048e62df32ef9216c608b7cd98bccaac963fcd167d7215ef0f8f21de165fc6dc00b76f0e30bda03b9f83c2b94458634322765e0389d'
        '47ad8f60760a65e0ef732035b981166376faec33284701c414600b42416a5c65f23bdee149874deb3472c1b3559f8b61ef5d0c3f5c4b965dc8c6fb6eb9f76b18'
        '0f84ab2d64281c45ad22ce7e148f526e37dc2c35a715ed8b29a311c07f29ce4a6b4a52cab019048f46f7b626a5716ed68a8a603dc723cc8158ffc77a5c940b86'
        '079582f81133b2bc24b2868700104ee747a4b1ad3da31180bcb37db9abd111d89b06801b81305c426d4ed7f7ec0e7341b0d30e312dc8f1e9b326c11ef6d6ff55'
        '95bb03860cc91cfe9ebfea7128eda2be281c97bec5f6fdaa90404b4043d87c8689053d44d49bf504eac5e128e5132dad33bf90d67474eceb6c2f7a205b65b5a5'
        '9139215eb0d7af1448c1b1722059430f8aa95b4c8d7611776599cc94064e9ec7e09b02c2fd07487a3aa1b73ecefad09c7944eec73a2f0a422cda049aaed58847'
        'c744ca79e711adf08c65c73f7ab08a95a8c62ab8fd869a8db27add9874a559e226582823660d236ffb56d839d868f1c39bb82b77dbdb0bbdae93d4336a7decb5'
        'ede2f6ade748cac8e2ed46e092c7551f93cebe32b98b61911908d7d3ab2ee0ea08091b17723ebb2016c92b0488c74bb13b4c4453ea4fcc57c3cf38231c7eefbf'
        'eae5453f2ff6f3d7258be9838d8eaf3ea42741dde28f5e85644438fa2725ca45db122eb7298ebadc2c1379309dc3712083013d2439b8c02ce076333b58866dd5'
        '827be1d9fe6762364553b452d123648e5f44e2caf12c451860c65bfa91ae6b40d776a4d329a20064bc7be381f7118b9db2bc516cc16a398e717f11e6e4416add'
        '47edd0997d84b7afe127435b074452474ceb8bb34d8f65750e20e782a87eb4f2220e750de5a22eca7f82d76ee606eabc3441f9ba8280e14770f949d9962aa76e'
        'ed60acb2899a24e727d42428e7ce0dc045e130ba1e84b675077019a613a6ae8add7d4d1d0477998194c5163cded0775ed0713b68f88237b092faa75dfab80167')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${pkgver}

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

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
  
  # ck recommends 1000 Hz tick and the hrtimer patches in lieu of ck1
  scripts/config --enable CONFIG_HZ_1000

  # these are ck's htrimer patches
  echo "Patching with ck hrtimer patches..."

  #for i in ../linux-patches-"$_commit"/"$_xan"/ck-hrtimer/0*.patch; do
  for i in ../linux-patches-"$_commit"/linux-5.15.y-xanmod/ck-hrtimer/0*.patch; do
    patch -Np1 -i $i
  done

  if [ "$_cpufreq" == "performance" ]; then
    msg2 "Change cpu freq into performance"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_PERFORMANCE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  elif [ "$_cpufreq" == "ondemand" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
  elif [ "$_cpufreq" == "conservative" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
  elif [ "$_cpufreq" == "userspace" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
  elif [ "$_cpufreq" == "schedutil" ]; then
    msg2 "Change cpu freq into ondemand"
    scripts/config --enable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  else
    error "Invalid value: $_cpufreq"
  fi

  if [ "$_use_lru" == "y" ]; then
    msg2 "Enable LRU"
    scripts/config --enable CONFIG_LRU_GEN
    scripts/config --set-val CONFIG_NR_LRU_GENS 7
    scripts/config --set-val CONFIG_TIERS_PER_GEN 4
    scripts/config --enable CONFIG_LRU_GEN_ENABLED
    scripts/config --disable CONFIG_LRU_GEN_STATS
  fi

  if [ "$_use_O3" == "y" ]; then
    msg2 "Enable O3"
    scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_SIZE
    scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
  fi

  if [ "$_subarch" == 40 ] || [ "$_subarch" == 42 ]; then
    scripts/config --disable CONFIG_CPU_SUP_HYGON
    scripts/config --disable CONFIG_CPU_SUP_CENTAUR
    scripts/config --disable CONFIG_CPU_SUP_ZHAOXIN
    scripts/config --disable CONFIG_AGP_SIS
    scripts/config --disable CONFIG_AGP_VIA
    scripts/config --set-val CONFIG_NR_CPUS ${_jobs}
    if [ "$_subarch" == 40 ]; then
      msg2 "Setting for Intel CPU"
      scripts/config --disable CONFIG_CPU_SUP_AMD
      scripts/config --disable CONFIG_AMD_MEM_ENCRYPT
      scripts/config --disable CONFIG_X86_AMD_PSTATE
      scripts/config --disable CONFIG_X86_ACPI_CPUFREQ_CPB
      scripts/config --disable CONFIG_X86_POWERNOW_K8
      scripts/config --disable CONFIG_X86_AMD_FREQ_SENSITIVITY
      scripts/config --disable CONFIG_AGP_AMD64
      scripts/config --enable CONFIG_CPU_SUP_INTEL
      scripts/config --enable CONFIG_X86_MCE_INTEL
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_UNCORE
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_RAPL
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_CSTATE
      scripts/config --enable CONFIG_MICROCODE_INTEL
      scripts/config --enable CONFIG_X86_INTEL_PSTATE
      scripts/config --enable CONFIG_X86_SPEEDSTEP_CENTRINO
      scripts/config --modules CONFIG_X86_P4_CLOCKMOD
      scripts/config --enable CONFIG_INTEL_IDLE
      scripts/config --enable CONFIG_AGP_INTEL
    elif [ "$_subarch" == 41 ]; then
      msg2 "Setting for AMD CPU"
      scripts/config --disable CONFIG_CPU_SUP_INTEL
      scripts/config --disable CONFIG_INTEL_IDLE
      scripts/config --disable CONFIG_AGP_INTEL
      scripts/config --enable CONFIG_CPU_SUP_AMD
      scripts/config --enable CONFIG_X86_MCE_AMD
      scripts/config --enable CONFIG_PERF_EVENTS_INTEL_RAPL
      scripts/config --enable CONFIG_PERF_EVENTS_AMD_POWER
      scripts/config --enable CONFIG_PERF_EVENTS_AMD_UNCORE
      scripts/config --enable CONFIG_MICROCODE_AMD
      scripts/config --enable CONFIG_AMD_MEM_ENCRYPT
      scripts/config --enable CONFIG_X86_AMD_PSTATE
      scripts/config --enable CONFIG_X86_ACPI_CPUFREQ_CPB
      scripts/config --enable CONFIG_X86_POWERNOW_K8
      scripts/config --modules CONFIG_X86_AMD_FREQ_SENSITIVITY
      scripts/config --enable CONFIG_AGP_AMD64
    fi
  fi

  if [ "$_use_zram" == "y" ]; then
    msg2 "Enable zram compression to LZ4"
    scripts/config --enable CONFIG_ZSMALLOC
    scripts/config --enable CONFIG_ZRAM
    scripts/config --disable CONFIG_ZRAM_DEF_COMP_LZORLE
    scripts/config --enable CONFIIG_ZRAM_DEF_COMP_LZ4
    scripts/config --set-str CONFIG_ZRAM_DEF_COMP lz4

    scripts/config --disable CONFIG_ZSWAP
  fi

  # non-interactively apply ck1 default options
  # this isn't redundant if we want a clean selection of subarch below
  make olddefconfig
  diff -u ../config .config || :

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.15+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | make oldconfig
  else
    # no subarch defined so allow user to pick one
    make oldconfig
  fi

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
      if [ -f $HOME/.config/modprobed.db ]; then
        echo "Running Steven Rostedt's make localmodconfig now"
        make LSMOD=$HOME/.config/modprobed.db localmodconfig
      else
        echo "No modprobed.db data found"
        exit
      fi
    fi

  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd linux-${pkgver}
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with ck's hrtimer patches"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  #groups=('ck-generic')

  cd linux-${pkgver}

  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  #install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
  #
  # hard-coded path in case user defined CC=xxx for build which causes errors
  # see this FS https://bugs.archlinux.org/task/64315
  install -Dm644 arch/x86/boot/bzImage "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for ${pkgbase/linux/Linux} kernel"
  depends=("$pkgbase") # added to keep kernel and headers packages matched
  #groups=('ck-generic')

  cd linux-${pkgver}
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # required when STACK_VALIDATION is enabled
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # required when DEBUG_INFO_BTF_MODULES is enabled
  #install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

  echo "Installing headers..."
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
