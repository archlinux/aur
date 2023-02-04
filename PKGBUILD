# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
: "${_makenconfig:=""}"

# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
: "${_localmodcfg:=""}"

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10)
#  4. AMD Barcelona (MBARCELONA)
#  5. AMD Bobcat (MBOBCAT)
#  6. AMD Jaguar (MJAGUAR)
#  7. AMD Bulldozer (MBULLDOZER)
#  8. AMD Piledriver (MPILEDRIVER)
#  9. AMD Steamroller (MSTEAMROLLER)
#  10. AMD Excavator (MEXCAVATOR)
#  11. AMD Zen (MZEN)
#  12. AMD Zen 2 (MZEN2)
#  13. AMD Zen 3 (MZEN3)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM)
#  18. Intel Westmere (MWESTMERE)
#  19. Intel Silvermont (MSILVERMONT)
#  20. Intel Goldmont (MGOLDMONT)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS)
#  22. Intel Sandy Bridge (MSANDYBRIDGE)
#  23. Intel Ivy Bridge (MIVYBRIDGE)
#  24. Intel Haswell (MHASWELL)
#  25. Intel Broadwell (MBROADWELL)
#  26. Intel Skylake (MSKYLAKE)
#  27. Intel Skylake X (MSKYLAKEX)
#  28. Intel Cannon Lake (MCANNONLAKE)
#  29. Intel Ice Lake (MICELAKE)
#  30. Intel Cascade Lake (MCASCADELAKE)
#  31. Intel Cooper Lake (MCOOPERLAKE)
#  32. Intel Tiger Lake (MTIGERLAKE)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS)
#  34. Intel Rocket Lake (MROCKETLAKE)
#  35. Intel Alder Lake (MALDERLAKE)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2)
#  38. Generic-x86-64-v3 (GENERIC_CPU3)
#  39. Generic-x86-64-v4 (GENERIC_CPU4)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD)
: "${_subarch:=""}"

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
: "${_use_current:=""}"

# Enable compiling with LLVM
: "${_use_llvm_lto:=""}"

# Enable/Disable debug options
# Set 'y' to enable, 'n' to force disable debug options if already enabled in your
# .config file or leave empty to ignore debug options.
: "${_debug:=""}"

### IMPORTANT: Do no edit below this line unless you know what you're doing

_major=6.1
_minor=9
_srcname=linux-${_major}
_clr=${_major}.9-1255
_gcc_more_v='20220315'
_xanmod='4ba17e3181e82204446e7e3e1bec927028043558'
pkgbase=linux-clear-cjktty
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Clear Linux'
arch=('x86_64')
url="https://github.com/clearlinux-pkgs/linux"
license=('GPL2')
makedepends=('bc' 'cpio' 'git' 'libelf' 'pahole' 'xmlto')
if [ -n "$_use_llvm_lto" ]; then
  makedepends+=(clang llvm lld python)
fi
options=('!strip')
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_major}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_major}.tar.sign"
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.xz"
  "$pkgbase::git+https://github.com/clearlinux-pkgs/linux.git#tag=${_clr}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-pci-Enable-overrides-for-missing-ACS-capabilities-${_xanmod}.patch::https://raw.githubusercontent.com/xanmod/linux-patches/${_xanmod}/linux-6.1.y-xanmod/pci_acso/0001-pci-Enable-overrides-for-missing-ACS-capabilities.patch"
  "0001-sysctl-add-sysctl-to-disallow-unprivileged-CLONE_NEW-${_xanmod}.patch::https://raw.githubusercontent.com/xanmod/linux-patches/${_xanmod}/linux-6.1.y-xanmod/userns/0001-sysctl-add-sysctl-to-disallow-unprivileged-CLONE_NEW.patch"
  "0001-CJKTTY.patch::https://raw.githubusercontent.com/zhmars/cjktty-patches/master/v6.x/cjktty-${_major}.patch"
)

if [ -n "$_use_llvm_lto" ]; then
  BUILD_FLAGS=(
    LLVM=1
    LLVM_IAS=1
  )
fi

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd ${_srcname}

    ### Add upstream patches
    echo "Add upstream patches"
    patch -Np1 -i ../patch-${pkgver}

    ### Setting version
    echo "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Add Clearlinux patches
    for i in $(grep '^Patch' ${srcdir}/$pkgbase/linux.spec |\
     grep -Ev '^Patch0132|^Patch0118|^Patch0402|^Patch0113' | sed -n 's/.*: //p'); do
        echo "Applying patch ${i}..."
        patch -Np1 -i "$srcdir/$pkgbase/${i}"
    done

    local src
        for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done

    ### Setting config
    echo "Setting config..."
    cp -Tf $srcdir/$pkgbase/config ./.config

    ### Enable extra options
    echo "Enable extra options..."

    # General setup
    scripts/config --set-str DEFAULT_HOSTNAME archlinux \
                   --enable IKCONFIG \
                   --enable IKCONFIG_PROC \
                   --undefine RT_GROUP_SCHED

    # Power management and ACPI options
    scripts/config --enable ACPI_REV_OVERRIDE_POSSIBLE \
                   --enable ACPI_TABLE_UPGRADE

    # General architecture-dependent options
    scripts/config --enable KPROBES

    # Enable loadable module support
    scripts/config --undefine MODULE_SIG_FORCE \
                   --enable MODULE_COMPRESS_ZSTD

    # Networking support
    scripts/config --enable NETFILTER_INGRESS

    # Device Drivers
    scripts/config --enable FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                   --enable DELL_SMBIOS_SMM \
                   --module PATA_JMICRON \
                   --enable-after SOUND SOUND_OSS_CORE \
                   --enable SND_OSSEMUL \
                   --module-after SND_OSSEMUL SND_MIXER_OSS \
                   --module-after SND_MIXER_OSS SND_PCM_OSS \
                   --enable-after SND_PCM_OSS SND_PCM_OSS_PLUGINS \
                   --module AGP --module-after AGP AGP_INTEL --module-after AGP_INTEL AGP_VIA

    # Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
    scripts/config --enable SECTION_MISMATCH_WARN_ONLY

    # File systems
    scripts/config --module NTFS3_FS \
                   --enable NTFS3_LZX_XPRESS \
                   --enable NTFS3_FS_POSIX_ACL

    scripts/config --module SMB_SERVER \
                   --enable SMB_SERVER_SMBDIRECT \
                   --enable SMB_SERVER_CHECK_CAP_NET_ADMIN \
                   --enable SMB_SERVER_KERBEROS5

    # Security options
    scripts/config --enable SECURITY_SELINUX \
                   --enable SECURITY_SELINUX_BOOTPARAM \
                   --enable SECURITY_SMACK \
                   --enable SECURITY_SMACK_BRINGUP \
                   --enable SECURITY_SMACK_NETFILTER \
                   --enable SECURITY_SMACK_APPEND_SIGNALS \
                   --enable SECURITY_TOMOYO \
                   --enable SECURITY_APPARMOR \
                   --enable SECURITY_YAMA

    # Library routines
    scripts/config --enable FONT_TER16x32

    if [ -n "$_use_llvm_lto" ]; then
        scripts/config --disable LTO_NONE \
                       --enable LTO \
                       --enable LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG \
                       --enable ARCH_SUPPORTS_LTO_CLANG_THIN \
                       --enable HAS_LTO_CLANG \
                       --enable LTO_CLANG_THIN \
                       --enable HAVE_GCC_PLUGINS
    fi

    if [ "$_debug" == "y" ]; then
        scripts/config --enable DEBUG_INFO \
                       --enable DEBUG_INFO_BTF \
                       --enable DEBUG_INFO_DWARF4 \
                       --enable PAHOLE_HAS_SPLIT_BTF \
                       --enable DEBUG_INFO_BTF_MODULES
    elif [ "$_debug" == "n" ]; then
        scripts/config --disable DEBUG_INFO \
                       --disable DEBUG_INFO_BTF \
                       --disable DEBUG_INFO_DWARF4 \
                       --disable PAHOLE_HAS_SPLIT_BTF \
                       --disable DEBUG_INFO_BTF_MODULES
    fi

    make ${BUILD_FLAGS[*]} olddefconfig
    diff -u $srcdir/$pkgbase/config .config || :

    # https://github.com/graysky2/kernel_compiler_patch
    # make sure to apply after olddefconfig to allow the next section
    echo "Patching to enable GCC optimization for other uarchs..."
    patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.17+.patch"

    if [ -n "$_subarch" ]; then
        # user wants a subarch so apply choice defined above interactively via 'yes'
        yes "$_subarch" | make ${BUILD_FLAGS[*]} oldconfig
    else
        # no subarch defined so allow user to pick one
        make ${BUILD_FLAGS[*]} oldconfig
    fi

    ### Optionally use running kernel's config
    # code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
    if [ -n "$_use_current" ]; then
        if [[ -s /proc/config.gz ]]; then
            echo "Extracting config from /proc/config.gz..."
            # modprobe configs
            zcat /proc/config.gz > ./.config
        else
            warning "Your kernel was not compiled with IKCONFIG_PROC!"
            warning "You cannot read the current config!"
            warning "Aborting!"
            exit
        fi
    fi

    ### Optionally load needed modules for the make localmodconfig
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "$_localmodcfg" ]; then
        if [ -e $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make ${BUILD_FLAGS[*]} LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi

    make ${BUILD_FLAGS[*]} -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make ${BUILD_FLAGS[*]} nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
    cd ${_srcname}
    make ${BUILD_FLAGS[*]} all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('wireless-regdb: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
    install=linux.install

    cd $_srcname

    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    echo "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    echo "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install  # Suppress depmod

    # remove build and source links
    rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=(pahole)

    cd ${_srcname}
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # required when STACK_VALIDATION is enabled
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # required when DEBUG_INFO_BTF_MODULES is enabled
    if [ -f tools/bpf/resolve_btfids/resolve_btfids ]; then
        install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
    fi

    echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/x86" -a arch/x86/include
    install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

    # https://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # https://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

    # https://bugs.archlinux.org/task/71392
    install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

    echo "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

    echo "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        echo "Removing $(basename "$arch")"
        rm -r "$arch"
    done

    echo "Removing documentation..."
    rm -r "$builddir/Documentation"

    echo "Removing broken symlinks..."
    find -L "$builddir" -type l -printf 'Removing %P\n' -delete

    echo "Removing loose objects..."
    find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

    echo "Stripping build tools..."
    local file
    while read -rd '' file; do
        case "$(file -Sib "$file")" in
            application/x-sharedlib\;*)      # Libraries (.so)
                strip -v $STRIP_SHARED "$file" ;;
            application/x-archive\;*)        # Libraries (.a)
                strip -v $STRIP_STATIC "$file" ;;
            application/x-executable\;*)     # Binaries
                strip -v $STRIP_BINARIES "$file" ;;
            application/x-pie-executable\;*) # Relocatable binaries
                strip -v $STRIP_SHARED "$file" ;;
        esac
    done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

    echo "Stripping vmlinux..."
    strip -v $STRIP_STATIC "$builddir/vmlinux"

    echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha256sums=('2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb'
            'SKIP'
            '64e27f1de56225372d29ff92dc2d8fca6ae961e7470f2364e98c5af0aef261dc'
            'SKIP'
            '5a29d172d442a3f31a402d7d306aaa292b0b5ea29139d05080a55e2425f48c5c'
            '821136df8fffcb4ae612cdf88af57e294490c0552c55163f8b0f7485b0a035a1'
            'b26bfbdb0981ffb387c06f4f18fc5a15cf5c590f011dea197e1fe9e27b60a422'
            'SKIP')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)