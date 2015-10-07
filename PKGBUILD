# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: <fsckdaemon at gmail dot com>
# Contributor: graysky <graysky AT archlinux dot us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Contributor: Kamil Kolosowski <samael@openlinux.pl>

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

pkgbase=linux-bfs
pkgname=('linux-bfs' 'linux-bfs-headers' 'linux-bfs-docs')
_kernelname=-bfs
_srcname=linux-4.1
pkgver=4.1.10
pkgrel=2
arch=('i686' 'x86_64')
url="http://ck-hack.blogspot.de"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'inetutils' 'bc')
_bfsrel=464
_bfspatch="4.1-sched-bfs-${_bfsrel}.patch"
_bfqrel=v7r8
#_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/4.1.0-${_bfqrel}"
_bfqpath="https://pf.natalenko.name/mirrors/bfq/4.1.0-${_bfqrel}/"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"

source=("http://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        "http://ck.kolivas.org/patches/bfs/4.0/4.1/${_bfspatch}"
        "http://ck.kolivas.org/patches/4.0/4.1/4.1-ck2/patches/hz-default_1000.patch"
        "http://ck.kolivas.org/patches/4.0/4.1/4.1-ck2/patches/hz-no_default_250.patch"
        "${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-${_bfqrel}-4.1.patch"
        "${_bfqpath}/0002-block-introduce-the-BFQ-${_bfqrel}-I-O-sched-for-4.1.patch"
        "${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-${_bfqrel}-for-4.1.0.patch"
        "http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
        'linux-bfs.preset'
        'change-default-console-loglevel.patch'
        'config' 'config.x86_64'
        '0000-fix_potential_deadlock_in_reqsk_queue_unlink.patch')
        
prepare() {
    cd ${_srcname}

     ### Add upstream patch
         msg "Add upstream patch"
         patch -Np1 -i "${srcdir}/patch-${pkgver}"
     
     ### Fix https://bbs.archlinux.org/viewtopic.php?pid=1568197#p1568197
         msg "Fix potential deadlock in reqsk_queue_unlink"
	 patch -Np1 -i "$srcdir/0000-fix_potential_deadlock_in_reqsk_queue_unlink.patch"
         
     ### set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
     # remove this when a Kconfig knob is made available by upstream
     # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
         msg "Patching set DEFAULT_CONSOLE_LOGLEVEL to 4"
         patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"
 
     ### Patch source with BFS 
         msg "Patching source with BFS v0.464"
         patch -Np1 -i "${srcdir}/${_bfspatch}"
    
     ### Patch source with ck-hz patches
         msg "Patch source with ck-hz patches"
         for p in "${srcdir}"/hz-*.patch; do
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

package_linux-bfs() {
    pkgdesc="Linux Kernel and modules with BFS and BFQ schedulers"
    depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
    optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-bfs: nVidia drivers for linux-bfs' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    backup=("etc/mkinitcpio.d/linux-bfs.preset")
    install=linux-bfs.install

    cd ${_srcname}

    KARCH=x86

    # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-bfs"

    # set correct depmod command for install
    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed \
    -e "s/KERNEL_NAME=.*/KERNEL_NAME=-bfs/g" \
    -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    -i "${startdir}/${install}"

    # install mkinitcpio preset file for kernel
    install -D -m644 "${srcdir}/linux-bfs.preset" "${pkgdir}/etc/mkinitcpio.d/linux-bfs.preset"
    sed \
    -e "1s|'linux.*'|'linux-bfs'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-bfs\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-linux-bfs.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-bfs-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/linux-bfs.preset"

    # remove build and source links
    rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
    # remove the firmware
    rm -rf "${pkgdir}/lib/firmware"
    # make room for external modules
    ln -s "../extramodules-${_basekernel}${_kernelname:bfs}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    # add real version for building modules and running depmod from post_install/upgrade
    mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:bfs}"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:bfs}/version"

    # Now we call depmod...
    depmod -b "${pkgdir}" -F System.map "${_kernver}"

    # move module tree /lib -> /usr/lib
    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    # add vmlinux
    install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-bfs-headers() {
    pkgdesc='Header files and scripts to build modules for linux-bfs.'
    depends=('linux-bfs')

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


package_linux-bfs-docs() {
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-bfs kernel"
    depends=('linux-bfs')

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

sha512sums=('168ef84a4e67619f9f53f3574e438542a5747f9b43443363cb83597fcdac9f40d201625c66e375a23226745eaada9176eb006ca023613cec089349e91751f3c0'
            'SKIP'
            '3b5cb5c8f494958c39a06a1b416e3e5a075a3c76c44f8bf1ae5a14deec9861407100c2ef59b0720e8fc0729b5c8422b4d819ff59f1f7ec4eed20c5ba8a95d6d5'
            'SKIP'
            '9ff7279db6a976c495ba1e09466d688d84f0ef9cca2912e8aeb12f68070e9af012a3c3558e25daf9459fce7d27dc9a82f8fe58f3499164d42ea4561ea62391b5'
            '205059a0ac0fff34298695685a2de8806193b45a270e5818dd942d7c2d07f1d116eacf69dbaf4c99fe342d56b4f43ee4d2b3675a706724ed18cbc39618865d26'
            'f31469c53e1ae5d1a4caa67b3f6e51a9699c74aadb8f9468189baf6695c00a8d7b151625822da293a2b8344b94c2ba0e191f7a713825111af2b6690d2e5cacee'
            '383cd020ab882389731ef78abca727eccc8247ed82b95c89df93d7065bfde093b82e32190ad1fb29b37de35eb20b40339f2c02ad694a3978884255b193f5bc1a'
            'f7bcb50e7de166e0d89194a3cad1feae99c4a5a9918e8af691d7635ed8ef64762ff2af4702dc6ba0eef0fc01ad75173abddbf01ae89bc6e03ace5e54f4098b12'
            '1db70764577d3e8d5e65351bdef7f2cf61d2546138a6342c4bf4e5e6738b8e06b5291a9a0c12f9fc2c8cb620048006d05474cf75902cb26e7504038150cf0a44'
            '76bf6a9f22b023ab8f780884f595dac1801d150ecd94f88da229c5c9ea98d2c3ef8add01ff7e18e4cbbfa5e6e9c022c4042ee62c779a8485203c1b0e082b8ccc'
            '84a7c3b96959cb2dd7687b968ba4522b62919529e2c0e166c0369e6cf77ff0e7ee387ca22a0980fc37dd100812205ab2c17b6c4d5dda51958ac1e66693f22925'
            'd9d28e02e964704ea96645a5107f8b65cae5f4fb4f537e224e5e3d087fd296cb770c29ac76e0ce95d173bc420ea87fb8f187d616672a60a0cae618b0ef15b8c8'
            'f1b175f9c0c1735ac26fcd9705a1d6fd7253b6d47de89c3537ef886a7957c2ebc0f535b816dfa6922e1830796a7da4ac9cde1dd2a650369c41d766ea4b144d1e'
            'c34d13f9ae6564461cc69aad176b4deee98efe9ec5058db2fe34f33387092022da1c59af4e37caff799c71eb2829669295cb0a6fbadeac368be937aaf7f65094'
            'bf8045913bc87df289cb6089b9428b2eb685ef3a745c7531b628111ba58ec33fb6e707a74ecdd53b6d59169c4354e02efff585ef16a1645ce5b04e54257f8f50')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
