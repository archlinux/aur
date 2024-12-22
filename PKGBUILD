#!/usr/bin/env bash
# shellcheck disable=SC2034 disable=SC2048 disable=SC2086 disable=SC2154
# Maintainer: JeremyStarTM <jeremystartm@staropensource.de>
# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: yarost12 <yaro330@gmail.com>

### BUILD OPTIONS
# You can modify these settings by
# executing "env _<setting>=<value> makepkg"
# instead of modifying the PKGBUILD file.
# 
# Here's an example:
# env _makemenuconfig=y _copyfinalconfig=y _subarch=30 makepkg

# Tweak kernel options prior to a build
# via menuconfig.
# 
# Set to anything but null to activate.
: "${_makemenuconfig:=""}"

# Tweak kernel options prior to a build
# via nconfig.
# 
# Set to anything but null to activate.
: "${_makenconfig:=""}"

# Tweak kernel options prior to a build
# via xconfig.
# 
# Set to anything but null to activate.
: "${_makexconfig:=""}"

# Use the current kernel's .config file
# 
# Enabling this option will use the
# .config of the currently running kernel
# rather than the Clear Linux defaults.
# 
# Useful when the package gets updated and
# you already went through the trouble of
# customizing your config options.
# 
# NOT recommended when a new kernel is
# released, but again, convenient for
# package bumps.
#
# Set to anything but null to activate.
: "${_reuse_current:=""}"

# Use the 'kconfig' file placed in the
# directory where this PKGBUILD is in.
# 
# Enabling this option will use the
# .config placed next to the PKGBUILD file.
# 
# Useful when the package gets updated and
# you already went through the trouble of
# customizing your config options.
#
# NOT recommended when a new kernel is
# released, but again, convenient for
# package bumps.
# 
# Set to anything but null to activate.
: "${_reuse_file:=""}"

# Apply selected config changes chosen by
# the package maintainers to the config.
# 
# Only takes effect if '_reuse_current'
# or '_reuse_file' is enabled. Keep
# disabled if you want to reuse your
# existing kernel configuration without
# any changes being applied on top.
#
# Set to anything but null to activate.
: "${_update_kconfig_on_reuse:=""}"

# Determines whether the final kernel
# configuration shall be copied into
# the package source tree (where this
# very PKGBUILD file lives) before
# compilation starts.
# 
# Set to anything but null to activate.
: "${_copyfinalconfig:=""}"

# Only compile active modules to VASTLY
# reduce the number of modules built
# and the build time.
# 
# To keep track of which modules are
# needed for your specific system/hardware,
# give modprobed-db a try:
# https://aur.archlinux.org/packages/modprobed-db
# 
# More at this wiki page:
# https://wiki.archlinux.org/index.php/Modprobed-db
# 
# Set to anything but null to activate.
: "${_localmodcfg:=""}"

# Optionally select a sub architecture
# by number or leave blank, which will
# require user interaction during the build.
# Note that the default option is 41.
# 
# Requires '_update_kconfig_on_reuse_'
# to be enabled if using an existing
# kernel configuration.
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
#  14. AMD Zen 4 (MZEN4)
#  15. AMD Zen 5 (MZEN5)
#  16. Intel P4 / older Netburst based Xeon (MPSC)
#  17. Intel Atom (MATOM)
#  18. Intel Core 2 (MCORE2)
#  19. Intel Nehalem (MNEHALEM)
#  20. Intel Westmere (MWESTMERE)
#  21. Intel Silvermont (MSILVERMONT)
#  22. Intel Goldmont (MGOLDMONT)
#  23. Intel Goldmont Plus (MGOLDMONTPLUS)
#  24. Intel Sandy Bridge (MSANDYBRIDGE)
#  25. Intel Ivy Bridge (MIVYBRIDGE)
#  26. Intel Haswell (MHASWELL)
#  27. Intel Broadwell (MBROADWELL)
#  28. Intel Skylake (MSKYLAKE)
#  29. Intel Skylake X (MSKYLAKEX)
#  30. Intel Cannon Lake (MCANNONLAKE)
#  31. Intel Ice Lake (MICELAKE)
#  32. Intel Cascade Lake (MCASCADELAKE)
#  33. Intel Cooper Lake (MCOOPERLAKE)
#  34. Intel Tiger Lake (MTIGERLAKE)
#  35. Intel Sapphire Rapids (MSAPPHIRERAPIDS)
#  36. Intel Rocket Lake (MROCKETLAKE)
#  37. Intel Alder Lake (MALDERLAKE)
#  38. Intel Raptor Lake (MRAPTORLAKE)
#  39. Intel Meteor Lake (MMETEORLAKE)
#  40. Intel Emerald Rapids (MEMERALDRAPIDS)
#  41. Generic-x86-64 (GENERIC_CPU)
#  42. Intel-Native optimizations autodetected by the compiler (MNATIVE_INTEL)
#  43. AMD-Native optimizations autodetected by the compiler (MNATIVE_AMD)
: "${_subarch:=""}"

