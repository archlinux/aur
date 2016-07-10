# Maintainers:
#	Claire Farron <diesal3@googlemail.com>
#	Andes Ho <mxah002@live.rhul.ac.uk> (Secondary Package Tester)
# Former Maintainer
#	V3n3RiX <venerix@gmail.com> (Original Submitter)
# Contributors of the linux PKGBUILD
#	Tobias Powalowski <tpowa@archlinux.org>
#	Thomas Baechler <thomas@archlinux.org>
# Contributor of the -ck PKGBUILD
#	graysky <graysky AT archlinux DOT us>

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

### Do not edit below this line unless you know what you're doing

pkgname=(linux-lts41-ck linux-lts41-ck-headers)
_kernelname=-lts41-ck
_srcname=linux-4.1
pkgver=4.1.27
pkgrel=1
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
_ckpatchversion=2
_ckpatchname="patch-4.1-ck${_ckpatchversion}"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/4.1.0-v7r8"

source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
		"https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
		"https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
		"https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
		'config.x86_64' 'config'
		'linux-lts41-ck.preset'
		'change-default-console-loglevel.patch'
		# ck2
		"http://ck.kolivas.org/patches/4.0/4.1/4.1-ck${_ckpatchversion}/${_ckpatchname}.bz2"
		'bfs-009-add-preempt_offset-argument-to-should_resched.patch'
		# gcc
		"http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
		# bfq
		"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-4.1.patch"
		"${_bfqpath}/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-4.1.patch"
		"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-4.1.0.patch")

sha512sums=('168ef84a4e67619f9f53f3574e438542a5747f9b43443363cb83597fcdac9f40d201625c66e375a23226745eaada9176eb006ca023613cec089349e91751f3c0'
            'SKIP'
            '1b49e0fecc65c761bc7dde1ca769de8a9b4c601ff7a1bf69068e31aa7e0a269c1b909a6a41667efd07cecab4b8ab3abca0bd94b9cc71097f672c2af45f19106b'
            'SKIP'
            '3048d5a5e54bdf2f97d512ec12f21a296a5d54527525fafb8f2609151cd88fa4b0b69e1161ed6126c0fae4930884bf564f1218f767e897dcafa0d6ebf952ecc9'
            '7a9112366bd3659216855e33b48bb9a7af8722ed3f6ead3a705235aa632a75e85db8f4cd6e82fb04ab9b532d60a9470e6d355581af1fc5e421cc7be52b7144f0'
            'd365341656f0acf68f9e0bf62f27b14c3eb8583d332f26cdd6b5290153c5bf04d7ac1495bace54f387959ac5330113466fefd73b83663a28e6fcf20224741ca5'
            'd9d28e02e964704ea96645a5107f8b65cae5f4fb4f537e224e5e3d087fd296cb770c29ac76e0ce95d173bc420ea87fb8f187d616672a60a0cae618b0ef15b8c8'
            '356e144f858b6015415b2c3f781ca534e5f77b818302e404c3d3b35c088f4a4163356b67f98bfc95175bd52bd8b3e9a9a3e336cbcd8adf6c2d388700ce630d4d'
            'f445f12f1d79d9f464f8d337d0b72bac4a74e8064826e2a1ccd86da3b6aaef829912e2f7a11bf8e729e4ac3e4e853139abd2d028ee35bd32613615e230f943b1'
            '62fdd5c0a060a051b64093d71fbb028781061ccb7a28c5b06739a0b24dac0945740d9b73ff170784f60005a589774bcc14f56523ec51557eb3a677f726ec34cf'
            '383cd020ab882389731ef78abca727eccc8247ed82b95c89df93d7065bfde093b82e32190ad1fb29b37de35eb20b40339f2c02ad694a3978884255b193f5bc1a'
            'f7bcb50e7de166e0d89194a3cad1feae99c4a5a9918e8af691d7635ed8ef64762ff2af4702dc6ba0eef0fc01ad75173abddbf01ae89bc6e03ace5e54f4098b12'
            '1db70764577d3e8d5e65351bdef7f2cf61d2546138a6342c4bf4e5e6738b8e06b5291a9a0c12f9fc2c8cb620048006d05474cf75902cb26e7504038150cf0a44')
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

