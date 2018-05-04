# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Use tentative patches from https://groups.google.com/forum/#!forum/bfq-iosched
### Thx to Tom 'monotykamary' Nguyen
_use_tentative_patches=

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

### Running with a 1000 HZ tick rate 
_1k_HZ_ticks=y

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

### Enable MQ scheduling 
_mq_enable=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-rt-bfq
# pkgname=('linux-rt-bfq' 'linux-rt-bfq-headers' 'linux-rt-bfq-docs')
_major=4.16
_srcname=linux-${_major}
_minor=7
_rtver=1
pkgver=${_major}.${_minor}.${_rtver}
_pkgver=${_major}.${_minor}
_rtpatchver=rt${_rtver}
pkgrel=1
arch=('x86_64')
url="https://github.com/Algodev-github/bfq-mq/"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'inetutils' 'bc' 'libelf')
_bfq_sq_mq_ver='20180412'
_bfq_sq_mq_patch="${_major}-bfq-sq-mq-git-${_bfq_sq_mq_ver}.patch"
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_gcc_name="kernel_gcc_patch"
_gcc_rel='20180310'
_gcc_path="https://github.com/graysky2/kernel_gcc_patch/archive"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${_pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${_pkgver}.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        "${_lucjanpath}/${_bfq_sq_mq_patch}"
        "${_lucjanpath}/0100-Check-presence-on-tree-of-every-entity-after-every-a.patch"
        "${_gcc_name}-${_gcc_rel}.tar.gz::${_gcc_path}/${_gcc_rel}.tar.gz"
        'fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch'
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
        '0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch'
        '0003-Partially-revert-swiotlb-remove-various-exports.patch')
        
_kernelname=${pkgbase#linux}
: ${_kernelname:=-rt-bfq}

prepare() {
    cd ${_srcname}

    ### Add upstream patch
        msg "Add upstream patch"
        patch -p1 -i ../patch-${_pkgver}
    
    ### Add rt patch
        msg "Add rt patch"
        patch -Np1 -i ../patch-${_pkgver}-${_rtpatchver}.patch
    
    ### Disable USER_NS for non-root users by default
        msg "Disable USER_NS for non-root users by default"
        patch -Np1 -i ../0001-add-sysctl-to-disallow-unprivileged-CLONE_NEWUSER-by.patch
    
    ### Fix https://bugs.archlinux.org/task/56711
        msg "Fix #56711"
        patch -Np1 -i ../0002-drm-i915-edp-Only-use-the-alternate-fixed-mode-if-it.patch    
    
    ### NVIDIA driver compat
        msg "NVIDIA driver compat"
        patch -Np1 -i ../0003-Partially-revert-swiotlb-remove-various-exports.patch
    
    ### A patch to fix a problem that ought to be fixed in the NVIDIA source code.
    # Stops X from hanging on certain NVIDIA cards
        msg "Fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT.patch"
        patch -p1 -i ../fix-race-in-PRT-wait-for-completion-simple-wait-code_Nvidia-RT-160319.patch
            
    ### Patch source with BFQ-SQ-MQ
        _ver="$(cat Makefile | grep -m1 -e SUBLEVEL | grep -o "[[:digit:]]*")"
        msg "Fix naming schema in BFQ-SQ-MQ patch"
        sed -i -e "s|SUBLEVEL = 0|SUBLEVEL = ${_ver}|g" \
            -i -e "s|EXTRAVERSION = -bfq|EXTRAVERSION =|g" \
            -i -e "s|EXTRAVERSION =-mq|EXTRAVERSION =|g" ../${_bfq_sq_mq_patch}
        msg "Patching source with BFQ-SQ-MQ patches"
        patch -Np1 -i ../${_bfq_sq_mq_patch}
        
    ### Patches related to BUG_ON(entity->tree && entity->tree != &st->active) in __bfq_requeue_entity();
        if [ -n "$_use_tentative_patches" ]; then
        msg "Apply tentative patches"
        for p in "${srcdir}"/0100*.patch*; do 
        msg " $p"
        patch -Np1 -i "$p"; done
        fi
    
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
			-i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' .config
	fi
	
    ### Enable MQ scheduling
        if [ -n "$_mq_enable" ]; then
            msg "Enable MQ scheduling..."
            sed -i -e s'/^# CONFIG_SCSI_MQ_DEFAULT is not set/CONFIG_SCSI_MQ_DEFAULT=y/' \
                -i -e s'/^# CONFIG_DM_MQ_DEFAULT is not set/CONFIG_DM_MQ_DEFAULT=y/' ./.config
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

	### Set extraversion to pkgrel
	sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

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
    pkgdesc='Linux Kernel and modules with the RT patch and the  BFQ scheduler.'
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
    pkgdesc='Header files and scripts to build modules for linux-rt-bfq.'
    depends=('linux-rt-bfq')

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
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the linux-rt-bfq kernel"
    depends=('linux-rt-bfq')
  
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
            '576c2b520d444e11a9ca45ed3ed03822007ab6ff778a1759aa0f65c96946fe3e169e71d48d11e6d3b8627a99cdc20abfb0c84d7b6c9b0d2afa4d5fee9ed3aa41'
            'SKIP'
            '5b3625ebb4eccce4e45a3925640a0b0cb91af07ae3d1fe879709c107aa1633bc89bfe7895f650a83cc75c109f11cfa3ee986f6ecfdb3af0b718509154a5ec027'
            'SKIP'
            '5b860dd67312af2327b9c6abc62d08e285cb81b5e64207f879178dac673cfe67249321ab9bf61e07e6fb855b0d7388061e8bbd4cead0e078886b91beb38599c9'
            '0f96fa9ad784709973b32eea82075ceb3e9dc2482df6441a4607612806f069254e63508b1b562279622394e4a1fbebef1b87af8401c0b1210d5d0de9954245c8'
            '079e34ec7bf3ef36438c648116e24c51e00ea8608a1d8b5776164478522d6a96dcab5fe0431e8e9a6282c11a1edd177e1b68fc971a81717b297e199efc101963'
            '86f717f596c613db3bc40624fd956ed379b8a2a20d1d99e076ae9061251fe9afba39cf536623eccd970258e124b8c2c05643e3d539f37bd910e02dc5dd498749'
            '5bcfcdbc1d1074bc7a1a8c0b01cc79696999d128bf8cda700c8a71b5324fd89e496974a57f632604018fc88054e1961b37c63741eb29529bb7916f8cc5363d48'
            '7ad5be75ee422dda3b80edd2eb614d8a9181e2c8228cd68b3881e2fb95953bf2dea6cbe7900ce1013c9de89b2802574b7b24869fc5d7a95d3cc3112c4d27063a'
            '4a8b324aee4cccf3a512ad04ce1a272d14e5b05c8de90feb82075f55ea3845948d817e1b0c6f298f5816834ddd3e5ce0a0e2619866289f3c1ab8fd2f35f04f44'
            '6346b66f54652256571ef65da8e46db49a95ac5978ecd57a507c6b2a28aee70bb3ff87045ac493f54257c9965da1046a28b72cb5abb0087204d257f14b91fd74'
            '2dc6b0ba8f7dbf19d2446c5c5f1823587de89f4e28e9595937dd51a87755099656f2acec50e3e2546ea633ad1bfd1c722e0c2b91eef1d609103d8abdc0a7cbaf'
            '3c4b172d3a67897757706ecb4f98f8ded83223379332812ef633b3185e7b686509f40b1cae237f23bfc59a6e3cbcb8b8ebd68d1ba02549d525b97c63376cce6a'
            '213c4223a25ea444857a9a289a454abd91d26b3da349b70d1ec9ccd2443cb2223815819e48c9efd3685c38df1445df532cf149af7d9326dc635ccd32ad135ecc'
            'cb69ad1a79df45f1c2af8bacb58fb760651bd92154cf1fc495d4032a88e575e2eb4f2fc3a299ca000e87c51338c67cfcf2933a346d23130c215cd404524304dc')
            
validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