# Selects the x86-64 microarchitecture
# to compile for. This value is only
# used by the GENERIC_CPU
# subarchitecture and is required.
# Can be either '1', '2', '3' or '4'
#
# For more information see:
# https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels
# 
# Requires '_update_kconfig_on_reuse_'
# to be enabled if using an existing
# kernel configuration.
# 
# Set to '1' by default
: "${_subarch_microarch:="1"}"

# Enable compilation with LLVM
# 
# Be warned, this is largely untested
# by me (JeremyStarTM). It *should* work,
# but if it doesn't, write a comment
# and I'll write a fix for it.
# 
# Requires '_update_kconfig_on_reuse_'
# to be enabled if using an existing
# kernel configuration.
# 
# Set to anything but null to activate.
: "${_use_llvm_lto:=""}"

# This allows you to enable or disable
# debug options for THE COMPILED KERNEL.
# 
# Leaving the setting empty will leave
# the debug settings up to the kernel
# configuration's settings.
# 
# Requires '_update_kconfig_on_reuse_'
# to be enabled if using an existing
# kernel configuration.
# 
# Set to 'y' to force enable,
# 'n' to force disable or '' to
# ignore debug options.
: "${_debug_kernel:=""}"

# This allows you to enable or disable
# debug options for THIS SCRIPT.
# 
# Set to anything but null to activate.
: "${_debug_script:=""}"

### BUILD OPTIONS END

# Kernel version
_kernel_major=6.12
_kernel_minor=6
# Clear Linux patches version
_clr=4-1518
# kernel_compiler_patch version
_kernelcompilerpatch="20241018"
# Source directory names
_src_linux=linux-${_kernel_major}
_src_clr=${_kernel_major}.${_clr}

# Package information
pkgbase=linux-clear
pkgver=${_kernel_major}.${_kernel_minor}
pkgrel=1
pkgdesc="Linux kernel with patches from Clear Linux which allow for higher performance."
arch=("x86_64")
url="https://git.staropensource.de/JeremyStarTM/aur-linux-clear"
license=(GPL-2.0-only)
makedepends=("bc" "cpio" "gettext" "git" "libelf" "pahole" "perl" "python" "tar" "xz" "zstd")
[[ -n "${_use_llvm_to}" ]] && makedepends+=("clang" "llvm" "lld")
options=("!strip" "!debug")
[[ "${_debug_kernel}" == "y" ]] && options=("!strip")
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel_major}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel_major}.tar.sign"
  "https://cdn.kernel.org/pub/linux/kernel/v6.x/patch-${_kernel_major}.${_kernel_minor}.xz"
  "cl-linux::git+https://github.com/clearlinux-pkgs/linux.git#tag=${_src_clr}"
  "more-uarches-${_kernelcompilerpatch}.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/${_kernelcompilerpatch}.tar.gz"
)

[[ -n "${_use_llvm_lto}" ]] && BUILD_FLAGS=("LLVM=1" "LLVM_IAS=1")

export "KBUILD_BUILD_HOST=archlinux"
export "KBUILD_BUILD_USER=${pkgbase}"
export "KBUILD_BUILD_TIMESTAMP=$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

# Debugging
_msg() {
    echo -e ":: ${*}"
}
_warn() {
    echo -e ":: WARNING: ${*//\\n/\\n            }"
}
_error() {
    echo -e ":: ERROR: ${*//\\n/\\n          }"
}
_debug_msg() {
    [ -n "${_debug_script}" ] && echo ":: debug: ${*}"
}
_debug_call() {
    local function="${1}"
    shift
    local args="${*}"
    
    _debug_msg "call: ${function}(${args})"
}

