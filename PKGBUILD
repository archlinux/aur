# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Submitter: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from kernel26
# Some lines from  kernel26-bfs and kernel26-ck
# Credits to respective maintainers

##
### PATCH AND BUILD OPTIONS
#
# taken from graysky linux-ck see: https://aur.archlinux.org/packages/linux-ck
# Set these variables to ANYTHING (yes or no or 1 or 0 or "I like icecream") to enable them
#
_NUMA_off=yes		# Disable NUMA in kernel config


_BATCH_MODE=n # enable batch mode

### DOCS
# Starting with the 3.6.6-3 release, this package ships with the kernel-3x-gcc47-x.patch.
# This allows users an expanded scope of CPU specific options.
# Consult the following resources to understand which option is right for you application:
#
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/AMD
# http://www.linuxforge.net/docs/linux/linux-gcc.php
# http://gcc.gnu.org/onlinedocs/gcc/i386-and-x86_002d64-Options.html

# DETAILS FOR using 'make localmodconfig'
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules built and the build time to do it.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: http://aur.archlinux.org/packages.php?ID=41689  Note that if you use my script, this PKGBUILD
# will auto run the 'sudo modprobed_db reload' for you to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db

# DETAILS FOR running kernel's config
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

# DRTAILS FOR _NUMA_off=yes
# Since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
# see, https://bugs.archlinux.org/task/31187

# DETAILS FOR _BATCH_MODE
# enable batch mode to stop the pkgbuild from asking you what to do
# either by var or if $srcdir/batch_opts is found
# use defaults or options defined in batch_opts
# if $CPU is defined CONFIG_M${CPU,,} is enabled and CONFIG_GENERIC_CPU is disabled.
###

##

_major=5
_minor=19
#_patchlevel=0
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-pf
pkgbase=linux-pf
_unpatched_sublevel=1
_pfrel=2
_kernelname=pf
_projectcpatchname=prjc_v5.15-r1.patch
_CPUSUFFIXES_KBUILD=(
  # AMD
  K8 K8SSE3 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER STEAROLLER EXCAVATOR ZEN
  ZEN2 ZEN3
  # Intel
  CORE2 PSC
  ATOM PENTIUII PENTIUIII PENTIUM PENTIUM4 NEHALEM SANDYBRIDGE
  IVYBRIDGE HASWELL BROADWELL SILVERMONT SKYLAKE SKYLAKEX CANNONLAKE ICELAKE
  CASCADELAKE COOPERLAKE TIGERLAKE SAPPHIRERAPIDS ROCKETLAKE ALDERLAKE
  # Generic
  GENERIC_CPU2 GENERIC_CPU3 GENERIC_CPU4)
pkgname=('linux-pf')
pkgdesc="Linux with the pf-kernel patch (uksm, ZSTD, FSGSBASE and more)"
pkgname=('linux-pf' 'linux-pf-headers-variant'
         'linux-pf-headers')
