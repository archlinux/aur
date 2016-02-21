# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS

_localmodcfg=     # Optionally load needed modules for the make localmodconfigs

### Do no edit below this line unless you know what you're doing    

pkgbase=linux-r500v
_srcname=linux-4.4
_patchver=4.5-rc5
pkgver=4.5rc5
pkgrel=1
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=('xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')
_bfqver=v7r11
source=("https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/testing/patch-${_patchver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/testing/patch-${_patchver}.sign"
        ### Configs
        'config.x86_64' 'linux-r500v.preset'
        ### Arch patches
        '0001-change-default-console-loglevel.patch'
        ### BFQ scheduler patches
        "0001-block-cgroups-kconfig-build-bits-for-BFQ-${_bfqver}-4.4.0.patch"
        "0002-block-introduce-the-BFQ-${_bfqver}-I-O-sched-for-4.4.0.patch"
        "0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-${_bfqver}-for.patch"
        ### GCC CPU patch
        '0001-enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch'
        ### mute
        '0001-mute_efi-bgrt.patch'
        '0002-mute_intel_fifo_underrun.patch'
        '0003-mute_osl.patch'
        '0004-mute_lpc_ich.patch'
        '0005-mute_intel_rapl.patch')

sha256sums=('401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2'
            'SKIP'
            '2625ae21341a70c4208a380cbfac96602b44c59ec8ab6eef7e4a5a0e97528f05'
            'SKIP'
            '3ee8df86bc3e6b4adf108c56735c1d6d733cd536fb6a992861d2e5decf6b3d66'
            'f0d90e756f14533ee67afda280500511a62465b4f76adcc5effa95a40045179c'
            '1256b241cd477b265a3c2d64bdc19ffe3c9bbcee82ea3994c590c2c76e767d99'
            'd1cf14cc696b0f716454fe8eb9746383700889d5d22ad829611f0433cc77b4ce'
            'b17c3fb18c5b8c20a45a38198f293679ca6aef08d16f12cd816a5cfafac4b2c4'
            '69a21bc286a628128cfc4723558829cb6ff6c2d7c4dfd4468457898674187b25'
            'f479a5ca6abe4d50ca4c09e6e83a027369fcd3efff8d5ce60f0699d8fa47beb8'
            'bc68e258da00da168d5216be278294425cd7a808a8f03e6e91e615db5e71211e'
            'c9a44f7b3cbeea3cd373ba24c515a22fc95e392dc24a98d914127edea6fc8c18'
            'dda83ac32c2c4f338890191b87f8bb330182af83c6f28c0c3e96a3d13e85247d'
            '1b4dbb6af30bf800cb488ccfbe55deb3073c028223e2b06f5a8399556b5b73ec'
            '4b438d6053f4678a00d2a8640804ba6b16628596b16efff367b050e17844414d')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
             )

_kernelname=${pkgbase#linux}

pkgver(){
    echo "${_patchver/-/}"
}

prepare() {
    cd "${srcdir}/${_srcname}"
    
    msg "Patching source with upstream patches"
    patch -p1 -i "${srcdir}/patch-${_patchver}"
    
    # set DEFAULT_CONSOLE_LOGLEVEL to 4 (same value as the 'quiet' kernel param)
    # remove this when a Kconfig knob is made available by upstream
    # (relevant patch sent upstream: https://lkml.org/lkml/2011/7/26/227)
    patch -p1 -i "${srcdir}/0001-change-default-console-loglevel.patch"
    
    msg "Patching source with BFQ patches"
    for p in $(ls ${srcdir}/000{1,2,3}-block*.patch); do
        patch -Np1 -i "$p"
    done
    
    msg "Patching source with mute patches"
    for p in $(ls ${srcdir}/000{1,2,3,4,5}-mute*.patch); do
        patch -Np1 -i "$p"
    done
    
    # Patch source to enable more gcc CPU optimizatons via the make nconfig
    # https://github.com/graysky2/kernel_gcc_patch
    msg "Patching source with gcc patch to enable more cpus types"
    patch -Np1 -i "${srcdir}/0001-enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"
    
    # Clean tree and copy ARCH config over
    msg "Running make mrproper to clean source tree"
    make mrproper
        
    cat "${srcdir}/config.x86_64" > ./.config
    
    if [ "${_kernelname}" != "" ]; then
        sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
        sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
    fi
    
    # Setting BFQ as default I/O scheduler
    # http://algo.ing.unimo.it/people/paolo/disk_sched/sources.php
    msg "Setting BFQ as default I/O scheduler"
    sed -i -e '/CONFIG_DEFAULT_IOSCHED/ s,cfq,bfq,' \
        -i -e s'/CONFIG_DEFAULT_CFQ=y/# CONFIG_DEFAULT_CFQ is not set\nCONFIG_DEFAULT_BFQ=y/' \
        -i -e s'/CONFIG_CFQ_GROUP_IOSCHED=y/CONFIG_CFQ_GROUP_IOSCHED=y\nCONFIG_IOSCHED_BFQ=y\nCONFIG_BFQ_GROUP_IOSCHED=y/' ./.config
        
    # Disabling NUMA since >99% of users have mono-socket systems.
    # For more, see: https://bugs.archlinux.org/task/31187
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
    
    # Enabling asus_wireless module for ASUS ACPI ATK4001 ATK4002 devices
    msg "Enabling asus_wireless module for ASUS ACPI ATK4001 ATK4002 devices"
    sed -i -e s'/CONFIG_EEEPC_WMI=m/CONFIG_EEEPC_WMI=m\nCONFIG_ASUS_WIRELESS=m/' ./.config
    
    # Disabling CONFIG_X86_PTDUMP_CORE and CONFIG_DEBUG_WX
    # https://bugs.archlinux.org/task/47849
    msg "Disabling CONFIG_X86_PTDUMP_CORE and CONFIG_DEBUG_WX"
    sed -i -e s'/CONFIG_X86_PTDUMP_CORE=y/# CONFIG_X86_PTDUMP_CORE is not set/' \
        -i -e s'/CONFIG_DEBUG_WX=y/# CONFIG_DEBUG_WX is not set/' ./.config
        
    # Enabling XZ kernel compression
    # XZ uses the LZMA2 algorithm and instruction set specific BCJ filters which can improve compression ratio of executable code. 
    # The size of the kernel is about 30% smaller with XZ in comparison to gzip. 
    # On architectures for which there is a BCJ filter (i386, x86_64, ARM, IA-64, PowerPC, and SPARC), XZ will create a few percent smaller kernel than plain LZMA. 
    # The speed is about the same as with LZMA: The decompression speed of XZ is better than that of bzip2 but worse than gzip and LZO. Compression is slow.
    msg "Enabling XZ kernel compression"
    sed -i -e s'/CONFIG_KERNEL_GZIP=y/# CONFIG_KERNEL_GZIP is not set/' \
        -i -e s'/# CONFIG_KERNEL_XZ is not set/CONFIG_KERNEL_XZ=y /' ./.config

    msg "Enabling XZ modules compression"
    sed -i -e s'/CONFIG_MODULE_COMPRESS_GZIP=y/# CONFIG_MODULE_COMPRESS_GZIP is not set/' \
        -i -e s'/# CONFIG_MODULE_COMPRESS_XZ/CONFIG_MODULE_COMPRESS_XZ=y /' ./.config

    # set extraversion to pkgrel
    sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile
    
    # don't run depmod on 'make install'. We'll do this ourselves in packaging
    sed -i '2iexit 0' scripts/depmod.sh
    
    # get kernel version
    msg "Running make prepare for you to enable patched options of your choosing"
    make prepare
    
    # Optionally load needed modules for the make localmodconfig
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
        msg "If you have modprobed-db installed, running it in recall mode now"
        if [ -e /usr/bin/modprobed-db ]; then
            [[ ! -x /usr/bin/sudo ]] && echo "Cannot call modprobe with sudo. Install via pacman -S sudo and configure to work with this user." && exit 1
            sudo /usr/bin/modprobed-db recall
        fi
        msg "Running Steven Rostedt's make localmodconfig now"
        make localmodconfig
    fi
    
    # load configuration
    # Configure the kernel. Replace the line below with one of your choice.
    #make menuconfig # CLI menu for configuration
    #make nconfig # new CLI menu for configuration
    #make xconfig # X-based configuration
    #make oldconfig # using old config from previous kernel version
    #make olddefconfig # same as silentoldconfig but sets new symbols to their default value
    # ... or manually edit .config
    
    # rewrite configuration
    yes "" | make config >/dev/null
    
    # create copy of current config
    cat .config > "${startdir}/config.x86_64.last"
}

build() {
    cd "${srcdir}/${_srcname}"
    make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
    pkgdesc="The ${pkgbase/linux/Linux} kernel and modules"
    [ "${pkgbase}" = "linux" ] && groups=('base')
    depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7' 'xz')
    optdepends=('crda: to set the correct wireless channels of your country' 'nvidia-r500v: nVidia drivers for linux-r500v' 'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    backup=("etc/mkinitcpio.d/${pkgbase}.preset")
    install=linux-r500v.install

    cd "${srcdir}/${_srcname}"

    KARCH=x86

    # get kernel version
    _kernver="$(make LOCALVERSION= kernelrelease)"
    _basekernel=${_kernver%%-*}
    _basekernel=${_basekernel%.*}

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

    # set correct depmod command for install
    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed -e "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
        -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
        -i "${startdir}/${install}"

    # install mkinitcpio preset file for kernel
    install -Dm644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
    sed -e "1s|'linux.*'|'${pkgbase}'|" \
        -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
        -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
        -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
        -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

    # remove build and source links
    rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
    # remove the firmware
    rm -rf "${pkgdir}/lib/firmware"
    # make room for external modules
    ln -s "../extramodules-${_basekernel}${_kernelname:r500v}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    # add real version for building modules and running depmod from post_install/upgrade
    mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:r500v}"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:r500v}/version"

    # Now we call depmod...
    depmod -b "${pkgdir}" -F System.map "${_kernver}"

    # move module tree /lib -> /usr/lib
    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    # add vmlinux
    install -Dm644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux" 
}

_package-headers() {
    pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"

    install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

    cd "${srcdir}/${_srcname}"
    install -Dm644 Makefile         "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
    install -Dm644 kernel/Makefile  "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
    install -Dm644 .config          "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

    for i in acpi asm-generic config crypto drm generated keys linux math-emu media net pcmcia scsi sound trace uapi video xen; do
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
    cp arch/${KARCH}/Makefile               "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
    cp arch/${KARCH}/kernel/asm-offsets.s   "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

    # add docbook makefile
    install -Dm644 Documentation/DocBook/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

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

    # r500v: remove Documentation Kconfigs.
    rm -rf "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation"
}

_package-docs() {
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel"

    cd "${srcdir}/${_srcname}"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build"
    cp -al Documentation "${pkgdir}/usr/lib/modules/${_kernver}/build"
    find "${pkgdir}" -type f -exec chmod 444 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    # remove a file already in linux package
    rm -f "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"
}

    pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-docs")
    for _p in ${pkgname[@]}; do
        eval "package_${_p}() {
            $(declare -f "_package${_p#${pkgbase}}")
            _package${_p#${pkgbase}}
        }"
    done