# Applies all patches
_apply_patches() {
    _debug_call "_apply_patches"
    
    # Patch with kernel version patches
    patch -Np1 -i ../patch-${_kernel_major}.${_kernel_minor} || :
    
    # Set version
    echo "-${pkgrel}" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname
    
    # Patch with Clear Linux patches
    for i in $(grep '^Patch' "${srcdir}"/cl-linux/linux.spec|grep -Ev '^Patch0132|^Patch0109|^Patch0118|^Patch0113|^Patch0138|^Patch0139|^Patch0147' | sed -n 's/.*: //p'); do
        if [ -n "${_use_llvm_lto}" ]; then
            if [ "${i}" == "0133-novector.patch" ] ; then
                continue
            fi
        fi
        
        patch -Np1 -i "${srcdir}/cl-linux/${i}" || :
    done

    # Patch with kernel_compiler_patch patches.
    # Do this before any defconfig invocations so we
    # have all of the extra selectable uarches ready and selectable
    patch -Np1 -i "$srcdir/kernel_compiler_patch-$_kernelcompilerpatch/more-ISA-levels-and-uarches-for-kernel-6.1.79+.patch"
}

# Updates the kernel config
_update_config() {
    _debug_call "_update_config"
    
    # Extra configuration
    _debug_msg "Updating configuration"
    # -> General setup
    scripts/config --set-str DEFAULT_HOSTNAME archlinux \
                -e IKCONFIG \
                -e IKCONFIG_PROC \
                -u RT_GROUP_SCHED
    # -> Power management and ACPI options
    scripts/config -e ACPI_REV_OVERRIDE_POSSIBLE \
                -e ACPI_TABLE_UPGRADE
    # -> Virtualization
    scripts/config -e KVM_SMM
    # -> General architecture-dependent options
    scripts/config -e KPROBES
    # -> Enable loadable module support
    scripts/config -u MODULE_SIG_FORCE
    # -> Networking support
    scripts/config -e NETFILTER_INGRESS
    # -> Device Drivers
    scripts/config -e FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                -e DELL_SMBIOS_SMM \
                -m PATA_JMICRON \
                -E SOUND SOUND_OSS_CORE \
                -e SND_OSSEMUL \
                -M SND_OSSEMUL SND_MIXER_OSS \
                -M SND_MIXER_OSS SND_PCM_OSS \
                -E SND_PCM_OSS SND_PCM_OSS_PLUGINS \
                -m AGP -M AGP AGP_INTEL -M AGP_INTEL AGP_VIA
    # -> Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
    scripts/config -e SECTION_MISMATCH_WARN_ONLY
    # -> File systems
    scripts/config -m NTFS3_FS \
                -e NTFS3_LZX_XPRESS \
                -e NTFS3_FS_POSIX_ACL
    scripts/config -m SMB_SERVER \
                -e SMB_SERVER_SMBDIRECT \
                -e SMB_SERVER_CHECK_CAP_NET_ADMIN \
                -e SMB_SERVER_KERBEROS5
    # -> Security options
    scripts/config -e SECURITY_SELINUX \
                -e SECURITY_SELINUX_BOOTPARAM \
                -e SECURITY_SMACK \
                -e SECURITY_SMACK_BRINGUP \
                -e SECURITY_SMACK_NETFILTER \
                -e SECURITY_SMACK_APPEND_SIGNALS \
                -e SECURITY_TOMOYO \
                -e SECURITY_APPARMOR \
                -e SECURITY_YAMA
    # -> Security options -> Landlock options
    scripts/config -e SECURITY_LANDLOCK
    # -> Library routines
    scripts/config -k -e FONT_TER16x32
    
    # -> Enable LLVM compilation
    if [ -n "${_use_llvm_lto}" ]; then
        _debug_msg "Enabling LLVM compilation"
        
        scripts/config -d LTO_NONE \
            -e LTO \
            -e LTO_CLANG \
            -e ARCH_SUPPORTS_LTO_CLANG \
            -e ARCH_SUPPORTS_LTO_CLANG_THIN \
            -e HAS_LTO_CLANG \
            -e LTO_CLANG_THIN \
            -e HAVE_GCC_PLUGINS
    fi
    
    # -> Enable or disable debug settings
    case "${_debug_kernel}" in
        "y")
            _debug_msg "Enabling kernel debugging"
            scripts/config -e DEBUG_INFO \
                -e DEBUG_INFO_BTF \
                -e DEBUG_INFO_DWARF4 \
                -e PAHOLE_HAS_SPLIT_BTF \
                -e DEBUG_INFO_BTF_MODULES
            ;;
        "n")
            _debug_msg "Disabling kernel debugging"
            scripts/config -d DEBUG_INFO \
                -d DEBUG_INFO_BTF \
                -d DEBUG_INFO_DWARF4 \
                -d PAHOLE_HAS_SPLIT_BTF \
                -d DEBUG_INFO_BTF_MODULES
            ;;
    esac
    
    # Run olddefconfig
    _debug_msg "Running olddefconfig"
    make ${BUILD_FLAGS[*]} olddefconfig
    
    # Show diff of default config and updated config
    _msg "Showing diff between the default and updated config"
    diff -u $srcdir/cl-linux/config .config || :
    
    if [ -n "${_subarch}" ]; then
        # Set subarch
        _debug_msg "Setting subarchitecture"
        
        if [ "${_subarch}" == "41" ]; then
            yes "${_subarch}
${_subarch_microarch}" | make ${BUILD_FLAGS[*]} oldconfig
        else
            yes "${_subarch}" | make ${BUILD_FLAGS[*]} oldconfig
        fi
    else
        # Ask for subarch
        _debug_msg "Asking for subarchitecture"
        
        make ${BUILD_FLAGS[*]} oldconfig
    fi
}

# Prepares the installation
prepare() {
    _debug_call "prepare"
    cd "${_src_linux}" || exit 1

    # Apply patches
    _apply_patches

    if [ -n "${_reuse_current}" ]; then
        # Use config from running kernel
        
        _msg " Using configuration file from running kernel"
        local "_cur_major_ver=$(zcat /proc/config.gz | grep Linux | grep -o '[0-9]*[0-9]\.[0-9]*[0-9]')"
        
        [ "${_cur_major_ver}" != "${_kernel_major}" ] &&
            _warn "Your kernel configuration is old, please update your configuration"
        
        if [[ -s /proc/config.gz ]]; then
            zcat /proc/config.gz > ./.config
            make ${BUILD_FLAGS[*]} olddefconfig
        else
            _error "Your kernel was not compiled with 'IKCONFIG_PROC'.\nUnable to read kernel configuration, aborting."
            exit 1
        fi
    elif [ -n "${_reuse_file}" ]; then
        # Use ./kconfig
        
        if [ -f "${startdir}/kconfig" ]; then
            _msg " Using configuration file \"${startdir}/kconfig\""
            cp -Tf "${startdir}/kconfig" ./.config
        else
            _error "Could not find a kernel configuration at '${startdir}/kconfig'.\nUnable to read kernel configuration, aborting."
            exit 1
        fi
    else
        # Use builtin
        
        _msg ":: Using configuration file \"${srcdir}/${pkgbase}/config\""
        cp -Tf $srcdir/cl-linux/config ./.config
    fi
    
    # Update kernel configuration
    if [ -z "${_reuse_current}" ] || [[ -n "${_reuse_current}" && -n "${_update_kconfig_on_reuse}" ]]; then
        _update_config
    fi

    # Read and apply modprobed database
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "${_localmodcfg}" ]; then
        if [ -e "${HOME}/.config/modprobed.db" ]; then
            make ${BUILD_FLAGS[*]} LSMOD=${HOME}/.config/modprobed.db localmodconfig
        else
            _warn "No modprobed.db file was found at ${HOME}/.config, skipping"
        fi
    fi

    # Open configuration editors
    [ -n "$_makemenuconfig" ] && make ${BUILD_FLAGS[*]} menuconfig
    [ -n "$_makexconfig" ] && make ${BUILD_FLAGS[*]} xconfig
    [ -n "$_makenconfig" ] && make ${BUILD_FLAGS[*]} nconfig

    # Save configuration
    # shellcheck disable=SC2015
    [ -n "${_copyfinalconfig}" ] && cp -Tf ./.config "${startdir}/kconfig-new" || :

    # Write kernel version
    make -s kernelrelease > version
}