pkgver=${_basekernel}.${_unpatched_sublevel}.${_kernelname}${_pfrel}
pkgrel=1
arch=('i686' 'x86_64')
url="https://codeberg.org/pf-kernel/linux/wiki/README"
license=('GPL2')
options=('!strip')
makedepends=('git' 'xmlto' 'docbook-xsl' 'xz' 'bc' 'kmod' 'elfutils' 'inetutils' 'pahole' 'cpio')
source=("linux-pf::git+https://codeberg.org/pf-kernel/linux.git#tag=v${_major}.${_minor}-pf${_pfrel}"
	      'config.x86_64'
        'config.i686'
        'pf_defconfig'
        'linux.preset'			        # standard config files for mkinitcpio ramdisk
        # bmq-scheudler
        # "https://gitlab.com/alfredchen/projectc/raw/master/$_major.$_minor/$_projectcpatchname"
        "90-linux.hook"
        "60-linux.hook"
        # ZEN
        0002-ZEN-Add-VHBA-driver.patch
        0003-ZEN-Add-OpenRGB-patches.patch
        0004-ZEN-Add-ACS-override-support.patch
        0005-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
        0008-ZEN-Disable-stack-conservation-for-GCC.patch
        0009-ZEN-Initialize-ata-before-graphics.patch
        0010-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
        0012-ZEN-cpufreq-Remove-schedutil-dependency-on-Intel-AMD.patch
        0013-ZEN-intel-pstate-Implement-enable-parameter.patch
        0014-ZEN-mm-Disable-watermark-boosting-by-default.patch
        0015-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
        0016-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
        0017-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
        0018-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
        0019-ZEN-INTERACTIVE-Base-config-item.patch
        0020-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
        0021-ZEN-INTERACTIVE-Use-Kyber-as-our-elevator-for-multi-.patch
        0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
        0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
        0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
        0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
        0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
        0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
        0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch
        0029-ZEN-INTERACTIVE-dm-crypt-Disable-workqueues-for-cryp.patch
        # ZEN END
        # https://bugzilla.kernel.org/show_bug.cgi?id=211005
        'asus_zenith_ii_map.patch::https://bugzilla.kernel.org/attachment.cgi?id=294489'
       )
# 	'cx23885_move_CI_AC_registration_to_a_separate_function.patch'



prepare() {
  cd "${srcdir}/${_srcname}"

  patch -p1 -i ${srcdir}/0002-ZEN-Add-VHBA-driver.patch
  patch -p1 -i ${srcdir}/0003-ZEN-Add-OpenRGB-patches.patch
  patch -p1 -i ${srcdir}/0004-ZEN-Add-ACS-override-support.patch
  patch -p1 -i ${srcdir}/0005-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
  # already applied by pf
  # patch -p1 -i ${srcdir}/0006-ZEN-Add-graysky-s-more-uarches.patch
  # already applied by pf
  # patch -p1 -i ${srcdir}/0007-ZEN-Unrestrict-CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3.patch
  patch -p1 -i ${srcdir}/0008-ZEN-Disable-stack-conservation-for-GCC.patch
  patch -p1 -i ${srcdir}/0009-ZEN-Initialize-ata-before-graphics.patch
  patch -p1 -i ${srcdir}/0010-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
  # already applied by pf
  # patch -p1 -i ${srcdir}/0011-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  patch -p1 -i ${srcdir}/0012-ZEN-cpufreq-Remove-schedutil-dependency-on-Intel-AMD.patch
  patch -p1 -i ${srcdir}/0013-ZEN-intel-pstate-Implement-enable-parameter.patch
  patch -p1 -i ${srcdir}/0014-ZEN-mm-Disable-watermark-boosting-by-default.patch
  patch -p1 -i ${srcdir}/0015-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
  patch -p1 -i ${srcdir}/0016-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
  patch -p1 -i ${srcdir}/0017-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
  patch -p1 -i ${srcdir}/0018-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
  patch -p1 -i ${srcdir}/0019-ZEN-INTERACTIVE-Base-config-item.patch
  patch -p1 -i ${srcdir}/0020-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
  patch -p1 -i ${srcdir}/0021-ZEN-INTERACTIVE-Use-Kyber-as-our-elevator-for-multi-.patch
  patch -p1 -i ${srcdir}/0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
  patch -p1 -i ${srcdir}/0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
  patch -p1 -i ${srcdir}/0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
  patch -p1 -i ${srcdir}/0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
  patch -p1 -i ${srcdir}/0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
  patch -p1 -i ${srcdir}/0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
  patch -p1 -i ${srcdir}/0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch
  patch -p1 -i ${srcdir}/0029-ZEN-INTERACTIVE-dm-crypt-Disable-workqueues-for-cryp.patch


  # Add port map for ASUS Zenith II
  patch -p1 -i ${srcdir}/asus_zenith_ii_map.patch

  if [ "$CARCH" = "x86_64" ]; then
	  cat "${startdir}/config.x86_64" >| .config
  else
	  cat "${startdir}/config.i686" >| .config
  fi

  # Restore unpatched sublevel the current -pf is based on
  sed -ri "s|SUBLEVEL = 0|SUBLEVEL = $_unpatched_sublevel|" Makefile

  _arch=$CARCH


  # disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
  # see, https://bugs.archlinux.org/task/31187
  if [ -n "$_NUMA_off" ] && [ "${CARCH}" = "x86_64" ]; then
    sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
        -i -e '/CONFIG_AMD_NUMA=y/d' \
        -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
        -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
        -i -e '/# CONFIG_NUMA_EMU is not set/d' \
        -i -e '/CONFIG_NODES_SHIFT=6/d' \
        -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
        -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
        -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

  # If the following is set, stop right there. We only need the headers for
  # dependent drivers' compiling (nvidia, virtualbox etc)

  # merge our changes to arches kernel config
  ./scripts/kconfig/merge_config.sh .config "$srcdir"/pf_defconfig

  # Set localversion to pkgrel
  echo "-$pkgrel" > localversion.10-pkgrel

  # get kernel version
  make -s kernelrelease > version
  echo "Prepared $pkgbase version $(<version)"
}

