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
_minor=17
#_patchlevel=0
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-${_basekernel}
pkgbase=linux-pf
_unpatched_sublevel=0
_pfrel=1
_kernelname=pf
_pfpatchhome="https://github.com/pfactum/pf-kernel/compare"
_pfpatchname="v$_major.$_minor...v$_major.$_minor-pf$_pfrel.diff"
_projectcpatchname=prjc_v5.15-r1.patch
_CPUSUFFIXES_KBUILD=(
  CORE2 K7 K8 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER STEAMROLLER MEXCAVATOR ZEN ZEN2 MPSC
  ATOM PENTIUMII PENTIUMIII PENTIUMM PENTIUM4 NEHALEM SANDYBRIDGE
  IVYBRIDGE HASWELL BROADWELL SILVERMONT SKYLAKE SKYLAKEX CANNONLAKE ICELAKE CASCADELAKE)
pkgname=('linux-pf')
pkgdesc="Linux with the pf-kernel patch (uksm, ZSTD, FSGSBASE and more)"
pkgname=('linux-pf' 'linux-pf-headers' 'linux-pf-preset-default')
pkgver=${_basekernel}.${_unpatched_sublevel}.${_kernelname}${_pfrel}
pkgrel=1
arch=('i686' 'x86_64')
url="https://gitlab.com/post-factum/pf-kernel/wikis/README"
license=('GPL2')
options=('!strip')
makedepends=('git' 'xmlto' 'docbook-xsl' 'xz' 'bc' 'kmod' 'elfutils' 'inetutils' 'pahole' 'cpio')
source=("https://www.kernel.org/pub/linux/kernel/v${_major}.x/linux-${_basekernel}.tar.xz"
	      'config.x86_64'
        'config.i686'
        'pf_defconfig'
        'linux.preset'			        # standard config files for mkinitcpio ramdisk
	      "${_pfpatchhome}/${_pfpatchname}"	# the -pf patchset
        # bmq-scheudler
        # "https://gitlab.com/alfredchen/projectc/raw/master/$_major.$_minor/$_projectcpatchname"
        "90-linux.hook"
        "60-linux.hook"
        # ZEN
        0002-ZEN-Add-VHBA-driver.patch
        0003-ZEN-Add-OpenRGB-patches.patch
        0006-ZEN-Disable-stack-conservation-for-GCC.patch
        0007-ZEN-Initialize-ata-before-graphics.patch
        0008-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
        0010-ZEN-Add-CONFIG-to-rename-the-mq-deadline-scheduler.patch
        0011-ZEN-intel-pstate-Implement-enable-parameter.patch
        0012-ZEN-Add-ACS-override-support.patch
        0013-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
        0014-ZEN-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-op.patch
        0015-ZEN-mm-Disable-watermark-boosting-by-default.patch
        0016-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
        0017-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
        0018-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
        0019-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
        0020-ZEN-INTERACTIVE-Base-config-item.patch
        0021-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
        0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
        0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
        0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
        0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
        0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
        0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
        0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch
        # ZEN END
        # https://bugzilla.kernel.org/show_bug.cgi?id=211005
        'asus_zenith_ii_map.patch::https://bugzilla.kernel.org/attachment.cgi?id=294489'
       )
# 	'cx23885_move_CI_AC_registration_to_a_separate_function.patch'



