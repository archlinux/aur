# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

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

### Running with a 1000 HZ tick rate 
_1k_HZ_ticks=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-uksm
# pkgname=('linux-uksm' 'linux-uksm-headers' 'linux-uksm-docs')
_major=4.16
_srcname=linux-${_major}
_minor=13
pkgver=${_major}.${_minor}
pkgrel=1
arch=('x86_64')
url="https://github.com/dolohow/uksm"
license=('GPL2')
options=('!strip')
#makedepends=('kmod' 'inetutils' 'bc' 'libelf')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_uksm_path="https://raw.githubusercontent.com/dolohow/uksm/master"
_uksm_patch="uksm-${_major}.patch"
_gcc_name="kernel_gcc_patch"
_gcc_rel='20180509'
_gcc_path="https://github.com/graysky2/${_gcc_name}/archive"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v8.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign"
        "${_gcc_name}-${_gcc_rel}.tar.gz::${_gcc_path}/${_gcc_rel}.tar.gz"
        "${_uksm_path}/${_uksm_patch}"
        "${_lucjanpath}/0005-objtool-add-gcc8-support.patch"
        "${_lucjanpath}/0006-include-linux-add-gcc8-support.patch"
         # the main kernel config files
        'config'
         # pacman hook for depmod
        '60-linux.hook'
         # pacman hook for initramfs regeneration
        '90-linux.hook'
         # pacman hook for remove initramfs
        '99-linux.hook'
         # standard config files for mkinitcpio ramdisk
        'linux.preset'
        '0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch'
        '0002-ACPI-watchdog-Prefer-iTCO_wdt-on-Lenovo-Z50-70.patch'
        '0003-Revert-drm-i915-edp-Allow-alternate-fixed-mode-for-e.patch')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-uksm} 

prepare() {
    cd ${_srcname}

    ### Add upstream patch
        msg "Add upstream patch"
        patch -p1 -i ../patch-${pkgver}

    ### Disable USER_NS for non-root users by default
        msg "Disable USER_NS for non-root users by default"
        patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
    
    ### Fix https://bugs.archlinux.org/task/56780
        msg "Fix #56780"
        patch -Np1 -i ../0002-ACPI-watchdog-Prefer-iTCO_wdt-on-Lenovo-Z50-70.patch
    
    ### Fix https://bugs.archlinux.org/task/56711
        msg "Fix #56711"
        patch -Np1 -i ../0003-Revert-drm-i915-edp-Allow-alternate-fixed-mode-for-e.patch

    ### Fix gcc8 bogus warnings
        msg "Fix gcc8 bogus warnings"
        patch -Np1 -i ../0005-objtool-add-gcc8-support.patch
        patch -Np1 -i ../0006-include-linux-add-gcc8-support.patch
    
    ### Patch source with UKSM
        msg "Patching source with UKSM"
	patch -Np1 -i ../${_uksm_patch}
    
    ### Patch source to enable more gcc CPU optimizatons via the make nconfig
        msg "Patching source with gcc patch to enable more cpus types"
	patch -Np1 -i ../${_gcc_name}-${_gcc_rel}/${_gcc_patch}
    
    ### Clean tree and copy ARCH config over
	msg "Running make mrproper to clean source tree"
	make mrproper
	
	cat ../config - >.config <<END
CONFIG_LOCALVERSION="${_kernelname}"
CONFIG_LOCALVERSION_AUTO=n
END
        
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

	
	### Optionally set tickrate to 1000 
	if [ -n "$_1k_HZ_ticks" ]; then
		msg "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
                    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
                    -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
	fi
	
	### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
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

	### Set extraversion to pkgrel and empty localversion
        sed -e "/^EXTRAVERSION =/s/=.*/= -${pkgrel}/" \
            -e "/^EXTRAVERSION =/aLOCALVERSION =" \
            -i Makefile

	### Don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	### Get kernel version
	msg "Running make prepare for you to enable patched options of your choosing"
	make prepare

	### Optionally load needed modules for the make localmodconfig
	# See https://aur.archlinux.org/packages/modprobed-db
		if [ -n "$_localmodcfg" ]; then
		msg "If you have modprobe-db installed, running it in recall mode now"
		if [ -e /usr/bin/modprobed-db ]; then
			[[ -x /usr/bin/sudo ]] || {
                        echo "Cannot call modprobe with sudo. Install sudo and configure it to work with this user."
                        exit 1; }
			sudo /usr/bin/modprobed-db recall
		fi
		msg "Running Steven Rostedt's make localmodconfig now"
		make localmodconfig
	fi

	### Running make nconfig
	
	[[ -z "$_makenconfig" ]] ||  make nconfig
	
	### Running make menuconfig
	
	[[ -z "$_makemenuconfig" ]] || make menuconfig
	
	### Running make xconfig
	
	[[ -z "$_makexconfig" ]] || make xconfig
	
	### Running make gconfig
	
	[[ -z "$_makegconfig" ]] || make gconfig
	
	### Rewrite configuration
	yes "" | make config >/dev/null

	### Save configuration for later reuse
	cat .config > "${startdir}/config.last"
}

