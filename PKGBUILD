# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Submitter: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from kernel26
# Some lines from  kernel26-bfs and kernel26-ck
# Credits to respective maintainers
_major=4
_minor=15
#_patchlevel=0
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-${_major}.${_minor}
pkgbase=linux-pf
_pfrel=4
_kernelname=-pf
_pfpatchhome="https://github.com/pfactum/pf-kernel/compare"
_pfpatchname="v$_major.$_minor...v$_major.$_minor-pf$_pfrel.diff"
_CPUSUFFIXES_KBUILD=(
  CORE2 K7 K8 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER PSC
  ATOM PENTIUMII PENTIUMIII PENTIUMM PENTIUM4 NEHALEM SANDYBRIDGE
  IVYBRIDGE HASWELL BROADWELL SILVERMONT SKYLAKE)
_CPUSUFFIXES=( core2 k7 k8 k10 barcelona bobcat
	       bulldozer piledriver psc atom p2 p3 pm p4
	       nehalem sandybridge ivybridge haswell broadwell silvermont skylake)

### PATCH AND BUILD OPTIONS
#
# taken from graysky linux-ck see: https://aur.archlinux.org/packages/linux-ck
# Set these variables to ANYTHING (yes or no or 1 or 0 or "I like icecream") to enable them
#
_NUMA_off=yes		# Disable NUMA in kernel config

# batch mode:
# enable batch mode to stop the pkgbuild from asking you what to do and just use defaults
_BATCH_MODE=n
# if $srcdir/batch_opts is found enable $BATCH_MODE and set MARCH to M$CPU


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

pkgname=('linux-pf')
true && pkgname=('linux-pf' 'linux-pf-headers' 'linux-pf-preset-default')
pkgver=${_basekernel}.${_pfrel}
pkgrel=1
arch=('i686' 'x86_64')
url="https://pfactum.github.io/pf-kernel"
license=('GPL2')
options=('!strip')
makedepends=('git' 'xmlto' 'docbook-xsl' 'xz' 'bc' 'kmod' 'elfutils')
source=("https://www.kernel.org/pub/linux/kernel/v${_major}.x/linux-${_basekernel}.tar.xz"
	'config.i686' 'config.x86_64'		# the main kernel config files
	'linux.preset'			        # standard config files for mkinitcpio ramdisk
	"${_pfpatchhome}/${_pfpatchname}"	# the -pf patchset
        "90-linux.hook"
        "60-linux.hook"
        '0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch'
        '0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch'
        '0003-ssb-Do-not-disable-PCI-host-on-non-Mips.patch'
       )
# 	'cx23885_move_CI_AC_registration_to_a_separate_function.patch'     

prepare() {
  cd "${srcdir}/linux-${_basekernel}"
  msg "Applying pf-kernel patch"
  patch -Np1 < ${srcdir}/${_pfpatchname}

  # linux-ARCH patches

  # add latest fixes from stable queue, if needed
  # http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
  
  # fixed -pf now
  # disable USER_NS for non-root users by default
  #patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
  
  # https://bugs.archlinux.org/task/56711
  #patch -Np1 -i ../0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch
  # https://bugs.archlinux.org/task/57327
  #patch -Np1 -i ../0003-ssb-Do-not-disable-PCI-host-on-non-Mips.patch

  # end
  # end linux-ARCH patches

  # fix ci  invalid PC card inserted issue hopefully
  #patch -Rp1 -i "${srcdir}/cx23885_move_CI_AC_registration_to_a_separate_function.patch" || true

  
  if [ "$CARCH" = "x86_64" ]; then
	cat "${startdir}/config.x86_64" >| .config
  else
	cat "${startdir}/config.i686" >| .config
  fi

  sed -ri "s|SUBLEVEL = 0|SUBLEVEL = $_pfrel|" Makefile

  # Set EXTRAVERSION to -pf
  sed -ri "s|^(EXTRAVERSION =).*|\1|" Makefile
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

  # Don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # If the following is set, stop right there. We only need the headers for
  # dependent drivers' compiling (nvidia, virtualbox etc)

  # get kernel version
  #make prepare
}