prepare() {
	cd "${_srcname}"

	# add upstream patch
	patch -p1 -i "${srcdir}/patch-${pkgver}"

	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

	# patch source with ck patchset with BFS
	# fix double name in EXTRAVERSION
	sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/${_ckpatchname}"
	msg "Patching source with ck2 including BFS v0.464"
	patch -Np1 -i "${srcdir}/${_ckpatchname}"

	# build issue fix for 4.1.12
	# http://ck-hack.blogspot.com/2015/08/bfs-464-linux-41-ck2.html?showComment=1445937376359#c8153343895524903784
	patch -Np1 -i "${srcdir}/bfs-009-add-preempt_offset-argument-to-should_resched.patch"

	# Patch source to enable more gcc CPU optimizatons via the make nconfig
	msg "Patching source with gcc patch to enable more cpus types"
	patch -Np1 -i "${srcdir}/${_gcc_patch}"
	
	msg "Patching source with BFQ patches"
	for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
		msg " $p"
		patch -Np1 -i "$p"
	done

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
	
	### Do not disable NUMA until CK figures out why doing so causes panics for
	### some users!

	# Optionally disable NUMA since >99% of users have mono-socket systems.
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

	### Optionally enable BFQ as the default I/O scheduler
	if [ -n "$_BFQ_enable_" ]; then
		msg "Setting BFQ as default I/O scheduler..."
		sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,deadline,bfq,' \
			-i -e 's/CONFIG_DEFAULT_DEADLINE=y/# CONFIG_DEFAULT_DEADLINE is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
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
		msg "If you have modprobed-db installed, running it in recall mode now"
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

package_linux-lts41-ck() {
	pkgdesc='Linux Kernel with the ck2 patchset featuring the Brain Fuck Scheduler v0.464.'
	#_Kpkgdesc='Linux Kernel and modules with the ck2 patchset featuring the Brain Fuck Scheduler v0.464.'
	#pkgdesc="${_Kpkgdesc}"
	depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
	optdepends=('crda: to set the correct wireless channels of your country'  'nvidia-dkms: nVidia drivers for linux-lts41-ck' 'nvidia-340xx-dkms: nVidia drivers for linux-lts41-ck' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
	provides=("linux-lts41-ck=${pkgver}")
	replaces=('kernel26-lts41-ck')
	backup=("etc/mkinitcpio.d/linux-lts41-ck.preset")
	install=linux-lts41-ck.install
	groups=('lts41-ck-generic')

	cd "${_srcname}"

	KARCH=x86

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts41-ck"

	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg

	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts41-ck/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		-i "${startdir}/${install}"

	# install mkinitcpio preset file for kernel
	install -D -m644 "${srcdir}/linux-lts41-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts41-ck.preset"
	sed \
		-e "1s|'linux.*'|'linux-lts41-ck'|" \
		-e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts41-ck\"|" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts41-ck.img\"|" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts41-ck-fallback.img\"|" \
		-i "${pkgdir}/etc/mkinitcpio.d/linux-lts41-ck.preset"

	# remove build and source links
	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
	# remove the firmware
	rm -rf "${pkgdir}/lib/firmware"
	# make room for external modules
	ln -s "../extramodules-${_basekernel}${_kernelname:lts41-ck}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts41-ck}"
	echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts41-ck}/version"

	# Now we call depmod...
	depmod -b "${pkgdir}" -F System.map "${_kernver}"

	# move module tree /lib -> /usr/lib
	mkdir -p "${pkgdir}/usr"
	mv "${pkgdir}/lib" "${pkgdir}/usr/"

	# add vmlinux
	install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}


package_linux-lts41-ck-headers() {
	pkgdesc='Header files and scripts to build modules for linux-lts41-ck.'
	#_Hpkgdesc='Header files and scripts to build modules for linux-lts41-ck.'
	#pkgdesc="${_Hpkgdesc}"
	depends=('linux-lts41-ck') # added to keep kernel and headers packages matched
	provides=("linux-lts41-ck-headers=${pkgver}" "linux-headers=${pkgver}")
	replaces=('kernel26-ck-lts-headers')
	groups=('lts41-ck-generic')

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