build() {
  cd ${_srcname}

  make bzImage modules
}

_package() {
    pkgdesc='Linux Kernel and modules with the  UKSM.'
    depends=('coreutils' 'linux-firmware' 'mkinitcpio>=0.7')
    optdepends=('crda: to set the correct wireless channels of your country' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    backup=("etc/mkinitcpio.d/${pkgbase}.preset")
    install=linux.install

    cd ${_srcname}
    
    # get kernel version
    _kernver="$(make kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}"/{boot,usr/lib/modules}
    make INSTALL_MOD_PATH="${pkgdir}/usr" modules_install
    cp arch/x86/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

    # make room for external modules
    local _extramodules="extramodules-${_basekernel}${_kernelname}"
    ln -s "../${_extramodules}" "${pkgdir}/usr/lib/modules/${_kernver}/extramodules"

    # add real version for building modules and running depmod from hook
    echo "${_kernver}" |
        install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules/${_extramodules}/version"

    # remove build and source links
    rm "${pkgdir}"/usr/lib/modules/${_kernver}/{source,build}

    # now we call depmod...
    depmod -b "${pkgdir}/usr" -F System.map "${_kernver}"

    # add vmlinux
    install -Dt "${pkgdir}/usr/lib/modules/${_kernver}/build" -m644 vmlinux

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
    sed "${_subst}" ../linux.preset |
        install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

    # install pacman hooks
    sed "${_subst}" ../60-linux.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
    sed "${_subst}" ../90-linux.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
    sed "${_subst}" ../99-linux.hook |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/99-${pkgbase}.hook"     
}

_package-headers() {
    pkgdesc='Header files and scripts to build modules for linux-uksm'
    depends=('linux-uksm')

    cd ${_srcname}
    local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

    install -Dt "${_builddir}" -m644 Makefile .config Module.symvers
    install -Dt "${_builddir}/kernel" -m644 kernel/Makefile

    mkdir "${_builddir}/.tmp_versions"

    cp -t "${_builddir}" -a include scripts

    install -Dt "${_builddir}/arch/x86" -m644 arch/x86/Makefile
    install -Dt "${_builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    cp -t "${_builddir}/arch/x86" -a arch/x86/include

    install -Dt "${_builddir}/drivers/md" -m644 drivers/md/*.h
    install -Dt "${_builddir}/net/mac80211" -m644 net/mac80211/*.h

    # http://bugs.archlinux.org/task/13146
    install -Dt "${_builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # http://bugs.archlinux.org/task/20402
    install -Dt "${_builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "${_builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "${_builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

    # add xfs and shmem for aufs building
    mkdir -p "${_builddir}"/{fs/xfs,mm}

    # copy in Kconfig files
    find . -name Kconfig\* -exec install -Dm644 {} "${_builddir}/{}" \;

    # add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "${_builddir}/tools/objtool" tools/objtool/objtool

    # remove unneeded architectures
    local _arch
    for _arch in "${_builddir}"/arch/*/; do
        [[ ${_arch} == */x86/ ]] && continue
        rm -r "${_arch}"
    done

    # remove files already in linux-uksml-docs package
    rm -r "${_builddir}/Documentation"
    
    # remove now broken symlinks
    find -L "${_builddir}" -type l -printf 'Removing %P\n' -delete

    # Fix permissions
    chmod -R u=rwX,go=rX "${_builddir}"

    # strip scripts directory
    local _binary _strip
    while read -rd '' _binary; do
        case "$(file -bi "${_binary}")" in
        *application/x-sharedlib*)  _strip="${STRIP_SHARED}"   ;; # Libraries (.so)
        *application/x-archive*)    _strip="${STRIP_STATIC}"   ;; # Libraries (.a)
        *application/x-executable*) _strip="${STRIP_BINARIES}" ;; # Binaries
        *) continue ;;
        esac
        /usr/bin/strip ${_strip} "${_binary}"
    done < <(find "${_builddir}/scripts" -type f -perm -u+w -print0 2>/dev/null)
}