prepare() {
  cd "${srcdir}/linux-${_basekernel}"
  msg "Applying pf-kernel patch"
  patch -Np1 < ${srcdir}/${_pfpatchname}
  #patch -Np1 < ${srcdir}/${_projectcpatchname}

  patch -p1 -i ${srcdir}/0002-ZEN-Add-VHBA-driver.patch
  patch -p1 -i ${srcdir}/0003-ZEN-Add-OpenRGB-patches.patch
  # already applied by pf
  #patch -p1 -i ${srcdir}/0005-ZEN-Unrestrict-CONFIG_OPTIMIZE_FOR_PERFORMANCE_O3.patch
  patch -p1 -i ${srcdir}/0006-ZEN-Disable-stack-conservation-for-GCC.patch
  patch -p1 -i ${srcdir}/0007-ZEN-Initialize-ata-before-graphics.patch
  patch -p1 -i ${srcdir}/0008-ZEN-Input-evdev-use-call_rcu-when-detaching-client.patch
  # already applied by pf
  #patch -p1 -i ${srcdir}/0009-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  patch -p1 -i ${srcdir}/0010-ZEN-Add-CONFIG-to-rename-the-mq-deadline-scheduler.patch
  patch -p1 -i ${srcdir}/0011-ZEN-intel-pstate-Implement-enable-parameter.patch
  patch -p1 -i ${srcdir}/0012-ZEN-Add-ACS-override-support.patch
  patch -p1 -i ${srcdir}/0013-ZEN-PCI-Add-Intel-remapped-NVMe-device-support.patch
  patch -p1 -i ${srcdir}/0014-ZEN-futex-Add-entry-point-for-FUTEX_WAIT_MULTIPLE-op.patch
  patch -p1 -i ${srcdir}/0015-ZEN-mm-Disable-watermark-boosting-by-default.patch
  patch -p1 -i ${srcdir}/0016-ZEN-mm-Stop-kswapd-early-when-nothing-s-waiting-for-.patch
  patch -p1 -i ${srcdir}/0017-ZEN-mm-Increment-kswapd_waiters-for-throttled-direct.patch
  patch -p1 -i ${srcdir}/0018-ZEN-mm-Lower-the-non-hugetlbpage-pageblock-size-to-r.patch
  patch -p1 -i ${srcdir}/0019-ZEN-mm-Don-t-hog-the-CPU-and-zone-lock-in-rmqueue_bu.patch
  patch -p1 -i ${srcdir}/0020-ZEN-INTERACTIVE-Base-config-item.patch
  patch -p1 -i ${srcdir}/0021-ZEN-INTERACTIVE-Use-BFQ-as-our-elevator.patch
  patch -p1 -i ${srcdir}/0022-ZEN-INTERACTIVE-Enable-background-reclaim-of-hugepag.patch
  patch -p1 -i ${srcdir}/0023-ZEN-INTERACTIVE-Add-help-text-for-the-MG-LRU-tweaks.patch
  patch -p1 -i ${srcdir}/0024-ZEN-INTERACTIVE-Tune-CFS-for-interactivity.patch
  patch -p1 -i ${srcdir}/0025-ZEN-INTERACTIVE-Tune-ondemand-governor-for-interacti.patch
  patch -p1 -i ${srcdir}/0026-ZEN-INTERACTIVE-Document-PDS-BMQ-configuration.patch
  patch -p1 -i ${srcdir}/0027-ZEN-INTERACTIVE-mm-Disable-unevictable-compaction.patch
  patch -p1 -i ${srcdir}/0028-ZEN-INTERACTIVE-mm-Disable-proactive-compaction-by-d.patch

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
  cd "${srcdir}/linux-${_basekernel}"

  # enable $_BATCH_MODE if batch_opts is found in $srcdir
  if [[ -e $srcdir/batch_opts ]] ; then
    source "$srcdir/batch_opts"
    # enable cpu optimisations acording to $CPU and enable pkgopt
    if [[ "$LCPU" ]] ; then
      CPU=${LCPU^^}
      sed -e "s|# CONFIG_M$CPU is not set|CONFIG_M$CPU=y|" \
          -e '/CONFIG_GENERIC_CPU=y/d' \
          -i "$srcdir/linux-${_basekernel}/.config"
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
    CPU=$(sed -e "s/CONFIG_M\(.*\)=y/\1/" <<<$CPU)
    CPU=$(sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU)
    CPU=$(sed -e "s/^686$/GENERIC/" <<<$CPU)
    cp -f .config ${startdir}/config.$CPU-$CARCH

    # Give option to rename package according to CPU
    echo
    if [[ "$CPU" != "GENERIC" ]]; then
      LCPU=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
      LCPU=$(sed -e "s/entium//" <<<$LCPU)
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

_package() {
  pkgdesc="The $pkgdesc kernel and modules"
  depends=('coreutils' 'kmod>=9-2' 'mkinitcpio>=0.7' 'linux-pf-preset')
  optdepends=('crda: to set the correct wireless channels of your country'
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
            V4L2LOOPBACK-MODULE)
  replaces=('kernel26-pf')

  cd "${srcdir}/linux-${_basekernel}"

  if [[ "$_PKGOPT" = "y" ]]; then	# package naming according to optimization
    case $CPU in
      CORE2)
        pkgname="${pkgbase}-core2"
        pkgdesc="${pkgdesc} Intel Core2 optimized."
        ;;
      K7)
        pkgname="${pkgbase}-k7"
        pkgdesc="${pkgdesc} AMD K7 optimized."
        ;;
      K8)
        pkgname="${pkgbase}-k8"
        pkgdesc="${pkgdesc} AMD K8 optimized."
	      ;;
      K10)
        pkgname="${pkgbase}-k10"
	      pkgdesc="§{pkgdesc} AMD K10 optimized"
        ;;
      BARCELONA)
        pkgname="${pkgbase}-barcelona"
        pkgdesc="${pkgdesc} AMD Barcelona optimized."
	      ;;
      BOBCAT)
	      pkgname="${pkgbase}-bobcat"
	      pkgdesc="${pkgdesc} AMD Bobcat optimized."
	      ;;
      BULLDOZER)
	      pkgname="${pkgbase}-bulldozer"
	      pkgdesc="${pkgdesc} AMD Bulldozer optimized."
	      ;;
      PILEDRIVER)
	      pkgname="${pkgbase}-piledriver"
	      pkgdesc="${pkgdesc} AMD Piledriver optimized."
	      ;;
      STEAMROLLER)
        pkgname="${pkgbase}-steamroller"
	      pkgdesc="${pkgdesc} AMD Steamroller optimized."
        ;;
      EXCAVATOR)
        pkgname="${pkgbase}-excavator"
	      pkgdesc="${pkgdesc} AMD Excavator optimized."
        ;;
      ZEN)
        pkgname="${pkgbase}-zen"
	      pkgdesc="${pkgdesc} AMD Zen optimized".
        ;;
      ZEN2)
        pkgname="${pkgbase}-zen2"
	      pkgdesc="${pkgdesc} AMD Zen2 optimized."
        ;;
      PSC)
        pkgname="${pkgbase}-psc"
        pkgdesc="${pkgdesc} Intel Pentium4/D/Xeon optimized."
        ;;
      ATOM)
        pkgname="${pkgbase}-atom"
        pkgdesc="${pkgdesc} Intel Atom optimized."
        ;;
      PENTIUMII)
        pkgname="${pkgbase}-p2"
        pkgdesc="${pkgdesc} Intel Pentium2 optimized."
        ;;
      PENTIUMIII)
        pkgname="${pkgbase}-p3"
        pkgdesc="${pkgdesc} Intel Pentium3 optimized."
        ;;
      PENTIUMM)
        pkgname="${pkgbase}-pm"
        pkgdesc="${pkgdesc} Intel Pentium-M optimized."
        ;;
      PENTIUM4)
        pkgname="${pkgbase}-p4"
        pkgdesc="${pkgdesc} Intel Pentium4 optimized."
        ;;
      NEHALEM)
	      pkgname="${pkgbase}-nehalem"
        pkgdesc="${pkgdesc} Intel Core Nehalem optimized."
	      ;;
      SANDYBRIDGE)
        pkgname="${pkgbase}-sandybridge"
        pkgdesc="${pkgdesc} Intel 2nd Gen Core processors including Sandy Bridge."
	      ;;
      IVYBRIDGE)
        pkgname="${pkgbase}-ivybridge"
        pkgdesc="${pkgdesc} Intel 3rd Gen Core processors including Ivy Bridge."
	      ;;
      HASWELL)
        pkgname="${pkgbase}-haswell"
        pkgdesc="${pkgdesc} 4th Gen Core processors including Haswell."
	      ;;
      BROADWELL)
        pkgname="${pkgbase}-broadwell"
        pkgdesc="${pkgdesc} 5th Gen Core processors including Broadwell."
	      ;;
      SILVERMONT)
        pkgname="${pkgbase}-silvermont"
        pkgdesc="${pkgdesc} 6th Gen Core processors including Silvermont."
	      ;;
      SKYLAKE)
        pkgname="${pkgbase}-skylake"
        pkgdesc="${pkgdesc} 6th Gen Core processors including Skylake."
        ;;
      SKYLAKEX)
        pkgname="${pkgbase}-skylakex"
        pkgdesc="${pkgdesc} 6th Gen Core processors including Skylake-X."
        ;;
      CASCADELAKE)
        pkgname="${pkgbase}-cascadelake"
        pkgdesc="${pkgdesc} 7th Gen Xeon processors including Cascadelake."
        ;;
      CANNONLAKE)
        pkgname="${pkgbase}-cannonlake"
        pkgdesc="${pkgdesc} 8th Gen Core processors including Cannonlake."
        ;;
      ICELAKE)
        pkgname="${pkgbase}-icelake"
        pkgdesc="${pkgdesc} 10th Gen Core processors including Icelake."
        ;;
      *)
        # Workaround against mksrcinfo getting the $pkdesc wrong
        pkgname="${pkgbase}"
        pkgdesc="${pkgdesc}"
        ::
    esac


    if [[ "$pkgname" != "$pkgbase" ]]; then
      # If optimized build, conflict with generi
      conflicts=('linux-pf')
      provides+=(${pkgbase}=$pkgver)
    fi
  fi

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgname}"
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo

  ### package_linux-pf

  ### c/p from linux-ARCH

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  echo # get kernel version
  kernver="$(<version)"

  mkdir -p "${pkgdir}"/usr/lib/modules
  make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install


  msg2 "Installing boot image..."
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
  # end c/p
}