build() {
  cd "${srcdir}/${_srcname}"

  # enable $_BATCH_MODE if batch_opts is found in $srcdir
  if [[ -e $srcdir/batch_opts ]] ; then
    source "$srcdir/batch_opts"
    # enable cpu optimisations acording to $CPU and enable pkgopt
    if [[ "$LCPU" ]] ; then
      case $LCPU in
        *generic*) LCPU=${LCPU/generic-v/generic_cpu} ;;
        generic) : ;;
        *) LCPU=m${LCPU} ;;
      esac
      if [ ! $LCPU = "generic" ] ; then
        CPU=${LCPU^^}
        sed -e "s|# CONFIG_$CPU is not set|CONFIG_$CPU=y|" \
            -e '/CONFIG_GENERIC_CPU=y/d' \
            -i "$srcdir/${_srcname}/.config"
      fi
      export _PKGOPT=y
    fi

    _BATCH_MODE=y
  fi

  #----------------------------------------
  if [[ "$_BATCH_MODE" != "y" ]]; then		# for batch building
    echo
    echo "======================================================="
    msg "You might be prompted below for some config options"
    echo "======================================================="
    echo
    msg "Hit <Y> to use your running kernel's config"
    echo "    (needs IKCONFIG and IKCONFIG_PROC)"
    msg "Hit <L> to run 'make localmodconfig'"
    msg "Hit <N> (or just <ENTER>) to build an all-inclusive kernel like stock -ARCH"
    echo "    (warning: it can take a looong time)"
    echo
    read answer
    shopt -s nocasematch
    if [[ "$answer" = "y" ]]; then
      if [[ -s /proc/config.gz ]]; then
	      msg "Extracting config from /proc/config.gz..."
	      zcat /proc/config.gz >| ./.config
      else
	      msg "running 'sudo modprobe configs'"
	      sudo modprobe configs
        if [[ -s /proc/config.gz ]]; then
	        msg "Extracting config from /proc/config.gz..."
	        zcat /proc/config.gz >| ./.config
	      else
	        msg "You kernel was not compiled with IKCONFIG_PROC."
	        msg "Attempting to run /usr/bin/modprobed_db recall from modprobe_db..."
	        if [ -e /usr/bin/modprobed-db ]; then
	          sudo /usr/bin/modprobed-db recall
	        else
	          msg "modprobed-db not installed, running make localmodconfig instead..."
	          make localmodconfig
	        fi
        fi
      fi
    elif [[ "$answer" = "l" ]]; then
      # Copied from kernel26-ck's PKGBUILD
      msg "Attempting to run /usr/bin/reload_database with sudo from modprobe_db..."
      if [ -e /usr/bin/modprobed-db ]; then
	      sudo /usr/bin/modprobed-db recall
      fi
      msg "Running 'make localmodconfig'..."
      make localmodconfig
    else
      msg "Using stock ARCH kernel .config (with BFS and BFQ)."
    fi

    # Make some good use of MAKEFLAGS
    # MAKEFLAGS=`grep -v '#' /etc/makepkg.conf | grep MAKEFLAGS= | sed s/MAKEFLAGS=// | sed s/\"//g`

    # make prepare

    # Options for additional configuration
    echo
    msg "Kernel configuration options before build:"
    echo "    <M> make menuconfig (console menu)"
    echo "    <N> make nconfig (newer alternative to menuconfig)"
    echo "    <G> make gconfig (needs gtk)"
    echo "    <X> make xconfig (needs qt)"
    echo "    <O> make oldconfig"
    echo "    <L> make localyesconfig"
    echo "    <ENTER> to skip configuration and use stock -ARCH defaults"
    read answer
    case "$answer" in
      m) make menuconfig
	       ;;
      g) make gconfig
	       ;;
      x) make xconfig
	       ;;
      n) make nconfig
	       ;;
      o) make oldconfig
         ;;
      l) make localyesconfig
	       ;;
      default)
	       ;;
    esac
    cp -v .config ${startdir}/config.local
    for _cpusuffix_kbuild in ${_CPUSUFFIXES_KBUILD[@]} ; do
	    _egrepstring="${_egrepstring}M${_cpusuffix_kbuild}=y|"
    done
    CPU=$(egrep "${_egrepstring}CONFIG_GENERIC_CPU=y|M686=y|CONFIG_MNATIVE=y" ./.config)
    CPU=$(sed -e "s/CONFIG_\(.*\)=y/\1/" <<<$CPU)
    CPU=$(sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU)
    CPU=$(sed -e "s/^686$/GENERIC/" <<<$CPU)
    cp -f .config ${startdir}/config.$CPU-$CARCH

    # Give option to rename package according to CPU
    echo
    if [[ "$CPU" != "GENERIC" ]]; then
      LCPU=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
      LCPU=$(sed -e "s/entium//" -e "s/^m//" <<<$LCPU)
      echo "=============================================================="
      msg "An non-generic CPU was selected for this kernel."
      echo
      msg "Hit <G>     :  to create a generic package named linux-pf"
      msg "Hit <ENTER> :  to create a package named after the selected CPU"
      msg "               (linux-pf-${LCPU} - recommended default)"
      echo
      msg "This option affects ONLY the package name. Whether or not the"
      msg "kernel is optimized was determined at the previous config step."
      msg "Also note that CPUs newer than CORE2 or K8 will be replaced by"
      msg "by core2 or k8 respectively in the package name."
      echo "=============================================================="
      read answer
      shopt -s nocasematch
      if [[ "$answer" != "g" ]]; then
	      export _PKGOPT=y
      fi
    fi

  fi  # batch check ends here

  # only export non-generic
  if [[ $CPU != GENERIC ]] ; then
    export CPU
    export LCPU
  fi

  # rewrite configuration
  make olddefconfig

  # Build
  make all
}


