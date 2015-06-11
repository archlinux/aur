# Maintainers:
#	Claire Farron <diesal3@googlemail.com>
#	Andes Ho <mxah002@live.rhul.ac.uk> (Secondary Package Tester)
# Former Maintainer
#	Duncan Townsend <duncant@mit.edu> (Original Submitter)
# Contributors of the linux PKGBUILD
#	Tobias Powalowski <tpowa@archlinux.org>
#	Thomas Baechler <thomas@archlinux.org>
# Contributor of the -ck PKGBUILD
#	graysky <graysky AT archlinux DOT us>
# Contributor of the -pax PKGBUILD
#	phects <phects@orgizm.net>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null (y or hello or 2 or "I like icecream") to enable them
#
_1k_HZ_ticks=y	# Run with a 1kHz tick rate
_makenconfig=	# Tweak kernel options prior to a build via nconfig
_localmodcfg=	# Compile ONLY probed modules
_use_current=	# Use the current kernel's .config file
_BFQ_enable_=	# Enable BFQ as the default I/O scheduler
_NUMAdisable=y	# Disable NUMA in kernel config

### DOCS
# This package has shipped with GCC optimisations since the 3.6.9-3 release, currently with enable_additional_cpu_optimizations_for_gcc.patch.
# This allows users an expanded scope of CPU specific options.
# Consult the following resources to understand which option is right for you application:
#
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/AMD
# http://www.linuxforge.net/docs/linux/linux-gcc.php
# http://gcc.gnu.org/onlinedocs/gcc/i386-and-x86_002d64-Options.html
 
# DETAILS FOR _1k_HZ_ticks
# Running with a 1000 HZ tick rate (vs the ARCH 300) is reported to solve the
# issues with the bfs/linux 3.1x and suspend. For more see:
# http://ck-hack.blogspot.com/2013/09/bfs-0441-311-ck1.html?showComment=1378756529345#c5266548105449573343

# DETAILS FOR _NUMAdisable=
# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187

# DETAILS FOR _localmodcfg=
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

# DETAILS FOR _use_current=
# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.

# DETAILS FOR _BFQ_enable=
# Alternative I/O scheduler by Paolo.
# Set this if you want it enabled globally i.e. for all devices in your system
# If you want it enabled on a device-by-device basis, leave this unset and see:
# https://wiki.archlinux.org/index.php/Linux-ck#How_to_Enable_the_BFQ_I.2FO_Scheduler

# CONFIG_PAX_USERCOPY must not be set for AMD's FGLRX to work. See:
# https://en.wikibooks.org/wiki/Grsecurity/Application-specific_Settings#ATI_Catalyst_.28fglrx.29_graphics_driver

### Do not edit below this line unless you know what you're doing

pkgname=linux-ck-pax
true && pkgname=(linux-ck-pax linux-ck-pax-headers)
_kernelname=-ck-pax
_srcname=linux-3.19
pkgver=3.19.2
pkgrel=1
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
_ckpatchversion=1
_ckpatchname="patch-3.19-ck${_ckpatchversion}"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.19.0-v7r7"
_paxver=test11
source=("https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.sign"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign"
		"http://ck.kolivas.org/patches/3.0/3.19/3.19-ck${_ckpatchversion}/${_ckpatchname}.xz"
		"http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
		'config.x86_64' 'config'
		'linux-ck-pax.preset'
		'change-default-console-loglevel.patch'
		"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r7-3.19.patch"
		"${_bfqpath}/0002-block-introduce-the-BFQ-v7r7-I-O-sched-for-3.19.patch"
		"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r7-for-3.19.0.patch"
		"pax-ck-${pkgver}-${_paxver}.patch"
        "pax-ck-${pkgver}-${_paxver}.patch.asc"
		"http://grsecurity.net/~paxguy1/pax-linux-${pkgver}-${_paxver}.patch")

sha256sums=('be42511fe5321012bb4a2009167ce56a9e5fe362b4af43e8c371b3666859806c'
            'SKIP'
            'c2e2e745e7bad33f367432280f7a8451e2488b1f851f24e2830f15279fb87b0f'
            'SKIP'
            '6d3043360485bbf3b8b6b780d62ff529074489e6a4d0086607de873d1278c031'
            'deacee3a3d9b06bc2aae74d908cef183dd39c4f3049567c488950f019ec95d79'
            'c0ca33ee9e2ec6dd6f170ab9f99f575e0b448afdf45ff45e847737454cf66fa9'
            '88ae4bcd38deb06c1aa4d9fdbb4f0b5f8ce536aff2fe96c4708006f7d3addf6d'
            'f126f7d4005b5d0adb61f0ccde95ac42baaf6f2bec14babd6d14935e377481b2'
            '1256b241cd477b265a3c2d64bdc19ffe3c9bbcee82ea3994c590c2c76e767d99'
            'fac4a507a7a16948a0069be784624f87effeb0b7992507104c7db81c190c93e2'
            '621d4877d992f353ec6d9f977377552077aeebe85c47e65716e99d699af5cb11'
            '1509740239a2f5b623bc05b3b9efbfd4e2fa75029503e0770a274f7e7c59d79f'
            '49fdeb3568a833eb33cfb05538ec020ec38498cd3109f48332cb57963ed52e00'
            'SKIP'
            'a02d28fb2105c360add549897b44ae6e9f2b52c6f8f891129849b38930380afc')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '5F885602C7FD0951F565E27949F67298E6366A92' # Claire Farron
             )

prepare() {
	cd "${srcdir}"
	
	# patch PaX to play nice with BFS
	msg "Patching PaX to be compatible with BFS"
	patch --follow-symlinks -i "${srcdir}/pax-ck-${pkgver}-${_paxver}.patch" -o "${srcdir}/pax-linux-bfs-${pkgver}-${_paxver}.patch"

	cd "${_srcname}"

	# add upstream patch
	#msg "Patching source to v$pkgver"
	patch -p1 -i "${srcdir}/patch-${pkgver}"
	
	# add latest fixes from stable queue, if needed
	# http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
	
	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

	# patch source with ck patchset with BFS
	# fix double name in EXTRAVERSION
	sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/${_ckpatchname}"
	msg "Patching source with ck1 including BFS v0.461"
	patch -Np1 -i "${srcdir}/${_ckpatchname}"

	# Patch source to enable more gcc CPU optimizatons via the make nconfig
	msg "Patching source with gcc patch to enable more cpus types"
	patch -Np1 -i "${srcdir}/${_gcc_patch}"
	
	msg "Patching source with BFQ patches"
	for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
		patch -Np1 -i "$p"
	done
	
	# add PaX patches
	msg "Patching source with PaX"
	patch -Np1 -i "${srcdir}/pax-linux-bfs-${pkgver}-${_paxver}.patch"
	
	# Clean tree and copy ARCH config over
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

	### Optionally disable NUMA since >99% of users have mono-socket systems.
	# For more, see: https://bugs.archlinux.org/task/31187
	if [ -n "$_NUMAdisable" ]; then
		if [ "${CARCH}" = "x86_64" ]; then
			msg "Disabling NUMA from kernel config..."
			sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
				-i -e '/CONFIG_AMD_NUMA=y/d' \
				-i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
				-i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
				-i -e '/# CONFIG_NUMA_EMU is not set/d' \
				-i -e '/CONFIG_NODES_SHIFT=6/d' \
				-i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
				-i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
				-i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
				-i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
		fi
	fi

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
		msg "If you have modprobe_db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed_db ]; then
			[[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo.  Install via pacman -S sudo and configure to work with this user." && exit 1
			sudo /usr/bin/modprobed_db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

	if [ -n "$_makenconfig" ]; then
		msg "Running make nconfig"
		make nconfig
	fi

	# rewrite configuration
	yes "" | make config >/dev/null

	# save configuration for later reuse
#	if [ "${CARCH}" = "x86_64" ]; then
#		cat .config > "${startdir}/config.x86_64.last"
#	else
#		cat .config > "${startdir}/config.last"
#	fi
}

build() {
		cd "${_srcname}"
		make ${MAKEFLAGS} LOCALVERSION= bzImage modules
		msg "Running make bzImage and modules"
}

package_linux-ck-pax() {
	pkgdesc='Linux Kernel with the ck1 patchset featuring the Brain Fuck Scheduler v0.461 and PaX security patch.'
	#_Kpkgdesc='Linux Kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.461 and PaX security patch.'
	#pkgdesc="${_Kpkgdesc}"
	depends=('linux-pax-flags' 'coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
	optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-dkms: nVidia drivers via dkms' 'nvidia-beta-dkms: nVidia beta drivers via dkms' 'nvidia-340xx-dkms: nVidia drivers via dkms, 340xx legacy branch' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
	provides=("linux-ck=${pkgver}" "linux-pax=${pkgver}")
	conflicts=('kernel26-ck' 'kernel26-pax')
	replaces=('kernel26-ck' 'kernel26-pax')
	backup=("etc/mkinitcpio.d/linux-ck-pax.preset")
	install=linux-ck-pax.install
	groups=('base')

	cd "${_srcname}"

	KARCH=x86

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-ck-pax"

	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg

	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=-ck-pax/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		-i "${startdir}/${install}"

	# install mkinitcpio preset file for kernel
	install -D -m644 "${srcdir}/linux-ck-pax.preset" "${pkgdir}/etc/mkinitcpio.d/linux-ck-pax.preset"
	sed \
		-e "1s|'linux.*'|'linux-ck-pax'|" \
		-e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-ck-pax\"|" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs-linux-ck-pax.img\"|" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-ck-pax-fallback.img\"|" \
		-i "${pkgdir}/etc/mkinitcpio.d/linux-ck-pax.preset"

	# remove build and source links
	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
	# remove the firmware
	rm -rf "${pkgdir}/lib/firmware"
	# gzip -9 all modules to save 100MB of space
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
	# make room for external modules
	ln -s "../extramodules-${_basekernel}${_kernelname:ck-pax}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:ck-pax}"
	echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:ck-pax}/version"

	# Now we call depmod...
	depmod -b "${pkgdir}" -F System.map "${_kernver}"

	# move module tree /lib -> /usr/lib
	mkdir -p "${pkgdir}/usr"
	mv "${pkgdir}/lib" "${pkgdir}/usr/"

	# add vmlinux
	install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}


package_linux-ck-pax-headers() {
	pkgdesc='Header files and scripts to build modules for linux-ck-pax.'
	#_Hpkgdesc='Header files and scripts to build modules for linux-ck-pax.'
	#pkgdesc="${_Hpkgdesc}"
	depends=('linux-ck-pax') # added to keep kernel and headers packages matched
	provides=("linux-ck-pax-headers=${pkgver}" "linux-pax-headers=${pkgver}" "linux-ck-headers=${pkgver}")
	conflicts=('kernel26-ck-pax-headers')
	replaces=('kernel26-ck-pax-headers')
	groups=('base')

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
	 rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}