### package_linux-pf-headers
_package-headers() {
  pkgname=${pkgbase}-headers
  pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
  depends=('pahole')

  cd "${srcdir}/${_srcname}"
  local _builddir="${pkgdir}/usr/lib/modules/$(<version)/build"


  # only install objtool when stack validation is enabled
  if grep -q CONFIG_STACK_VALIDATION=y .config   ; then
    install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool
  fi


  msg2 "Installing build files..."
  install -dm755 "${_builddir}"
  install -Dt "${_builddir}" -m644 Makefile .config Module.symvers System.map version \
          vmlinux localversion.*
  install -Dt "${_builddir}/kernel" -m644 kernel/Makefile


  install -D -m644 arch/${KARCH}/Makefile -t "${_builddir}/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    install -Dm644 arch/${KARCH}/Makefile_32.cpu -t "${_builddir}/arch/${KARCH}/"
  fi

  # copy files necessary for later builds, like nvidia and vmware
  cp -a scripts "${_builddir}"


  msg2 "Installing headers..."
  cp -t "$_builddir" -a include
  # copy arch includes for external modules
  cp -t "$_builddir/arch/x86" -a arch/x86/include


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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "${_builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "${_builddir}" "$pkgdir/usr/src/$pkgbase"
}
_package-preset-default()
{
  pkgname=linux-pf-preset-default
  provides=( "linux-pf-preset=$pkgver")
  pkgdesc="Linux-pf default preset"
  install=linux.install
  depends=("linux-pf=$pkgver")
  backup=("etc/mkinitcpio.d/${pkgbase}.preset")

  # install fallback mkinitcpio.conf file and preset file for kernel
  install -D -m644 "${srcdir}/linux.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # sed expression for following substitutions
  local _subst="
    s|%PKGBASE%|${pkgbase}|g
    s|%KERNVER%|${_kernver}|g
    s|%EXTRAMODULES%|${_extramodules}|g
  "

  # hack to allow specifying an initially nonexisting install file
  sed "${_subst}" "${startdir}/${install}" > "${startdir}/${install}.pkg"
  true && install=${install}.pkg

  # install mkinitcpio preset file
  #sed "${_subst}" ../linux-pf.preset |
  #  install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hooks
  sed "${_subst}" "${srcdir}"/60-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
  sed "${_subst}" "${srcdir}"/90-linux.hook |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  # set correct depmod command for install
  #sed \
    #  -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    #  -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    #  -i "${startdir}/linux.install"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
}