_package-docs() {
    pkgdesc='Kernel hackers manual - HTML documentation that comes with the linux-uksm.'
    depends=('linux-uksm')
  
    cd ${_srcname}
    local _builddir="${pkgdir}/usr/lib/modules/${_kernver}/build"

    mkdir -p "${_builddir}"
    cp -t "${_builddir}" -a Documentation

    # Fix permissions
    chmod -R u=rwX,go=rX "${_builddir}"
}

pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

sha512sums=('ab47849314b177d0eec9dbf261f33972b0d89fb92fb0650130ffa7abc2f36c0fab2d06317dc1683c51a472a9a631573a9b1e7258d6281a2ee189897827f14662'
            'SKIP'
            'f136eadbaff335b5c9cd45a9265b4ce4409c141372bc7af378c5a6bbb50330bf16d75ef29294f2b876961292c4c2606980e3d169b98e5b413d6c1b13f5eed37e'
            'SKIP'
            'a0f37a9b8dbd11f8ef4450b06afee0a6e5519cb5a5cd78f84896812b007ef645bcb9c733ae9817c24d1f4a4c2114258015abceb5a94c7e08d2bb00531a6f04c7'
            'ab962157c2c20faf0bd164a82c2e28ce35fd581d640409ae6419dc2a64c82b7f49e7215149de0bc028dd3d517434160d68127b05137f6b6611641cc871f6c76e'
            'a10a546ecced915ee38075cc6c57eaebb0f8fa58e6af6669d7429ef4880b55bd5782e11dfbda75ce4f805fa5b2399421b4eade8bbbf6766e5aac24a542f1b7a7'
            '9737f30e748e043a1b6ab56bd0df6dc9607b4a2749243e599f5563b157aaf339ad43020a526a11a6fc809cc1abe50ac1cb12188bf5b367f6458fa0dbc2c1824d'
            '0fa428be07dabdce70cf5e1b3e6e344b8f8df362512a1e3b833093de0e4441b5b9bec879e0c2e91aa692cf88c098317e1531bccdebea9d221469111be6d2e9f7'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '6346b66f54652256571ef65da8e46db49a95ac5978ecd57a507c6b2a28aee70bb3ff87045ac493f54257c9965da1046a28b72cb5abb0087204d257f14b91fd74'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '26619b938a47c841f0c480a113cfbb1ee6f1121c21dfecbe246c1f7af7697f86cfb8253f09966eab2e386734ce4ad156159babdba4365c2f199c369c3d7e8ee8'
            'f6aed92697c35e7919a0d784185e7af15b6be2762e3dd235267ca9744a826ac693d0ffcb07b9d1cc8571f57d518c1ce1c276cf7677e8375188f05f71d4added0'
            'cc8852b089aa24f588ad1af726503ecd1012ad7e1cbc47ea77f03a5f7aecd25306d40f2e16b8a1afeafe7e2e97b6b6840c9f462ed7be358090117e2e024df1bd')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )
