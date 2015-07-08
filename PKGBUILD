# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

# Tweak kernel options prior to a build via xconfig
_makexconfig=

# Tweak kernel options prior to a build via gconfig
_makegconfig=

# Running with a 1000 HZ tick rate (vs the ARCH 300) is reported to solve the
# issues with the bfs/linux 3.1x and suspend. For more see:
# http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1378756529345#c5266548105449573343
_1k_HZ_ticks=y

### Do not disable NUMA until CK figures out why doing so causes panics for
### some users!
# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
#_NUMAdisable=y

# Compile ONLY probed modules
# As of mainline 2.6.32, running with this option will only build the modules
# that you currently have probed in your system VASTLY reducing the number of
# modules built and the build time to do it.
#
# WARNING - ALL modules must be probed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD will call it directly to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

# Alternative I/O scheduler by Paolo.
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_Enable_the_BFQ_I.2FO_Scheduler
_BFQ_enable_=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-bridge-pl
pkgname=('linux-bridge-pl' 'linux-bridge-pl-headers' 'linux-bridge-pl-docs')
_kernelname=-bridge-pl
_srcname=linux-4.0
pkgver=4.0.7
pkgrel=1
arch=('i686' 'x86_64')
url="http://kerneldedup.org/"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'inetutils' 'bc')
_uksmvernel="0.1.2.4-beta"
_uksmname="v4.0"
_bfsrel=462
_bfspatch="4.0-sched-bfs-${_bfsrel}.patch"
_bfqrel=v7r8
#_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/4.0.0-${_bfqrel}"
_bfqpath="https://pf.natalenko.name/mirrors/bfq/4.0.0-${_bfqrel}/"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"

source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        #"http://kerneldedup.org/download/uksm/${_uksmvernel}/uksm-${_uksmvernel}-for-${_uksmname}.patch" # website often went down
        "uksm-${_uksmvernel}-for-linux-${_uksmname}.patch"
        "http://ck.kolivas.org/patches/bfs/4.0/4.0/${_bfspatch}"
        "http://ck.kolivas.org/patches/4.0/4.0/4.0-ck1/patches/hz-default_1000.patch"
        "http://ck.kolivas.org/patches/4.0/4.0/4.0-ck1/patches/hz-no_default_250.patch"
        "http://ck.kolivas.org/patches/bfs/4.0/4.0/pending/bfs462-rtmn-fix.patch"
        "http://ck.kolivas.org/patches/bfs/4.0/4.0/pending/bfs462-update_inittask.patch"
        "bfs462-nosubmit.patch"
        "${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-${_bfqrel}-4.0.patch"
        "${_bfqpath}/0002-block-introduce-the-BFQ-${_bfqrel}-I-O-sched-for-4.0.patch"
        "${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-${_bfqrel}-for-4.0.0.patch"
        "http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
        'linux-bridge-pl.preset'
        'change-default-console-loglevel.patch'
        'config' 'config.x86_64'
        '0004-block-loop-convert-to-per-device-workqueue.patch'
        '0005-block-loop-avoiding-too-many-pending-per-work-I-O.patch')
        
prepare() {
    cd ${_srcname}

    ### Add upstream patch
        msg "Add upstream patch"
        patch -Np1 -i "${srcdir}/patch-${pkgver}"
        
    ### Fix deadlock with stacked loop devices (FS#45129)
    # http://marc.info/?l=linux-kernel&m=143280649731902&w=2
        msg "Fix deadlock with stacked loop devices (FS#45129)"
        for p in "${srcdir}"/000{4,5}-block*.patch; do
        msg " $p"
        patch -Np1 -i "$p"
        done
    
    ### set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
    # remove this when a Kconfig knob is made available by upstream
    # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
        msg "Patching set DEFAULT_CONSOLE_LOGLEVEL to 4"
        patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"
        
    ### Patch source with UKSM
        msg "Patching with UKSM"
        patch -Np1 -i "${srcdir}/uksm-${_uksmvernel}-for-linux-${_uksmname}.patch"
 
    ### Patch source with BFS 
        msg "Patching source with BFS v0.462"
        patch -Np1 -i "${srcdir}/${_bfspatch}"
    
    ### Patch source with ck-hz patches
        msg "Patch source with ck-hz patches"
        for p in "${srcdir}"/hz-*.patch; do
        msg " $p"
        patch -Np1 -i "$p"
        done 
    
    ### Patch source with bfs462 fix patches
        msg "Patching source with bfs462 fix patches"
        for p in "${srcdir}"/bfs462*.patch; do
        msg " $p"
        patch -Np1 -i "$p"
        done
   
    ### Patch source with BFQ
        msg "Patching source with BFQ patches"
        for p in "${srcdir}"/000{1,2,3}-block*.patch; do
        msg " $p"
        patch -Np1 -i "$p"
        done
    
    ### Patch source to enable more gcc CPU optimizatons via the make nconfig
        msg "Patching source with gcc patch to enable more cpus types"
        patch -Np1 -i "${srcdir}/${_gcc_patch}"

    
    ### Clean tree and copy ARCH config over
	msg "Running make mrproper to clean source tree"
	make mrproper

	if [ "${CARCH}" = "x86_64" ]; then
		cat "${srcdir}/config.x86_64" > ./.config
	else
		cat "${srcdir}/config" > ./.config
	fi

	### Optionally set tickrate to 1000 to avoid suspend issues as reported here:
	# http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1379234249615#c4156123736313039413
	if [ -n "$_1k_HZ_ticks" ]; then
		msg "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
			-i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
			-i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
	fi

	### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "You kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

	if [ "${_kernelname}" != "" ]; then
		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
		sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
	fi
        
        ### Do not disable NUMA until CK figures out why doing so causes panics for
	### some users!
	### Optionally disable NUMA since >99% of users have mono-socket systems.
	# For more, see: https://bugs.archlinux.org/task/31187
#	if [ -n "$_NUMAdisable" ]; then
#		if [ "${CARCH}" = "x86_64" ]; then
#			msg "Disabling NUMA from kernel config..."
#			sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
#				-i -e '/CONFIG_AMD_NUMA=y/d' \
#				-i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
#				-i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
#				-i -e '/# CONFIG_NUMA_EMU is not set/d' \
#				-i -e '/CONFIG_NODES_SHIFT=6/d' \
#				-i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
#				-i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
#				-i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
#				-i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
#		fi
#	fi

	### Optionally enable BFQ as the default I/O scheduler
	if [ -n "$_BFQ_enable_" ]; then
		msg "Setting BFQ as default I/O scheduler..."
		sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
			-i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
	fi

	# set extraversion to pkgrel
	sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	# get kernel version
	msg "Running make prepare for you to enable patched options of your choosing"
	make prepare

	### Optionally load needed modules for the make localmodconfig
	# See https://aur.archlinux.org/packages/modprobed-db
		if [ -n "$_localmodcfg" ]; then
		msg "If you have modprobe-db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed-db ]; then
			[[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
			sudo /usr/bin/modprobed-db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi
         
        if [ -n "$_makenconfig" ]; then
		msg "Running make nconfig"
		make nconfig
	fi
	
	if [ -n "$_makemenuconfig" ]; then
		msg "Running make menuconfig"
		make menuconfig
	fi
	
	if [ -n "$_makexconfig" ]; then
		msg "Running make xconfig"
		make xconfig
	fi
	
	if [ -n "$_makegconfig" ]; then
		msg "Running make gconfig"
		make gconfig
	fi

	# rewrite configuration
	yes "" | make config >/dev/null

	# save configuration for later reuse
	if [ "${CARCH}" = "x86_64" ]; then
		cat .config > "${startdir}/config.x86_64.last"
	else
		cat .config > "${startdir}/config.last"
	fi
}

build() {
    cd ${_srcname}
    msg "Running make bzImage and modules"
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-bridge-pl() {
    pkgdesc='Linux Kernel and modules with the UKSM patchset featuring the  v1.2.4 and BFQ & BFS schedulers.'
    depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
    optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-bridge-pl: nVidia drivers for linux-bridge-pl' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    backup=("etc/mkinitcpio.d/linux-bridge-pl.preset")
    install=linux-bridge-pl.install

    cd ${_srcname}

    KARCH=x86

    # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-bridge-pl"

    # set correct depmod command for install
    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed \
    -e "s/KERNEL_NAME=.*/KERNEL_NAME=-bridge-pl/g" \
    -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${install}"

    # install mkinitcpio preset file for kernel
    install -D -m644 "${srcdir}/linux-bridge-pl.preset" "${pkgdir}/etc/mkinitcpio.d/linux-bridge-pl.preset"
    sed \
    -e "1s|'linux.*'|'linux-bridge-pl'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-bridge-pl\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-bridge-pl.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-bridge-pl-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/linux-bridge-pl.preset"

    # remove build and source links
    rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
    # remove the firmware
    rm -rf "${pkgdir}/lib/firmware"
    # make room for external modules
    ln -s "../extramodules-${_basekernel}${_kernelname:bridge-pl}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    # add real version for building modules and running depmod from post_install/upgrade
    mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:bridge-pl}"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:bridge-pl}/version"

    # Now we call depmod...
    depmod -b "${pkgdir}" -F System.map "${_kernver}"

    # move module tree /lib -> /usr/lib
    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    # add vmlinux
    install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-bridge-pl-headers() {
    pkgdesc='Header files and scripts to build modules for linux-bridge-pl.'
    depends=('linux-bridge-pl')

    install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

    cd ${_srcname}
    
    KARCH=x86
    
     # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    
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
	#cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

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
    rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

package_linux-bridge-pl-docs() {
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-bridge-pl kernel"
    depends=('linux-bridge-pl')
  
    cd ${_srcname}

    KARCH=x86

    # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
    cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
    find "${pkgdir}" -type f -exec chmod 444 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    # remove a file already in linux package
    rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

sha512sums=('ce13d2c1c17908fd9a4aa42bb6348a0cb13dd22e560bd54c61b8bfdf62726d6095f130c59177a2fe4793b7dc399481bf10d3556d1d571616000f180304e5a995'
            'SKIP'
            '94c9ae61d665bdb06b2558b4e473777c13cb77e00c4b6cab326d10372f64bb8a9550f8bc2e2d3e1bf2a4ddf2adf1f3546a93e727aeb6b8792057017276dd9683'
            'SKIP'
            'ce46c47a1685f5014f4ada55b9ee6292255a383f83c04ac84ae922d16fef0687ebf09e7a6b211f23c6d1156312ef812c950805979893792f3e19b6c643d2fb81'
            '576f7383bc4ade80a9180859d235d5d9c273a927ffbd4b36e0d7abd223b5998d628ce2a061025c5506ecf21b57dd10cb08bf9ef40e26f7203f84c01466d98d3a'
            '60622801e4f092b81af821a44bee47bba5a1cbecf66795a0c30774ee537a933bad0f7103157c273ab173d68268c3adc2962d7d47e29693cdeadf071ef64d2e2a'
            'a37ec7048b4da0ab0f58713aff5f347b80a6aceb476d523326cecd596942f0a0b893724e30af6ccee47395edfe5d1a49c836df8f6d7c4d0358336826f4e9a819'
            '47e4134fa35a1596b390bdc7eadc59b75b88594e84b54a71a0fd7886bbef083c174ca5627bd2a899966eddd35b676df735b0304e737218040ab8edf72f333ef2'
            '623c4fc879b6bb17f1640caa268bf19cf65fbfa6c5910bbb5fdd44f1013913e5728d80fa037f33288a08ac56a23ee326951a15822a871dee2fb3d775ced9357e'
            '2948557d71436a1498747858c749b0e75b8c71a97b0af7f44ccb5b683d2dd52b100b033254d63de7502d46fc402a057b07dff73417bf31e3d9f67c8744f3610c'
            '1a08e834c4e90a7f9da77460bda1ed0efa9b331811521520402b0d094de3a1155d6e7ddbcbfcbefeef92b5468c56960750f6568cd73114a2a87a9d8a39a63fe8'
            '46cb51684ca5fd9ba9460c8a62be22e99169de1b5e87ac47f9782f52123993de61fe9563ffec062a9b7c2024d08b1d5f57e09a09dbd7841faa3d149f346f5464'
            '879ab2364ae09993f8dcd17f3c44584967cf26d26f8376611a9eb7824cf78cadf4cdae58d18f3b493d0ec48395888f1ca1395563e52501dc79f559369c931371'
            '76bf6a9f22b023ab8f780884f595dac1801d150ecd94f88da229c5c9ea98d2c3ef8add01ff7e18e4cbbfa5e6e9c022c4042ee62c779a8485203c1b0e082b8ccc'
            '796a262faa081a8a3decca67c734f989f1394aa2f0baad6dc0ce68aebd3994689726c6b301ead4174ecf86b50c5e40c22cffc8542282bbcef01aebd2526dcc85'
            'd9d28e02e964704ea96645a5107f8b65cae5f4fb4f537e224e5e3d087fd296cb770c29ac76e0ce95d173bc420ea87fb8f187d616672a60a0cae618b0ef15b8c8'
            '5ed1eaaa487b4bda7ad02ae735a85b87ed49b61f186731dff366bd2f1563a0cfd5f8ec399fb218a52f22a088ce89e4851a04692a1eaa9e343ed48ae01e47cf3b'
            'f65b7304d2a4284ccb2cff46f826b2177beefec4a8a464205f028490fee2e9b582e45e6f2a3f7a75c3bb7024cdb601c8567dbf7775c8cbf7af428b677e0789a3'
            '412d17407ecb6dffe036094a33531edb8df0c9a6e6a1aebe113733db066c8530a87710c5d51bbf5310a9a39cacc95cecf938d2e7e63903605c45c06d73b975d7'
            '68f8c2bd38baf91ac5058cda03f11b2388b3de1fd5064d8c15317354877be1ec56c92fa2f535b7e0868472a5c94fbfa225481fa0990664a786ab358bc010af3a')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