build() {
  cd "${srcdir}/linux-${_basekernel}"

  # enable $_BATCH_MODE if batch_opts is found in $srcdir
  if [[ -e $srcdir/batch_opts ]] ; then
      source "$srcdir/batch_opts"
      # enable cpu optimisations acording to $CPU and enable pkgopt
      if [[ "$CPU" ]] ; then
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
          lcpu=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
          lcpu=$(sed -e "s/entium//" <<<$lcpu)
          echo "=============================================================="
          msg "An non-generic CPU was selected for this kernel."
          echo
          msg "Hit <G>     :  to create a generic package named linux-pf"
          msg "Hit <ENTER> :  to create a package named after the selected CPU"
          msg "               (linux-pf-${lcpu} - recommended default)"
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
  export CPU
  #----------------------------------------

  # Strip config of uneeded localversion
  if [ "${_kernelname}" != "" ]; then
    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
    sed -i "s/CONFIG_LOCALVERSION_AUTO=.*/CONFIG_LOCALVERSION_AUTO=n/" ./.config
  fi

  # rewrite configuration
  yes "" | make config >/dev/null #FIXME

  # Build
  # Want extreme and non-sensical optimization? Uncomment the following line!
  # export KCFLAGS="-march=native -Ofast"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-pf() {
 _pkgdesc="Linux kernel and modules with the pf-kernel patch (uksm, PDS)."
 pkgdesc=${_pkgdesc}
 groups=('base')
 depends=('coreutils' 'linux-firmware' 'kmod>=9-2' 'mkinitcpio>=0.7')
 optdepends=('linux-docs: Kernel hackers manual - HTML documentation that comes with the Linux kernel.'
	    'crda: to set the correct wireless channels of your country'
	    'pm-utils: utilities and scripts for suspend and hibernate power management'
	    'nvidia-pf: NVIDIA drivers for linux-pf'
	    'nvidia-beta-all: NVIDIA drivers for all installed kernels'
	    'modprobed-db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
 provides=(${pkgbase}=$pkgver 'linux-tomoyo')
 # If generic build, then conflict with all optimized ones
 conflicts=()
 for _cpusuffix in $_CPUSUFFIXES ; do
   conflicts+=(${pkgbase}-${_cpusuffix}) 
 done  
 replaces=('kernel26-pf')

 cd "${srcdir}/linux-${_basekernel}"

  # work around the AUR parser
  # This allows building cpu-optimized packages with according package names.
  # Useful for repo maintainers.
  headers="headers"
  pkgnameopt="${pkgbase}"		# this MUST be outside the following 'if'
  if [[ "$_PKGOPT" = "y" ]]; then	# package naming according to optimization
    case $CPU in
     CORE2)
         pkgname="${pkgbase}-core2"
         pkgdesc="${_pkgdesc} Intel Core2 optimized."
         ;;
     K7)
        pkgname="${pkgbase}-k7"
        pkgdesc="${_pkgdesc} AMD K7 optimized."
        ;;
     K8)
         pkgname="${pkgbase}-k8" 
         pkgdesc="${_pkgdesc} AMD K8 optimized."
	 ;;
     K10)
         pkgname="${pkgbase}-k10"
	 pkgdesc="§{_pkgdesc} AMD K10 optimized"
         ;;
     BARCELONA)
         pkgname="${pkgbase}-barcelona"
         pkgdesc="${_pkgdesc} AMD Barcelona optimized."
	 ;;
     BOBCAT)
	 pkgname="${pkgbase}-bobcat"
	 pkgdesc="${_pkgdesc} AMD Bobcat optimized."
	 ;;
     BULLDOZER)
	 pkgname="${pkgbase}-bulldozer"
	 pkgdesc="${_pkgdesc} AMD Bulldozer optimized."
	 ;;
     PILEDRIVER)
	 pkgname="${pkgbase}-piledriver"
	 pkgdesc="${_pkgdesc} AMD Piledriver optimized."
	 ;;
     PSC)
         pkgname="${pkgbase}-psc"
         pkgdesc="${_pkgdesc} Intel Pentium4/D/Xeon optimized."
         ;;
     ATOM)
         pkgname="${pkgbase}-atom"
         pkgdesc="${_pkgdesc} Intel Atom optimized."
         ;;
     PENTIUMII)
         pkgname="${pkgbase}-p2"
         pkgdesc="${_pkgdesc} Intel Pentium2 optimized."
         ;;
     PENTIUMIII)
         pkgname="${pkgbase}-p3"
         pkgdesc="${_pkgdesc} Intel Pentium3 optimized."
         ;;
     PENTIUMM)
         pkgname="${pkgbase}-pm"
         pkgdesc="${_pkgdesc} Intel Pentium-M optimized."
         ;;
     PENTIUM4)
         pkgname="${pkgbase}-p4"
         pkgdesc="${_pkgdesc} Intel Pentium4 optimized."
         ;;
     NEHALEM)
	 pkgname="${pkgbase}-nehalem"
         pkgdesc="${_pkgdesc} Intel Core Nehalem optimized."
	 ;;
     SANDYBRIDGE)
         pkgname="${pkgbase}-sandybridge"
         pkgdesc="${_pkgdesc} Intel 2nd Gen Core processors including Sandy Bridge."
	 ;;
     IVYBRIDGE)
         pkgname="${pkgbase}-ivybridge"
         pkgdesc="${_pkgdesc} Intel 3rd Gen Core processors including Ivy Bridge."
	 ;;
     HASWELL)
         pkgname="${pkgbase}-haswell"
         pkgdesc="${_pkgdesc} 4th Gen Core processors including Haswell."
	 ;;
     BROADWELL)
         pkgname="${pkgbase}-broadwell"
         pkgdesc="${_pkgdesc} 5th Gen Core processors including Broadwell."
	 ;;
     SILVERMONT)
         pkgname="${pkgbase}-silvermont"
         pkgdesc="${_pkgdesc} 6th Gen Core processors including Silvermont."
	 ;;
     SKYLAKE)
       pkgname="${pkgbase}-skylake"
       pkgdesc="${_pkgdesc} 6th Gen Core processors including Skylake."
       ;;
     default)
       # Note to me: DO NOT EVER REMOVE THIS. It's for the AUR PKGBUILD parser.
         pkgname="${pkgbase}"
         pkgdesc="Linux kernel and modules with the pf-kernel patch (uksm, PDS)"
         ;;
    esac


  # If optimized build, conflict with generic and other optimized ones

  if [[ "$pkgname" != "$pkgbase" ]]; then
	pkgnameopt="${pkgname}"		# this MUST be inside this if-fi
	pkgname="${pkgbase}"
	echo pkgname $pkgname
	cpuopt=$(sed -e "s/linux-pf-//" <<<$pkgnameopt)		# get suffix
	cpuoptdesc=$(sed -e "s/${_pkgdesc}//" <<<$pkgdesc)	# get description
	conflicts=(${conflicts[@]/linux-pf-${cpuopt}/})		# remove current
	conflicts=(${conflicts[@]/linux-pf-headers-${cpuopt}/})	# remove current's headers
	export cpuopt cpuoptdesc
  fi

  # second batch check ends here
 fi

 # Pass conflicts array to linux-pf-headers() BEFORE adding generic linux-pf or headers will conflict
 export _conflicts=${conflicts[@]}
 conflicts=('linux-pf' 'kernel26-pf' ${conflicts[@]})	# add generic packages

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgnameopt} and"
  if [[ "$cpuopt" ]]; then
       msg  "and ${pkgbase}-${headers}-${cpuopt}"
  else
       msg  "and ${pkgbase}-${headers}"
  fi
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo

 ### package_linux-pf

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  echo # get kernel version
   _kernver="$(make LOCALVERSION= kernelrelease)"

  mkdir -p "${pkgdir}"/{usr/lib/modules,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  ### c/p from linux-ARCH
  
  # make room for external modules
  local _extramodules="extramodules-${_basekernel}${_kernelname:--ARCH}"
  ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

  # add real version for building modules and running depmod from hook
  echo "${_kernver}" |
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"
  # remove build and source links
  rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}
  
  # Now we call depmod...
  depmod -b "$pkgdir/usr" -F System.map "$_kernver"
  
  # add vmlinux
  install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/build" -m644 vmlinux
  