_set_variant_appendix()
{
  local _pkg="$1"
  shift

  if [[ "$_PKGOPT" = "y" ]]; then	# package naming according to optimization
    case $CPU in
      MK8)
        pkgname="${_pkg}-k8"
        pkgdesc="${pkgdesc} AMD K8 optimized."
        ;;
      MK10)
        pkgname="${_pkg}-k10"
        pkgdesc="§{pkgdesc} AMD K10 optimized"
        ;;
      MBARCELONA)
        pkgname="${_pkg}-barcelona"
        pkgdesc="${pkgdesc} AMD Barcelona optimized."
        ;;
      MBOBCAT)
        pkgname="${_pkg}-bobcat"
        pkgdesc="${pkgdesc} AMD Bobcat optimized."
        ;;
      MBULLDOZER)
        pkgname="${_pkg}-bulldozer"
        pkgdesc="${pkgdesc} AMD Bulldozer optimized."
        ;;
      MPILEDRIVER)
        pkgname="${_pkg}-piledriver"
        pkgdesc="${pkgdesc} AMD Piledriver optimized."
        ;;
      MSTEAMROLLER)
        pkgname="${_pkg}-steamroller"
        pkgdesc="${pkgdesc} AMD Steamroller optimized."
        ;;
      MEXCAVATOR)
        pkgname="${_pkg}-excavator"
        pkgdesc="${pkgdesc} AMD Excavator optimized."
        ;;
      MZEN)
        pkgname="${_pkg}-zen"
        pkgdesc="${pkgdesc} AMD Zen optimized".
        ;;
      MZEN2)
        pkgname="${_pkg}-zen2"
        pkgdesc="${pkgdesc} AMD Zen3 optimized."
        ;;
      MZEN3)
        pkgname="${_pkg}-zen3"
        pkgdesc="${pkgdesc} AMD Zen3 optimized."
        ;;
      MCORE2)
        pkgname="${_pkg}-core2"
        pkgdesc="${pkgdesc} Intel Core2 optimized."
        ;;
      MMPSC)
        pkgname="${_pkg}-psc"
        pkgdesc="${pkgdesc} Intel Pentium4/D/Xeon optimized."
        ;;
      MATOM)
        pkgname="${_pkg}-atom"
        pkgdesc="${pkgdesc} Intel Atom optimized."
        ;;
      MPENTIUMII)
        pkgname="${_pkg}-p2"
        pkgdesc="${pkgdesc} Intel Pentium2 optimized."
        ;;
      MPENTIUMIII)
        pkgname="${_pkg}-p3"
        pkgdesc="${pkgdesc} Intel Pentium3 optimized."
        ;;
      MPENTIUMM)
        pkgname="${_pkg}-pm"
        pkgdesc="${pkgdesc} Intel Pentium-M optimized."
        ;;
      MPENTIUM4)
        pkgname="${_pkg}-p4"
        pkgdesc="${pkgdesc} Intel Pentium4 optimized."
        ;;
      MNEHALEM)
        pkgname="${_pkg}-nehalem"
        pkgdesc="${pkgdesc} Intel Core Nehalem optimized."
        ;;
      MSANDYBRIDGE)
        pkgname="${_pkg}-sandybridge"
        pkgdesc="${pkgdesc} Intel Sandy Bridge optimized."
        ;;
      MIVYBRIDGE)
        pkgname="${_pkg}-ivybridge"
        pkgdesc="${pkgdesc} Intel Ivy Bridge optimized."
        ;;
      MHASWELL)
        pkgname="${_pkg}-haswell"
        pkgdesc="${pkgdesc} Intel Haswell optimized."
        ;;
      MBROADWELL)
        pkgname="${_pkg}-broadwell"
        pkgdesc="${pkgdesc} Intel Broadwell optimized."
        ;;
      MSILVERMONT)
        pkgname="${_pkg}-silvermont"
        pkgdesc="${pkgdesc} Intel Silvermont optimized."
        ;;
      MSKYLAKE)
        pkgname="${_pkg}-skylake"
        pkgdesc="${pkgdesc} Intel Skylake optimized."
        ;;
      MSKYLAKEX)
        pkgname="${_pkg}-skylakex"
        pkgdesc="${pkgdesc} Intel Skylake-X optimized."
        ;;
      MCASCADELAKE)
        pkgname="${_pkg}-cascadelake"
        pkgdesc="${pkgdesc} Intel Cascadelake optimized."
        ;;
      MCANNONLAKE)
        pkgname="${_pkg}-cannonlake"
        pkgdesc="${pkgdesc} Intel Cannonlake optimized."
        ;;
      MICELAKE)
        pkgname="${_pkg}-icelake"
        pkgdesc="${pkgdesc} Intel Icelake optimized."
        ;;
      MCASCADELAKE)
        pkgname="${_pkg}-cascadelake"
        pkgdesc="${pkgdesc} Intel optimized."
        ;;
      MCOOPERLAKE)
        pkgname="${_pkg}-cooperlake"
        pkgdesc="${pkgdesc} Intel Cooperlake optimized."
        ;;
      MTIGERLAKE)
        pkgname="${_pkg}-tigerlake"
        pkgdesc="${pkgdesc} Intel Tigerlake optimized."
        ;;
      MSAPPHIRERAPIDS)
        pkgname="${_pkg}-sapphirerapids"
        pkgdesc="${pkgdesc} Intel Sapphirerapids optimized."
        ;;
      MROCKETLAKE)
        pkgname="${_pkg}-rocketlake"
        pkgdesc="${pkgdesc} Intel Rocketlake optimized."
        ;;
      MALDERLAKE)
        pkgname="${_pkg}-alderlake"
        pkgdesc="${pkgdesc} Intel Alderlake optimized."
        ;;
      GENERIC_CPU2)
        pkgname="${_pkg}-generic-v2"
        pkgdesc="${pkgdesc} Generic-x86-64-v2 optimized."
        ;;
      GENERIC_CPU3)
        pkgname="${_pkg}-generic-v3"
        pkgdesc="${pkgdesc} Generic-x86-64-v3 optimized."
        ;;
      GENERIC_CPU4)
        pkgname="${_pkg}-generic-v4"
        pkgdesc="${pkgdesc} Generic-x86-64-v4 optimized."
        ;;
      *|generic)
        pkgname="${_pkg}-generic"
        pkgdesc="${pkgdesc}"
        ;;
    esac

    conflicts+=("$_pkg")
    provides+=(${_pkg}=$pkgver)

  fi

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgname}"
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo
}

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod>=9-2' 'mkinitcpio>=0.7')
  optdepends=('wireless-regdb: to set the correct wireless channels of your country'
	            'nvidia-pf: NVIDIA drivers for linux-pf'
              'uksmd: Userspace KSM helper daemon'
              'linux-firmware: firmware images needed for some devices'
	            'modprobed-db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
  provides=('linux-tomoyo'
            VIRTUALBOX-GUEST-MODULES
            WIREGUARD-MODULE
            KSMBD-MODULE
            NTFS3-MODULE
            UKSMD-BUILTIN
            V4L2LOOPBACK-MODULE
            VHBA-MODULE)
  conflicts=('linux-pf-preset')
  replaces=('linux-pf-preset')

  cd "${srcdir}/${_srcname}"

  _set_variant_appendix "${pkgbase}"

  case "$pkgname" in
    *generic)
      replaces=('<linux-pf=5.18.6.pf2-2')
      ;;
  esac

  ### package_linux-pf

  ### c/p from linux-ARCH

  cd "${srcdir}/${_srcname}"

  KARCH=x86

  echo # get kernel version
  kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  msg2 "Installing boot image..."

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
       DEPMOD=/doesnt/exist modules_install  # Suppress depmod

  # remove build and source links
  rm "$modulesdir"/{source,build}
  # end c/p
}

_package-headers-variant() {
  pkgname=${pkgbase}-headers-variant
  pkgdesc="Variant specific headers and scripts for building modules for the $pkgdesc kernel"
  _set_variant_appendix "$pkgname"

  cd "${srcdir}/${_srcname}"
  local _builddir="${pkgdir}/usr/lib/modules/$(<version)/build"

  # Install here so each kernel optimized flavour can ship it's own System.map,
  # since bpf symbols can differ bepending on the cflags used during build.
  # Re: #5
  install -D -m644 scripts/mod/devicetable-offsets.s \
          "$_builddir"/scripts/mod/devicetable-offsets.s
  install -D -m644 scripts/mod/.devicetable-offsets.s.cmd \
          "$_builddir"/scripts/mod/.devicetable-offsets.s.cmd
  install -D -m644 scripts/mod/.empty.o.cmd \
          "$_builddir"/scripts/mod/.empty.o.cmd
  install -D -m644 include/config/auto.conf \
          "$_builddir"/include/config/auto.conf
  install -D -m644 include/generated/autoconf.h \
          "$_builddir"/include/generated/autoconf.h
  install -Dt "$_builddir" -m644 \
          vmlinux \
          .config \
          System.map

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$_builddir"/vmlinux
}

### package_linux-pf-headers
_package-headers() {
  pkgname=${pkgbase}-headers
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=('pahole')
  # Depend on variant specific tools and headers for external modules
  depends=('linux-pf-headers-variant')

  cd "${srcdir}/${_srcname}"
  local _builddir="${pkgdir}/usr/lib/modules/$(<version)/build"


  # only install objtool when stack validation is enabled
  if grep -q CONFIG_STACK_VALIDATION=y .config   ; then
    install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool
  fi

  # required when DEBUG_INFO_BTF_MODULES is enabled
  if grep -q CONFIG_DEBUG_INFO_BTF_MODULES=y .config ; then
    install -Dt "${_builddir}/tools/bpf/resolve_btfids" \
            tools/bpf/resolve_btfids/resolve_btfids
  fi

  msg2 "Installing build files..."
  install -dm755 "${_builddir}"
  install -Dt "${_builddir}" -m644 Makefile Module.symvers version \
          localversion.*
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile


  install -D -m644 arch/${KARCH}/Makefile -t "${_builddir}/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    install -Dm644 arch/${KARCH}/Makefile_32.cpu -t "${_builddir}/arch/${KARCH}/"
  fi

  # copy files necessary for later builds, like nvidia and vmware
  cp -a scripts "${_builddir}"

  # Moved to main package, see earlier in _package()
  rm "${_builddir}"/scripts/mod/devicetable-offsets.s \
     "${_builddir}"/scripts/mod/.devicetable-offsets.s.cmd \
     "${_builddir}"/scripts/mod/.empty.o.cmd

  msg2 "Installing headers..."
  cp -t "$_builddir" -a include
  # copy arch includes for external modules
  cp -t "$_builddir/arch/x86" -a arch/x86/include

  # Moved to main package, see earlier in _package()
  rm "${_builddir}"/include/config/auto.conf \
     "${_builddir}"/include/generated/autoconf.h

  # fix permissions on scripts dir
  chmod og-w -R "${_builddir}/scripts"

  install -D -m644 -t "${_builddir}/arch/${KARCH}/kernel/" arch/${KARCH}/kernel/asm-offsets.s

  install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # and...
  # http://bugs.archlinux.org/task/11194
  ###
  ### DO NOT MERGE OUT THIS IF STATEMENT
  ### IT AFFECTS USERS WHO STRIP OUT THE DVB STUFF SO THE OFFICIAL ARCH CODE HAS A CP
  ### LINE THAT CAUSES MAKEPKG TO END IN AN ERROR
  ###
  if [ -d include/config/dvb/ ]; then
    install -Dm644 -t "${_builddir}/include/config/dvb/" include/config/dvb/*.h
  fi

  # add xfs and shmem for aufs building
  mkdir -p "${_builddir}/"{fs/xfs,mm}

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$_builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "${_builddir}"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "${_builddir}/Documentation"

  echo "Removing broken symlinks..."
  find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "${_builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

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
  done < <(find "${_builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "${_builddir}" "$pkgdir/usr/src/$pkgbase"
}

for _p in linux-pf-headers; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
if [ "$makepkg_version" ] ; then
  if in_array ${source[*]} batch_opts ; then #FIXME bugs updpkgsums
    source batch_opts
  fi
fi

pkgname[0]=linux-pf${LCPU+-}${LCPU}

eval "package_linux-pf${LCPU+-$LCPU}() {
     $(declare -f "_package")
     _package
     }"

pkgname[1]=linux-pf-headers-variant${LCPU+-}${LCPU}

eval "package_linux-pf-headers-variant${LCPU+-$LCPU}() {
     $(declare -f "_package-headers-variant")
     _package-headers-variant
     }"

sha256sums=('SKIP'
            '28b4a6f7655079ff4a9cfe48763fae4c1e26be6956273d832062ceccddf23997'
            '2b4b6887e75c9e6d40d1fa00e4405745da4c0649f7bf8c48e1bb35d511270443'
            '30566498a4f549e972fcd430d2fc44b2bd643c55bae20096f083f8837d8c43e4'
            '82d660caa11db0cd34fd550a049d7296b4a9dcd28f2a50c81418066d6e598864'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'f78b6b40cad97fd38b15e161d2dcfbdc98b2681a180c6a4f493b6ea362ad311b'
            '764bbbad55f251627f7c93a08a70f3a4004e03c74f162df349267686b2167a00'
            '28df2ac08a81fc720d46908f239e0e8bfd70d5ba7d6e576c8598c3982a9a2cc4'
            '7b2b7cd3846aeadefd5d1e9978078e3feaff53456378cb31489b9cf0971f958f'
            '1137f4d0d65ef8985307d1deccdc6fc47f68ef2a0d549ab5a27d5c9a45bec9a7'
            '39a6dafe65ae512d3802dd25976bce171826a947568c236ce382f8a12836c9b5'
            'fd0ecbc2948a490ece2cbd90623c80e210c1674ea8d8f95642c6f67cef435c4a'
            'cdeacc91b32801c2e46691f5f2bb3612bffd42619cb7b025f4ecba29dec9eaf1'
            '20892d64352398893920f48507709d0ff5494c3853c157b87917a086155ce723'
            'f40434c60dee7731ae88107046dd1400ffe11c1ba4de58850a8319f9bb4847b9'
            '70d269b5e1d9b5259481f87e00f7b17d96fa5b389e4b500f1e6862c0116bfa4f'
            '8bef9463e0cebb578d4df15b06a447c3b4c850a5eef9ff80c59fb8e2cac81474'
            'ec795347155a2f509491fb60c9f4e01704d86a2af432278d7bf5efd7db29f9a2'
            '07775d7a0e3ba474976f7a28f069aaf009cdc70576aabf861b630268df2ad469'
            'f1828a4c636138bc53432a057922362399a72055f635a577b791449304d98afe'
            '5e6d6aee7f79c9c97c822d3eec8cfa3ca725bf01a60b249175dc0e3b0ca5390f'
            'aa93dd01631204ac71b902662f58a48186049e2e573e06e6818ab72fa139bdd4'
            '854a432bdaf6f94baa92c03e78e10f00c53bc666c4b367adf2d5d330f872c8c5'
            'f52b1703f39ab0b52978e48d129ec38ace74d3dec790cb87ca7030fd187354fd'
            '3d85f031166d16ebb41430b3f17ed4683b85e7640819b0fb61bd927e6cec5139'
            'ca52bf43327f2c6b0941d3da8fd2a25055bf8f74564be331944c123d18e54330'
            '9676de79d5ab66565ab8e19de3f1f70c8ad5994eaf8d5ca1fb6e9ed8426787d9'
            '1a2598a00966da4e9985644edb900af7204409411464771c31d67d472595d817'
            '3d329b5153230184e270355f61697f5f7248787a4da045ac7b660e837c088630'
            'c6730df729723340475fa64cf0ce4fee02ff0a1739f355166324bb2abeca5168'
            '67558840c3e1f1de229b23a54342cb126735282353a4d0a8cd10e4d582e6d9d6')
# vim:set ts=2 sw=2 tw=0 et:
