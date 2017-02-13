# Maintainer: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from linux-pf and linux-lts
# Some lines from linux-bfs and linux-ck
# Credits to respective maintainers

pkgbase=linux-pf-lts
_major=4
_minor=4
_patchlevel=48
_pfpatchlevel=47
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-${_basekernel}
_pfrel=10
pkgrel=1
_kernelname=-pf
_pfpatchhome="http://pf.natalenko.name/sources/${_basekernel}/"
_pfpatchname="patch-${_basekernel}${_kernelname}${_pfrel}"

### PATCH AND BUILD OPTIONS

_NUMA_off=yes		# Disable NUMA in kernel config

# DETAILS FOR _NUMA_off=yes
# Since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
# see, https://bugs.archlinux.org/task/31187

# Set to 'y' to enable AUFS
_AUFS=n

####
_CPUSUFFIXES_KBUILD=(CORE2 K7 K8 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER PSC ATOM PENTIUMII PENTIUMIII PENTIUMM PENTIUM4 COREI7 COREI7AVX COREAVXI COREAVX2)
_CPUSUFFIXES=(core2 k7 k8 k10 barcelona bobcat bulldozer piledriver psc atom p2 p3 pm p4 nehalem sandybridge ivybridge haswell)

###

pkgname=('linux-pf-lts' 'linux-pf-lts-headers')
pkgver=${_basekernel}.${_patchlevel}
arch=('i686' 'x86_64')
url="http://pf.natalenko.name/"
license=('GPL2')
makedepends=('git' 'xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')
# That voodoo that you do
_incr=($(for i in $(seq -w ${_pfpatchlevel} $((_patchlevel-1)) ); do echo https://www.kernel.org/pub/linux/kernel/v4.x/incr/patch-4.4.$i-$((i+1)).xz; done))

source=(https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.{xz,sign}
        # the main kernel config files
        'config' 'config.x86_64'
        # standard config files for mkinitcpio ramdisk
        "$pkgbase.preset"
        # pacman hook for initramfs regeneration
        '99-linux.hook'
        '0001-sdhci-revert.patch'
        'logo_linux_clut224.ppm.bz2'		#\
        'logo_linux_mono.pbm.bz2'		#-> the Arch Linux boot logos
        'logo_linux_vga16.ppm.bz2'		#/
        "${_pfpatchhome}${_pfpatchname}.xz"	# the -pf patchset
        ${_incr[@]})				# the incremental kernel patches
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds <torvalds@linux-foundation.org>
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>
             )

_aufs3git="http://git.code.sf.net/p/aufs/aufs3-standalone"
_aufs3name=aufs3-standalone

_kernelname=${pkgbase#linux}
# '

prepare() {
  cd "${srcdir}/${_srcname}"


  # This is for me, to test the PKGBUILD

  # Arch linux logo
  msg "Replacing penguins with arches"
  bzip2 -dk ${startdir}/logo_linux_*.bz2
  mv -f ${startdir}/logo_linux_*.p?m drivers/video/logo/

  msg "Applying pf-kernel patch"
  patch -Np1 < ${srcdir}/${_pfpatchname}

  if [[ ${_AUFS} = 'y' ]]; then
    msg "Fetching and applying aufs3 patches"
    git clone ${_aufs3git} ${_aufs3name}
    cd ${_aufs3name}
    git checkout origin/aufs${_basekernel} || _aufs3checkout=KRAKRA
    if [[ ${_aufs3checkout} = "KRAKRA" ]]; then
	echo
        msg "AUFS3 not yet ported to version ${_basekernel}!"
        msg "Skipping related patches."
	echo
	cd ..
     else
#        mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"
#        mv include/linux/Kbuild "${pkgdir}/usr/src/linux-${_kernver}/include/"
	rm include/uapi/linux/Kbuild
	cd ..
	cp -a ${_aufs3name}/{Documentation,fs,include} ${srcdir}/linux-${_basekernel}/
	msg "Patching aufs3"
	for _patch in ${_aufs3name}/*.patch; do
	    patch -Np1 -i ${_patch} || _aufs3fail=KRAKRA
        done
        if [[ ${_aufs3fail} = "KRAKRA" ]]; then
	    echo
    	    msg "Not all aufs3 patches applied correctly. Ignore this if you won't use AUFS."
    	    msg "Otherwise, press CTRL-C now and fix manually"
    	    echo
        fi
     fi
  fi

  # revert http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9faac7b95ea4f9e83b7a914084cc81ef1632fd91
  # fixes #47778 sdhci broken on some boards
  # https://bugzilla.kernel.org/show_bug.cgi?id=106541
  patch -Rp1 -i "${srcdir}/0001-sdhci-revert.patch"

  # Incremental patches
  for _incrpatch in "${srcdir}"/patch-${_basekernel}.??-??; do
    msg "Patching ${_incrpatch} -- Makefile fails are harmless"
    patch -Np1 -i "${_incrpatch}" || true
  done

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

#  if [ "${_kernelname}" != "" ]; then
#    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
#    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
#  fi

  # Set EXTRAVERSION to -pf
  #  sed -i "s/EXTRAVERSION = -${_pfrel}/EXTRAVERSION = ${_kernelname}/" Makefile
  sed -ri "s/^(EXTRAVERSION =).*/\1 ${_kernelname}/" Makefile

  _arch=$CARCH
  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # If the following is set, stop right there. We only need the headers for
  # dependent drivers' compiling (nvidia, virtualbox etc)

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

  # get kernel version
#  make prepare
}

build() {
  cd "${srcdir}/${_srcname}"
  #----------------------------------------

  if [[ "$_BATCH" != "y" ]]; then		# for batch building
    echo
    echo "======================================================="
    msg "You might be prompted below for some config options"
    echo "======================================================="
    echo
    msg "Hit <Y> to use your running kernel's config"
    echo "    (needs IKCONFIG and IKCONFIG_PROC)"
    msg "Hit <L> to run 'make localmodconfig'"
    msg "Hit <N> (or just <ENTER>) to build an all-inclusive kernel like stock Arch linux-lts"
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
	  if [ -e /usr/bin/modprobed_db ]; then
	    sudo /usr/bin/modprobed_db recall
	  else
	    msg "modprobed_db not installed, running make localmodconfig instead..."
	    make localmodconfig
	  fi
        fi
      fi
    elif [[ "$answer" = "l" ]]; then
      # Copied from kernel26-ck's PKGBUILD
      msg "Attempting to run /usr/bin/reload_database with sudo from modprobe_db..."
      if [ -e /usr/bin/modprobed_db ]; then
	sudo /usr/bin/modprobed_db recall
      fi
      msg "Running 'make localmodconfig'..."
      make localmodconfig
    else
      msg "Using stock Arch linux-lts kernel .config (with BFS, BFQ and TuxOnIce enabled)."
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
    echo "    <ENTER> to skip configuration and use stock Arch linux-lts defaults"
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

  # Provide option to rename package according to CPU
    echo
    if [[ "$CPU" = "GENERIC" ]]; then
      msg "Hit <P>     :  to remove the patchlevel number from kernver"
      msg "               (i.e. linux-pf-lts-${_basekernel})"
      msg "Hit <ENTER> :  to include the patchlevel number in kernver (default)"
      msg "               (i.e. linux-pf-lts-${_basekernel}.${_patchlevel})"
      read answer
      shopt -s nocasematch
      if [[ "$answer" = "p" ]]; then
	export _SUBLEVEL=n
      fi
    else
      lcpu=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
      lcpu=$(sed -e "s/entium//" <<<$lcpu)
      echo "=============================================================="
      msg "An non-generic CPU was selected for this kernel."
      echo
      msg "Hit <G>     :  to create a generic package named linux-pf-lts"
      msg "Hit <ENTER> :  to create a package named after the selected CPU"
      msg "               (linux-pf-lts-${lcpu} - recommended default)"
      echo
      msg "This option affects ONLY the package name. Whether or not the"
      msg "kernel is optimized was determined at the previous config step."
      echo "=============================================================="
      read answer
      shopt -s nocasematch
      if [[ "$answer" != "g" ]]; then
	export _PKGOPT=y
      fi
      msg "Hit <P>     :  to remove the patchlevel number from kernver"
      if [[ ${_PKGOPT} != "y" ]]; then
	msg "               (i.e. linux-pf-lts-${_basekernel})"
      else
	msg "               (i.e. linux-pf-lts-${lcpu}-${_basekernel})"
      fi
      msg "Hit <ENTER> :  to include the patchlevel number in kernver (default)"
      if [[ ${_PKGOPT} != "y" ]]; then
	msg "               (i.e. linux-pf-lts-${_basekernel}.${_patchlevel})"
      else
	msg "               (i.e. linux-pf-lts-${lcpu}-${_basekernel}.${_patchlevel})"
      fi
      read answer
      shopt -s nocasematch
      if [[ "$answer" = "p" ]]; then
	export _SUBLEVEL=n
      fi
    fi
  fi	# batch check ends here
  export CPU
  #----------------------------------------

  # Strip config of uneeded localversion
#  if [ "${_kernelname}" != "" ]; then
  sed -ri 's|(CONFIG_LOCALVERSION=).*|\1|g' ./.config
#  sed -ri 's|(CONFIG_LOCALVERSION_AUTO=).*|\1=n|' ./.config
#  fi

  # Remove the sublevel from Makefile, *if asked*.
  # This ensures our kernel version is always MAJ.MIN-pf
  # This way, minor kernel updates might not break external modules
  if [ "${_SUBLEVEL}" = "n" ]; then
     sed -ri 's|^(SUBLEVEL =).*|\1|' Makefile
  else
     sed -ri "s|^(SUBLEVEL =).*|\1 ${_patchlevel}|" Makefile
  fi

  # rewrite configuration
  yes "" | make config >/dev/null

  #cd "${srcdir}/${_srcname}"
  # Build
  # Want extreme and non-sensical optimization? Uncomment the following line!
  # export KCFLAGS="-march=native -Ofast"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
msg "Running package-${pkgbase}()"
 _pkgdesc="Linux kernel and modules with the pf-kernel patchset [-ck patch (BFS included), TuxOnIce, BFQ, UKSM] and aufs3. Long-term support."
 pkgdesc=${_pkgdesc}
 [ "${pkgbase}" = "linux" ] && groups=('base')
 depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
 optdepends=('linux-lts-docs: Kernel hackers manual - HTML documentation that comes with the Linux kernel.'
	    'crda: to set the correct wireless channels of your country'
	    'pm-utils: utilities and scripts for suspend and hibernate power management'
	    'tuxonice-userui: TuxOnIce userspace user interface'
	    'hibernate-script: set of scripts for managing TuxOnIce, hibernation and suspend to RAM'
	    'nvidia-pf: NVIDIA drivers for linux-pf-lts'
	    'nvidia-beta-all: NVIDIA drivers for all installed kernels'
	    'modprobed_db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
 #provides=(${pkgbase}=${_basekernel} 'aufs3')	# for $pkgname-optimized
 provides=(${pkgbase}=${_basekernel} linux=${pkgver} 'aufs3')
 # below 'provides' is for when you have no other kernel (which is a bad idea anyway)
 # provides=(${pkgbase}=${_basekernel} 'linux=${pkgver}' 'aufs3')

 # If generic build, then conflict with all optimized ones
 for _cpusuffix in "${_CPUSUFFIXES[@]}" ; do
   conflicts+=(${pkgbase}-${_cpusuffix})
 done

 replaces=('aufs3')
 backup=("etc/mkinitcpio.d/${pkgbase}.preset")
 install="$pkgbase.install"

 #'
  cd "${srcdir}/${_srcname}"

  # Remove undeeded aufs3 git tree
  rm -fr aufs3 2>/dev/null

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
         pkgdesc="${_pkgdesc} AMD K10 optimized"
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
     COREI7)
         pkgname="${pkgbase}-nehalem"
         pkgdesc="${_pkgdesc} Intel Core Nehalem optimized."
         ;;
     COREI7AVX)
         pkgname="${pkgbase}-sandybridge"
         pkgdesc="${_pkgdesc} Intel 2nd Gen Core processors including Sandy Bridge."
         ;;
     COREAVXI)
         pkgname="${pkgbase}-ivybridge"
         pkgdesc="${_pkgdesc} Intel 3rd Gen Core processors including Ivy Bridge."
         ;;
     COREAVX2)
         pkgname="${pkgbase}-haswell"
         pkgdesc="${_pkgdesc} Intel AVX-2 processors including Haswell."
         ;;
     default)
  # Note to me: DO NOT EVER REMOVE THIS. It's for the AUR PKGBUILD parser.
         pkgname="${pkgbase}"
         pkgdesc="Linux kernel and modules with the pf-kernel patchset [-ck patch (BFS included), TuxOnIce, BFQ, UKSM] and aufs3. Long-term support."
         ;;
    esac

  # If optimized build, conflict with generic and other optimized ones
  if [[ "$pkgname" != "$pkgbase" ]]; then
	pkgnameopt="${pkgname}"		# this MUST be inside this if-fi
	pkgname="${pkgbase}"
#	echo pkgname $pkgnameopt
	cpuopt=`sed -e "s/linux-pf-lts-//" <<<$pkgnameopt`		# get suffix
	cpuoptdesc=`sed -e "s/${_pkgdesc}//" <<<$pkgdesc`	# get description
	conflicts=(${conflicts[@]/${pkgbase}-${cpuopt}/})		# remove current
	conflicts=(${conflicts[@]/${pkgbase}-headers-${cpuopt}/})	# remove current's headers
	export cpuopt cpuoptdesc
  fi

  # second batch check ends here
 fi

 # Pass conflicts array to linux-pf-lts-headers() BEFORE adding generic linux-pf-lts or headers will conflict
#  export _conflicts=${conflicts[@]}
  if [[ $cpuopt ]]; then
	conflicts+=(${pkgbase})		# add generic
  fi
#  conflicts=('linux-pf-lts' ${conflicts[@]})	# add generic packages

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgnameopt}"
  if [[ "$cpuopt" ]]; then
       msg  "and ${pkgbase}-${headers}-${cpuopt}"
  else
       msg  "and ${pkgbase}-${headers}"
  fi
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
#  _basekernel=${_kernver%%-*}
#  _basekernel=${_basekernel%.*}

  ### c/p from linux-lts

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/99-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"

# end c/p

  ###
  # Trick the AUR parser to accept split PKGBUILD
  true && pkgname="${pkgnameopt}"
}

_package-headers() {
msg "Running package-${pkgbase}()"
  pkgdesc="Header files and scripts for building modules for linux-pf-lts kernel."
#  IFS=' ' read -a conflicts <<<${_conflicts}
#  conflicts=( ${_conflicts[@]} )
  conflicts=()
  for _cpusuffix in "${_CPUSUFFIXES[@]}" ; do
    conflicts+=(${pkgbase}-headers-${_cpusuffix})
  done

  # Remove own headers and add generic ones to conflicts, if optimized
  if [[ $cpuopt ]]; then
	conflicts=(${conflicts[@]/${pkgbase}-headers-${cpuopt}/})	# remove current
	conflicts+=(${pkgbase}-headers)		# add generic
  fi

  [[ ${cpuopt} ]] && pkgname=${pkgname}-${cpuopt}	# && depends=${depends}-${cpuopt}
  [[ ${cpuoptdesc} ]] && pkgdesc=${pkgdesc}${cpuoptdesc}
  provides=(${pkgbase}-headers linux-headers=${pkgver})
  cd "${srcdir}/linux-${_basekernel}"

# c/p from linux-ARCH

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi sound trace uapi video xen; do
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

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

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
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

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

  # remove a file already in linux package
  rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done
sha256sums=('401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2'
            'SKIP'
            'f6e6c2a7adf524789d252896b5033eaee5afac071677e65e49e085ac169abea1'
            'e2f58744ddc747a8cd3dff60b70df07093941249cb8ea07fa7d94627b6fc8015'
            '1f036f7464da54ae510630f0edb69faa115287f86d9f17641197ffda8cfd49e0'
            '834bd254b56ab71d73f59b3221f056c72f559553c04718e350ab2a3e2991afe0'
            '5313df7cb5b4d005422bd4cd0dae956b2dadba8f3db904275aaf99ac53894375'
            '03ed4eb4a35d42ae6beaaa5e6fdbada4244ed6c343944bba6462defaa6fed0bf'
            '51ea665cfec42d9f9c7796af2b060b7edbdeb367e42811f8c02667ad729f6b19'
            '9e1e81d80afac6f316e53947e1b081017090081cd30e6c4c473420b77af4b52b'
            'cb4d3fc91475d90179f88fe9994081b8fe37c2b6c2976778425d8e61a5a6541a'
            '76dfb59aa7f90dcb0504aedc01f3dc7b2c4339c6a1640eb04cab29b629ffb7cb')