for _p in linux-pf-headers linux-pf-preset-default ; do
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


sha256sums=('555fef61dddb591a83d62dd04e252792f9af4ba9ef14683f64840e46fa20b1b1'
            '27f59cb7d4adb08a81da3de822ce07d5b103c799e89aa36370e16e0b4d1f8672'
            '969470b3c6d05fc68fdfbaf39296327edbd091a1a997ce9335822a06d690e60e'
            '30566498a4f549e972fcd430d2fc44b2bd643c55bae20096f083f8837d8c43e4'
            '82d660caa11db0cd34fd550a049d7296b4a9dcd28f2a50c81418066d6e598864'
            '7759d47d620eb74afbce916b9932bdeb331377104daafa4dfa3931e0855ea17c'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'f7b461945a51af055630d396474f3cf981b5798830fb165346162680e672f842'
            '5be0363210051e0df9b48fd745f7fe4cfa70963f98971d1b2ee55c27b4393d1a'
            '5f007c21adfb68d84d4b63d26213b9212d956d69fee84953058b71faf4661517'
            'c8d29bc2579dc9a954d6b13ed50f8b07abcd058f5dcf18f170bdfd230283f926'
            'dd5829548fe2802fa70938359e3606fa4d97c21dbec315a12fb7836dd7caec30'
            'de128f4bb0d74bd5cb5ad4e52cbbc04b5f8475f9b754452ebf36b40d933784db'
            'fbaf3aad0e0fb84a18d43a647330a25edb6b24f21902d33aff4f0169a0287e21'
            '0dae3fc9a283e45c30d35745ab5832336304a94f414e9f8d97b39d8a768d665f'
            'eeb37f5cd79f2e53018d28afbbab36d903f9203b6a7e27a514313afa9bfeff1b'
            '6ebc39aa1d31a3745d7dcd14d6628e62877c9b8572d19c128f45fd180ca3ac7b'
            'ff87ca1fb418061ed09cbd4656094ef14978edd23d772b5b4ceaa3481b6f570b'
            '47d18389f5ad85b54456be88634eec020da11d632e9af72e8423104947ef685b'
            'f827d78d3eecb948e3eb79219c2eafb98b1e0199f4c1bc00ecb9db1ffad723aa'
            '02030b2ae2d912ccb64c6900cacafc799f01a35f599018007f316427d0daa39b'
            '697db5c22b7ae716eb017c478fa7104e700f3231a88b60fa20bcbb82edc1ae94'
            '77c921dbcf84adfea460e02fbd28542dd988f7e023c4bc75719a24805e7a9c71'
            'dd582720ea98321c227a4a98fb45db93afbf172f6531a34ef4a65c0ae0400c59'
            '9e9ccb6cd669fa136669d721a3f5b3b44d522ee686b89e1cf51b92d52a0e82d8'
            'b1807be87aa49b7ef40bdc78596ef524c5832e556bf0ff1f62f89e77abd8d773'
            'fef891030e93438be1dd32fa2af28d2f5c033e7e03aad5a152eaee51b0e5f178'
            'b9f98e665b570d95da7b55c797bcef206fd48c017de86b5c64e22ff5b45a4713'
            '9ffc360f1a1b354bbae4cf7f4f90fb131a80e65e35afdc3a2e52994c2740eae3'
            '75f3929497e6de49337fc4c83a215856397261fb8be726e55656c621b45c1fba'
            'a23472c56b3f14ab976fc19cb0a214fd881d7519b47a1bd4f919b29324b2d3a8'
            '67558840c3e1f1de229b23a54342cb126735282353a4d0a8cd10e4d582e6d9d6')
# vim:set ts=2 sw=2 tw=0 et:
