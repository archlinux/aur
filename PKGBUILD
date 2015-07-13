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

### PATCH AND BUILD OPTIONS
# Set these variables to ANYTHING that is not null (y or hello or 2 or "I like icecream") to enable them
#
_makenconfig=   # Tweak kernel options prior to a build via nconfig
_localmodcfg=   # Compile ONLY probed modules
_use_current=   # Use the current kernel's .config file
_BFQ_enable_=  # Enable BFQ as the default I/O scheduler
_NUMAdisable=y  # Disable NUMA in kernel config

### DOCS
# This package has shipped with GCC optimisations since the 3.6.9-3 release, currently with enable_additional_cpu_optimizations_for_gcc.patch.
# This allows users an expanded scope of CPU specific options.
# Consult the following resources to understand which option is right for you application:
#
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/Intel
# http://en.gentoo-wiki.com/wiki/Safe_Cflags/AMD
# http://www.linuxforge.net/docs/linux/linux-gcc.php
# http://gcc.gnu.org/onlinedocs/gcc/i386-and-x86_002d64-Options.html

# DETAILS FOR _localmodcfg=
# As of mainline 2.6.32, running with this option will only build the modules that you currently have
# probed in your system VASTLY reducing the number of modules built and the build time to do it.
#
# WARNING - make CERTAIN that all modules are modprobed BEFORE you begin making the pkg!
#
# To keep track of which modules are needed for your specific system/hardware, give my module_db script
# a try: https://aur.archlinux.org/packages/modprobed-db/  Note that if you use my script, this PKGBUILD
# will auto run the 'sudo modprobed_db reload' for you to probe all the modules you have logged!
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed_db

# DETAILS FOR _use_current=
# Enabling this option will use the .config of the RUNNING kernel rather than the ARCH defaults.
# Useful when the package gets updated and you already went through the trouble of customizing your
# config options.  NOT recommended when a new kernel is released, but again, convenient for package bumps.

# DETAILS FOR _BFQ_enable=
# Alternative I/O scheduler by Paolo.  For more, see: http://algo.ing.unimo.it/people/paolo/disk_sched/

# DETAILS FOR _NUMAdisable=
# Since >99 % of users do not have multiple CPUs but do have multiple cores in one CPU.
# see, https://bugs.archlinux.org/task/31187

pkgname=linux-lts310-ck
true && pkgname=(linux-lts310-ck linux-lts310-ck-headers)
_kernelname=-lts310-ck
_srcname=linux-3.10
pkgver=3.10.84
pkgrel=1
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/Linux-ck"
license=('GPL2')
makedepends=('kmod' 'inetutils' 'bc')
options=('!strip')
_ckpatchversion=1
_ckpatchname="patch-3.10-ck${_ckpatchversion}"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+.patch"
_bfqpath="http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.10.8+-v7r7"

source=("https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/${_srcname}.tar.sign"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.xz"
		"https://www.kernel.org/pub/linux/kernel/v3.x/patch-${pkgver}.sign"
		"http://ck.kolivas.org/patches/3.0/3.10/3.10-ck${_ckpatchversion}/${_ckpatchname}.bz2"
		"http://repo-ck.com/source/gcc_patch/${_gcc_patch}.gz"
		'enable_haswell_pstate_driver.patch'
		'linux-lts310-ck.preset'
		'change-default-console-loglevel.patch'
		'config' 'config.x86_64'
		'criu-no-expert.patch'
		"${_bfqpath}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r7-3.10.8+.patch"
		"${_bfqpath}/0002-block-introduce-the-BFQ-v7r7-I-O-sched-for-3.10.8+.patch"
		"${_bfqpath}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r7-for-3.10.8+.patch"
		"${pkgver}+-ck1.patch"
		"${pkgver}+-ck1.patch.asc")

sha256sums=('df27fa92d27a9c410bfe6c4a89f141638500d7eadcca5cce578954efc2ad3544'
            'SKIP'
            'c9e3b0a56abda12108c25d31061058ef8b3041e6df43c1f4cd1b1e6f506f2452'
            'SKIP'
            '747d893b69d040dd82650a1a2d509155beace337020619194661049920650ed6'
            'c6c4a9f77683b95c37636b20c4bc8a1f8214c87feef7fc469e58534fcc32fb4a'
            'd7fada52453d12a24af9634024c36792697f97ce0bc6552939cd7b2344d00cd9'
            '7424c04897d7cf4e07e167f807a0f7e7ee459f041fe7341675435e315570d1bb'
            '56bd99e54429a25a144f2d221718b67f516344ffd518fd7dcdd752206ec5be69'
            'dc81ec15419d733d6b2bd56c20c67c671c694b82aea949e90c8b4e0b58939786'
            'cf64b0ada5c3d1326a8446e5bfa1f4648cd403570d87c284ef271da1ba3d186f'
            'daa75228a4c45a925cc5dbfeba884aa696a973a26af7695adc198c396474cbd5'
            '7e6a68b324f117ea3134729bd7f10a6064c3315557957fe84e0a41c0c8ea8d61'
            '096a4453295eefa0d8acdeb874ad359d26c4dfef842b4b9ff8449e062d54f843'
            '6ec3d2c03f0425f9d5a13ebbb44e3840baeba8085ca0a08c087b05226c2f49b9'
            'b5f21ea7346ae462c5f28ee53bdb26d0880a772719987f8afb92fe2f7808ea07'
            'SKIP')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linux Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '5F885602C7FD0951F565E27949F67298E6366A92' # Claire Farron
             )

prepare() {
	cd "${srcdir}"

	# patch CK to play nice with 3.10.57+
	msg "Patching CK to be compatible with ${pkgver}"
	patch --follow-symlinks -i "${srcdir}/${pkgver}+-ck1.patch" -o "${srcdir}/patch-${pkgver}+-ck1"

	cd "${_srcname}"

	# add upstream patch
	msg "Patching source to v$pkgver"
	patch -p1 -i "${srcdir}/patch-${pkgver}"

	# set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
	# remove this when a Kconfig knob is made available by upstream
	# (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
	patch -Np1 -i "${srcdir}/change-default-console-loglevel.patch"

	# allow criu without expert option set
	# patch from fedora
	patch -Np1 -i "${srcdir}/criu-no-expert.patch"

	### Patch source with ck patchset with BFS
	# Fix double name in EXTRAVERSION
	sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/patch-${pkgver}+-ck1"
	msg "Patching source with ck1 including BFS v0.440"
	patch -Np1 -i "${srcdir}/patch-${pkgver}+-ck1"
	
	### Patch source to enable more gcc CPU optimizatons via the make nconfig
	msg "Patching source to enable more gcc CPU optimizatons"
	patch -Np1 -i "${srcdir}/${_gcc_patch}"

	msg "Patching source with BFQ patches"
	for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
		msg " $p"
		patch -Np1 -i "$p"
	done

	### Clean tree and copy ARCH config over
	msg "Running make mrproper to clean source tree"
	make mrproper

	if [ "${CARCH}" = "x86_64" ]; then
		cat "${srcdir}/config.x86_64" > ./.config
	else
		cat "${srcdir}/config" > ./.config
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
	
	### BFQ to be compiled in but not enabled
	sed -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/CONFIG_CFQ_GROUP_IOSCHED=y\nCONFIG_IOSCHED_BFQ=y\nCONFIG_CGROUP_BFQIO=y/' \
		-i -e s'/CONFIG_DEFAULT_CFQ=y/CONFIG_DEFAULT_CFQ=y\n# CONFIG_DEFAULT_BFQ is not set/' ./.config

	### Optionally enable BFQ as the default io scheduler
	if [ -n "$_BFQ_enable_" ]; then
		sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
		-i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' ./.config
	fi

	# disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
	# see, https://bugs.archlinux.org/task/31187
	if [ -n "$_NUMAdisable" ]; then
		if [ "${CARCH}" = "x86_64" ]; then
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

	# set extraversion to pkgrel
	sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	# get kernel version
	msg "Running make prepare for you to enable patched options of your choosing"
	make prepare

	### Optionally load needed modules for the make localmodconfig
	# See http://aur.archlinux.org/packages.php?ID=41689
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

  # save configuration for later reuse
#  if [ "${CARCH}" = "x86_64" ]; then
#    cat .config > "${startdir}/config.x86_64.last"
#  else
#    cat .config > "${startdir}/config.last"
#  fi
}

build() {
	cd "${srcdir}/linux-3.10"

	msg "Running make bzImage and modules"
	make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

package_linux-lts310-ck() {
pkgdesc='The linux-lts310 kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.440'
	#_Kpkgdesc='The linux-lts310 kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.440'
	#pkgdesc="${_Kpkgdesc}"
	depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
	optdepends=('crda: to set the correct wireless channels of your country' 'modprobed_db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
	backup=("etc/mkinitcpio.d/linux-lts310-ck.preset")
	install=linux-lts310-ck.install

	cd "${_srcname}"

	KARCH=x86

	# get kernel version
	_kernver="$(make LOCALVERSION= kernelrelease)"
	_basekernel=${_kernver%%-*}
	_basekernel=${_basekernel%.*}

	mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
	make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
	cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts310-ck"

	# set correct depmod command for install
	cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
	true && install=${install}.pkg

	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=-lts310-ck/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
		-i "${startdir}/${install}"

	# install mkinitcpio preset file for kernel
	install -D -m644 "${srcdir}/linux-lts310-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts310-ck.preset"
	sed \
		-e "1s|'linux.*'|'linux-lts310-ck'|" \
		-e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-linux-lts310-ck\"|" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs-linux-lts310-ck.img\"|" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-linux-lts310-ck-fallback.img\"|" \
		-i "${pkgdir}/etc/mkinitcpio.d/linux-lts310-ck.preset"

	# remove build and source links
	rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
	# remove the firmware
	rm -rf "${pkgdir}/lib/firmware"
	# gzip -9 all modules to save 100MB of space
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
	# make room for external modules
	ln -s "../extramodules-${_basekernel}${_kernelname:lts310-ck}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts310-ck}"
	echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:lts310-ck}/version"

	# Now we call depmod...
	depmod -b "${pkgdir}" -F System.map "${_kernver}"

	# move module tree /lib -> /usr/lib
	mkdir -p "${pkgdir}/usr"
	mv "${pkgdir}/lib" "${pkgdir}/usr/"

	# add vmlinux
	install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-lts310-ck-headers() {
	pkgdesc='Header files and scripts to build modules for linux-lts310-ck.'
	#_Hpkgdesc='Header files and scripts to build modules for linux-lts310-ck.'
	#pkgdesc="${_Hpkgdesc}"
	depends=('linux-lts310-ck') # added to keep kernel and headers packages matched
	provides=("linux-lts310-ck-headers=${pkgver}" "linux-headers=${pkgver}")

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

  # add headers for lirc package
  # pci
  for i in bt8xx cx88 saa7134; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
    cp -a drivers/media/pci/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/pci/${i}"
  done
  # usb
  for i in cpia2 em28xx pwc sn9c102; do
    mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
    cp -a drivers/media/usb/${i}/*.h "${pkgdir}/usr/src/linux-${_kernver}/drivers/media/usb/${i}"
  done
  # i2c
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c"
  cp drivers/media/i2c/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  for i in cx25840; do
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
    cp -a drivers/media/i2c/${i}/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/${i}"
  done

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
  [[ -n $(ls include/config/dvb/*.h &>/dev/null) ]] && cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
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
  cp fs/xfs/xfs_sb.h "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs/xfs_sb.h"

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
	rm -rf "${pkgdir}"/usr/src/linux-${_kernver}/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}

# Global pkgdesc and depends are here so that they will be picked up by AUR
pkgdesc='Arch Linux LTS Kernel and modules with the ck1 patchset featuring the Brain Fuck Scheduler v0.440.'