# end c/p

  ###
  # Trick the AUR parser to accept split PKGBUILD
  true && pkgname="${pkgnameopt}"
}

### package_linux-pf-headers
package_linux-pf-headers() {
  pkgname=${pkgbase}-headers
  pkgdesc="Header files and scripts for building modules for linux-pf kernel."
  depends=('linux-pf') 
  conflicts=( "${pkgbase}"-headers) 
  provides=( "${pkgbase}-headers=$pkgver" )
  cd "${srcdir}/linux-${_basekernel}"
# c/p from linux-ARCH

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  # only install objtool when stack validation is enabled
  if grep -q CONFIG_STACK_VALIDATION=y .config   ; then
      mkdir -p ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool
      cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/
  fi
  
  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia rdma scsi soc sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"


  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  ###
  ### DO NOT MERGE OUT THIS IF STATEMENT
  ### IT AFFECTS USERS WHO STRIP OUT THE DVB STUFF SO THE OFFICIAL ARCH CODE HAS A CP
  ### LINE THAT CAUSES MAKEPKG TO END IN AN ERROR
  ###
  if [ -d include/config/dvb/ ]; then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
      cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  fi
  
  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"
  # removed in 3.17 series
  # cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;
  
  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done
  
  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
  # end c/p
  
  # Add version.h for dumb binary blob installers which aren't
  cd "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"
  [[ -e version.h ]] || ln -s ../generated/uapi/linux/version.h
  
}
package_linux-pf-preset-default()
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
# Work around the AUR parser
pkgdesc="Linux kernel and modules with the pf-kernel patch (uksm, PDS)."

# makepkg -g >>PKGBUILD
sha256sums=('5a26478906d5005f4f809402e981518d2b8844949199f60c4b6e1f986ca2a769'
            '102d518779dc312af35faf7e07ff01df3c04521d40d8757fc4e8eba9c595c395'
            'f38927db126ec7141ea2dd70cabb2ef378552672b31db4ab621493928497abd7'
            '82d660caa11db0cd34fd550a049d7296b4a9dcd28f2a50c81418066d6e598864'
            '1be3d8d3164c7cc489250246d760f153768fdbf0d9d9500e14942a8571dc0dfc'
            '75f99f5239e03238f88d1a834c50043ec32b1dc568f2cc291b07d04718483919'
            'ae2e95db94ef7176207c690224169594d49445e04249d2499e9d2fbc117a0b21'
            'b20e25656c9423591afd0325fe26320f50bc3421ff204acbfe5dd88ffb3866fe'
            '68575230693b374eb68e6100e719c71a196db57fe0ac79ddae02fe72b404e09e'
            'b21406c060cf601f879528cfa1b83f524c44d8ecd99689c331a7c6326653d0be')