# Build kernel
build() {
    _debug_call "build"
    cd "${_src_linux}" || exit 1
    make ${BUILD_FLAGS[*]} all
}

# Packages the kernel package
_package() {
    _debug_call "_package"
    
    pkgdesc="${pkgdesc} This package includes the kernel and compiled modules."
    depends=("coreutils" "kmod" "initramfs")
    optdepends=("wireless-regdb: to set the correct wireless channels of your country"
                "linux-firmware: firmware images needed for some devices")
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
    install=linux.install
    
    cd "${_src_linux}" || exit 1
    local "modulesdir=${pkgdir}/usr/lib/modules/$(<version)"
    
    # Create boot image
    # systemd expects to find the kernel there to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "${modulesdir}/vmlinuz"
    
    # Used by mkinitcpio to name the kernel
    echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"
    
    # Install modules
    ZSTD_CLEVEL=19 make ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install  # Suppress depmod
    
    # Remove build directory
    rm "${modulesdir}"/build
}

# Packages the headers package
_package-headers() {
    _debug_call "_package-headers"
    
    pkgdesc="${pkgdesc} This package includes header files and scripts for building kernel modules."
    depends=("pahole")
    
    cd "${_src_linux}" || exit 1
    local "builddir=${pkgdir}/usr/lib/modules/$(<version)/build"
    
    install -Dt "${builddir}" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "${builddir}/kernel" -m644 kernel/Makefile
    install -Dt "${builddir}/arch/x86" -m644 arch/x86/Makefile
    cp -t "${builddir}" -a scripts
    
    # Required when STACK_VALIDATION is enabled
    install -Dt "${builddir}/tools/objtool" tools/objtool/objtool
    
    # Required when DEBUG_INFO_BTF_MODULES is enabled
    [[ -f tools/bpf/resolve_btfids/resolve_btfids ]] && install -Dt "${builddir}/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids
    
    cp -t "${builddir}" -a include
    cp -t "${builddir}/arch/x86" -a arch/x86/include
    install -Dt "${builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s
    
    install -Dt "${builddir}/drivers/md" -m644 drivers/md/*.h
    install -Dt "${builddir}/net/mac80211" -m644 net/mac80211/*.h
    
    # https://bugs.archlinux.org/task/13146
    install -Dt "${builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h
    
    # https://bugs.archlinux.org/task/20402
    install -Dt "${builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "${builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "${builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h
    
    # https://bugs.archlinux.org/task/71392
    install -Dt "${builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h
    
    find . -name 'Kconfig*' -exec install -Dm644 {} "${builddir}/{}" \;
    
    # Remove redundant architectures
    local arch
    for arch in "${builddir}"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        echo "Removing $(basename "${arch}")"
        rm -r "${arch}"
    done
    
    # Remove documentation
    rm -r "${builddir}/Documentation"
    
    # Remove broken symlinks
    find -L "${builddir}" -type l -printf "Removing %P\n" -delete
    
    # Remove loose objects
    find "${builddir}" -type f -name '*.o' -printf "Removing %P\n" -delete
    
    # Strip build tools
    local file
    while read -rd "" file; do
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
    done < <(find "${builddir}" -type f -perm -u+x ! -name vmlinux -print0)
    
    # Strip vmlinux
    strip -v $STRIP_STATIC "${builddir}/vmlinux"
    
    # Add symlink to build directory
    mkdir -p "$pkgdir/usr/src"
    ln -sr "${builddir}" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#"$pkgbase"}")
    _package${_p#"$pkgbase"}
  }"
done

# Taken from https://www.kernel.org/signature.html
validpgpkeys=(
  "ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
  "647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
  "E27E5D8A3403A2EF66873BBCDEA66FF797772CDC"  # Sasha Levin
  "AC2B29BD34A6AFDDB3F68F35E7BFC8EC95861109"  # Ben Hutchings
)
sha256sums=("b1a2562be56e42afb3f8489d4c2a7ac472ac23098f1ef1c1e40da601f54625eb"
            "SKIP"
            "dd7c856f12d3e10f09743c1d3db35f91879d92890c9fb176405783c9c7cb0c54"
            "SKIP"
            "b3fd8b1c5bbd39a577afcccf6f1119fdf83f6d72119f4c0811801bdd51d1bc61")
