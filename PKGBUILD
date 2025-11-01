#!/usr/bin/env bash
# shellcheck disable=SC2034 disable=SC2048 disable=SC2086 disable=SC2154


# This PKGBUILD is/was authored by:
# - JeremyStarTM <jeremystartm@staropensource.de>
# - yarost12 <yaro330@gmail.com>
# - Josip Ponjavic <josipponjavic at gmail dot com>
#
# For a list of maintainers see MAINTAINERS.md


### BUILD OPTIONS
# You can modify these settings by executing "env _<setting>=<value> makepkg"
# instead of modifying the PKGBUILD file. Here's an example:
# env _makemenuconfig=y _copyfinalconfig=y _subarch=30 makepkg

# Toggles colorful log messages.
#
# We unfortunately have no way of checking whether the
# terminal supports colors because 'makepkg' unsets
# the 'CI' and 'COLORTERM' variables before we can read them.
#
# Set to anything but null to deactivate.
: "${_disable_colorful_logging:=""}"

# Specifies a list of additional patches to apply.
#
# All values must be prefixed with a plus sign (+)
# and be separated by spaces. Any invalid values
# will be silently ignored.
#
# Available patch categories:
# - experimental: Experimental patches that should not be enabled on production kernels
: "${_additionalpatches:=""}"

# Tweak kernel options prior to a build via menuconfig.
#
# Set to anything but null to activate.
: "${_makemenuconfig:=""}"

# Tweak kernel options prior to a build via nconfig.
#
# Set to anything but null to activate.
: "${_makenconfig:=""}"

# Tweak kernel options prior to a build via xconfig.
#
# Set to anything but null to activate.
: "${_makexconfig:=""}"

# Use the current kernel's .config file
# Enabling this option will use the .config of the currently
# running kernel rather than the Arch Linux defaults. Useful
# when the package gets updated and you already went through
# the trouble of customizing your config options. NOT recommended
# when a new kernel is released, but again, convenient
# for package bumps.
#
# Set to anything but null to activate.
: "${_use_current:=""}"

# Apply selected optimizations chosen by
# the package maintainers to the config.
#
# Only takes effect if '_use_current'
# is enabled. Keep disabled if you want
# to reuse your existing kernel configuration
# without any changes being applied to it.
#
# Set to anything but null to activate.
: "${_optimize_defconfig:=""}"

# Determines whether the kernel configuration should be
# copied into the source tree before compilation starts.
#
# Set to anything but null to activate.
: "${_copyfinalconfig:=""}"

# Only compile active modules to VASTLY reduce the number
# of modules built and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give modprobed-db a try: https://aur.archlinux.org/packages/modprobed-db
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
# Set to anything but null to activate.
: "${_localmodcfg:=""}"

# Optionally select a sub architecture by number or its Kconfig name,
# for example MCORE2 or MZEN4.
#
# Leaving it blank will require user interaction during the build.
# Note that the default option is empty.
#
# Important notice for maintainers:
# Make sure to update the '_subarch'
# section inside update_defconfig()
# if this list is updated on updating
# the kernel compiler patchset.
#
#  1. Generic-x86-64 (GENERIC_CPU)
#  2. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  3. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3)
#  4. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10)
#  5. AMD Barcelona (MBARCELONA)
#  6. AMD Bobcat (MBOBCAT)
#  7. AMD Jaguar (MJAGUAR)
#  8. AMD Bulldozer (MBULLDOZER)
#  9. AMD Piledriver (MPILEDRIVER)
#  10. AMD Steamroller (MSTEAMROLLER)
#  11. AMD Excavator (MEXCAVATOR)
#  12. AMD Ryzen (MZEN)
#  13. AMD Ryzen 2 (MZEN2)
#  14. AMD Ryzen 3 (MZEN3)
#  15. AMD Ryzen 4 (MZEN4)
#  16. AMD Ryzen 5 (MZEN5)
#  17. Intel P4 / older Netburst based Xeon (MPSC)
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
#  29. Intel Skylake-X (7th Gen Core i7/i9) (MSKYLAKEX)
#  30. Intel Coffee Lake/Kaby Lake Refresh (8th Gen Core i3/i5/i7) (MCANNONLAKE)
#  31. Intel Ice Lake (MICELAKE_CLIENT)
#  32. Intel Ice Lake-SP (3rd Gen Xeon Scalable) (MICELAKE_SERVER)
#  33. Intel Cooper Lake (MCOOPERLAKE)
#  34. Intel Cascade Lake (MCASCADELAKE)
#  35. Intel Tiger Lake (MTIGERLAKE)
#  36. Intel Sapphire Rapids (MSAPPHIRERAPIDS)
#  37. Intel Rocket Lake (MROCKETLAKE)
#  38. Intel Alder Lake (MALDERLAKE)
#  39. Intel Raptor Lake (MRAPTORLAKE)
#  40. Intel Meteor Lake (MMETEORLAKE)
#  41. Intel Emerald Rapids (MEMERALDRAPIDS)
#  42. Intel Diamond Rapids (7th Gen Xeon Scalable) (MDIAMONDRAPIDS)
: "${_subarch:=""}"

# Selects the x86-64 microarchitecture to compile for.
# This value is only used by the GENERIC_CPU
# subarchitecture and is required.
# Can be either '1', '2', '3' or '4'
#
# Set to '1' by default
#
# For more information see:
# https://en.wikipedia.org/wiki/X86-64#Microarchitecture_levels
: "${_subarch_microarch:="1"}"


# Enable compilation with LLVM
# Be warned, this is largely untested by me (JeremyStarTM). It *should* work,
# but if it doesn't, write a comment and I'll fix it.
#
# Set to anything but null to activate.
: "${_use_llvm_lto:=""}"

# Debug options
# This allows you to enable or disable debug options.
# Set to 'y' to force enable, 'n' to force disable or '' to ignore debug options.
# Leaving the setting empty will use the kernel configuration setting to determine
# if debug options shall be enabled/disabled.
#
# Set to anything but null to activate.
: "${_debug:=""}"

### BUILD OPTIONS END

### DEPRECATED BUILD OPTIONS START

# See '_use_current'
: "${_reuse_current:=""}"

# See '_optimize_defconfig'
: "${_update_kconfig_on_reuse:=""}"

# Show full compilation output
# This used to control whether normal build
# or some magic pv output should be
# displayed while the kernel is compiling.
: "${_show_compile:=""}"

### DEPRECATED BUILD OPTIONS END


# Kernel version
_kernel_major=6.17
_kernel_minor=6
# Tachyon patches version
_tachyon=6.17.6-1594
# kernel_compiler_patch version
_kernelcompilerpatch="20250818.2"
# kernel_compiler_patch name
_kernelcompilername="more-ISA-levels-and-uarches-for-kernel-6.16+.patch"
# Source directory names
_src_linux=linux-${_kernel_major}


# Package information
pkgbase=linux-tachyon
pkgver=${_kernel_major}.${_kernel_minor}
pkgrel=1
pkgdesc="Linux kernel with patches from Linux Tachyon (formerly Linux Clear) which allow for higher performance."
arch=("x86_64")
url="https://git.staropensource.de/StarOpenSource/Linux-Tachyon"
license=("GPL-2.0-only")
makedepends=("bc" "cpio" "gettext" "git" "libelf" "pahole" "perl" "python" "tar" "xz" "zstd")
options=("!strip" "!debug")
source=(
    "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel_major}.tar.xz"
    "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel_major}.tar.sign"
    "https://cdn.kernel.org/pub/linux/kernel/v6.x/patch-${_kernel_major}.${_kernel_minor}.xz"
    "tachyon::git+https://git.staropensource.de/StarOpenSource/Linux-Tachyon.git"
    "more-uarches-${_kernelcompilerpatch}.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/${_kernelcompilerpatch}.tar.gz"
)


# Integrity & signature verification
# -> SHA-256 checksums of the package's sources
#    These need to be updated each release; see the 'source' array 
sha256sums=(
    "9b607166a1c999d8326098121222feb080a20a3253975fcdfa2de96ba7f757a7"
    "SKIP"
    "54427fe08bcd055c963c579fa61ed23f7be7c1c4e73e85fd53774c72d356d994"
    "SKIP"
    "326701c512295d50b7ee5b281287959b0e318bba8fed7abe746099e5b658849a"
)

# -> Kernel PGP signer fingerprints
#    Taken from https://www.kernel.org/signature.html
validpgpkeys=(
  "ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds (torvalds@kernel.org)
  "647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman (gregkh@kernel.org)
  "E27E5D8A3403A2EF66873BBCDEA66FF797772CDC"  # Sasha Levin (sashal@kernel.org)
  "AC2B29BD34A6AFDDB3F68F35E7BFC8EC95861109"  # Ben Hutchings (benh@debian.org)
)


# Update package information and build flags based on build settings
[ -n "${_use_llvm_lto}" ] && makedepends+=("clang" "llvm" "lld")
[ "${_debug}" == "y" ] && options=("!strip")
[ -n "${_use_llvm_lto}" ] && BUILD_FLAGS=("LLVM=1" "LLVM_IAS=1")


# Set kernel build properties
export "KBUILD_BUILD_HOST=archlinux"
export "KBUILD_BUILD_USER=${pkgbase}"
export "KBUILD_BUILD_TIMESTAMP=$(date -Ru${SOURCE_DATE_EPOCH:+d @${SOURCE_DATE_EPOCH}})"


## Logs a message.
##
## This method is internal and should not be used directly.
##
## Arguments: <str:ANSI color code> <str:level name> <str:message...>
_log() {
    COLOR_CODE="${1}"
    LEVEL_NAME="${2}"
    shift 2
    
    if [ -z "${_disable_colorful_logging}" ]; then
        echo -en "\e[1;${COLOR_CODE}m:: ${LEVEL_NAME}: \e[0m\e[0;${COLOR_CODE}m"
        echo -n "${*}"
        echo -e "\e[0m"
    else
        echo -en ":: ${LEVEL_NAME}: "
        echo "${*}"
    fi
}

## Logs an informational message.
##
## Arguments: <str:message...>
_info() { _log "37" "INFO" "${*}"; }

## Logs a warning message.
##
## Arguments: <str:message...>
_warning() { _log "33" "WARN" "${*}"; }

## Logs an error message.
##
## Arguments: <str:message...>
_error() { _log "31" "ERR!" "${*}"; }


## Checks for deprecated settings.
_check_deprecated_settings() {
    if [ -n "${_update_kconfig_on_reuse}" ]; then
        _warning "Please switch to using '_optimize_defconfig' flag instead of '_update_kconfig_on_reuse'"
        _optimize_defconfig="y"
    fi
    if [ -n "${_reuse_current}" ]; then
        _warning "Please switch to using '_use_current' flag instead of '_reuse_current'"
        _use_current="y"
    fi
    [ -n "${_show_compile}" ] && _warning "'_show_compile' is no longer supported"

    # To avoid an error
    true
}

## Parses the linux.spec file for patches to apply
_get_patches() {
    # Get the list of patches from the file, ignore the comments
    grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list.txt
    # Experimental patches
    [[ "${_additionalpatches,,}" == *"+experimental"* ]] && grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list_exp.txt
}


## Invokes '_get_patches' and applies them as well as KCC
_apply_patches() {
    _info "Applying patches"
    
    # Patch with kernel update patch
    _info "Applying kernel update patch"
    patch -sNp1 -i ../patch-${_kernel_major}.${_kernel_minor} || true

    # Set version
    echo "-${pkgrel}" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    # Patch with Tachyon patches
    for __patch in $(_get_patches); do
        _info "Applying '${__patch}'"
        if [ -n "${_use_llvm_lto}" ]; then
            [ "${__patch}" == "0133-novector.patch" ] && continue
        fi

        patch -sNp1 -i "${srcdir}/tachyon/patches/${__patch}" || true
    done

    # Patch with kernel_compiler_patch patches.
    # Do this before any defconfig invocations so we
    # have all of the extra selectable uarches ready and selectable
    _info "Applying the kernel compiler patch"
    patch -sNp1 -i "$srcdir/kernel_compiler_patch-${_kernelcompilerpatch}/${_kernelcompilername}"
}


## Runs *config based on the user's wishes.
_modify_defconfig() {
    [ -n "${_makemenuconfig}" ] && make ${BUILD_FLAGS[*]} menuconfig
    [ -n "${_makexconfig}" ] && make ${BUILD_FLAGS[*]} xconfig
    [ -n "${_makenconfig}" ] && make ${BUILD_FLAGS[*]} nconfig

    # Don't crash if all three are false
    true
}


## Verifies the kernel configuration version
## and copies the current kernel configuration, if wanted.
_copy_defconfig() {
    # Check if running kernel is compatible with the new kernel
    local __current_major_version
    __current_major_version="$(uname -r | grep -o '[0-9]*[0-9]\.[0-9]*[0-9]')"
    [ "${__current_major_version}" != "${_kernel_major}" ] &&
        _warning "Major version was updated, you should regen the defconfig"

    # Copy running kernel configuration
    if [ -s /proc/config.gz ]; then
        _info "Copying configuration from running kernel"
        # modprobe configs
        zcat /proc/config.gz > ./.config
        make ${BUILD_FLAGS[*]} olddefconfig
    else
        _warning "Your kernel was not compiled with IKCONFIG_PROC."
        _warning "Unable to read kernel configuration, aborting."
        exit
    fi
}


## Modifies the kernel configuration and displays a
## selection of subarches (if left unspecified by the user).
_update_defconfig() {
    # Copy configuration file (if found)
    if [ -f "${startdir}/kconfig" ]; then
        _info "Using configuration file \"${startdir}/kconfig\""
        cp -Tf "${startdir}/kconfig" ./.config
    else
        _info "Using configuration file \"${srcdir}/${pkgbase}/config\""
        cp -Tf $srcdir/tachyon/config ./.config
    fi

    # Extra configuration
    _info "Updating kernel configuration"
    # General setup
    scripts/config --set-str DEFAULT_HOSTNAME archlinux \
                   -e IKCONFIG \
                   -e IKCONFIG_PROC \
                   -u RT_GROUP_SCHED
    # Power management and ACPI options
    scripts/config -e ACPI_REV_OVERRIDE_POSSIBLE \
                   -e ACPI_TABLE_UPGRADE
    # Virtualization
    scripts/config -e KVM_SMM
    # General architecture-dependent options
    scripts/config -e KPROBES
    # Enable loadable module support
    scripts/config -u MODULE_SIG_FORCE
    # Networking support
    scripts/config -e NETFILTER_INGRESS
    # Device Drivers
    scripts/config -e FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                   -e DELL_SMBIOS_SMM \
                   -m PATA_JMICRON \
                   -E SOUND SOUND_OSS_CORE \
                   -e SND_OSSEMUL \
                   -M SND_OSSEMUL SND_MIXER_OSS \
                   -M SND_MIXER_OSS SND_PCM_OSS \
                   -E SND_PCM_OSS SND_PCM_OSS_PLUGINS \
                   -m AGP -M AGP AGP_INTEL -M AGP_INTEL AGP_VIA
    # Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
    scripts/config -e SECTION_MISMATCH_WARN_ONLY
    # File systems
    scripts/config -m NTFS3_FS \
                   -e NTFS3_LZX_XPRESS \
                   -e NTFS3_FS_POSIX_ACL
    scripts/config -m SMB_SERVER \
                   -e SMB_SERVER_SMBDIRECT \
                   -e SMB_SERVER_CHECK_CAP_NET_ADMIN \
                   -e SMB_SERVER_KERBEROS5
    # Security options
    scripts/config -e SECURITY_SELINUX \
                   -e SECURITY_SELINUX_BOOTPARAM \
                   -e SECURITY_SMACK \
                   -e SECURITY_SMACK_BRINGUP \
                   -e SECURITY_SMACK_NETFILTER \
                   -e SECURITY_SMACK_APPEND_SIGNALS \
                   -e SECURITY_TOMOYO \
                   -e SECURITY_APPARMOR \
                   -e SECURITY_YAMA
    # Security options -> Landlock options
    scripts/config -e SECURITY_LANDLOCK
    # Library routines
    scripts/config -k -e FONT_TER16x32

    # EDAC enablement for modern CPUs
    scripts/config -e EDAC_AMD64 \
                   -e EDAC_IGEN6

    # Enable LLVM compilation
    [ -n "${_use_llvm_lto}" ] && scripts/config -d LTO_NONE \
                                                -e LTO \
                                                -e LTO_CLANG \
                                                -e ARCH_SUPPORTS_LTO_CLANG \
                                                -e ARCH_SUPPORTS_LTO_CLANG_THIN \
                                                -e HAS_LTO_CLANG \
                                                -e LTO_CLANG_THIN \
                                                -e HAVE_GCC_PLUGINS

    # Enable or disable debug settings
    [ "${_debug}" == "y" ] && scripts/config -e DEBUG_INFO \
                                             -e DEBUG_INFO_BTF \
                                             -e DEBUG_INFO_DWARF4 \
                                             -e PAHOLE_HAS_SPLIT_BTF \
                                             -e DEBUG_INFO_BTF_MODULES
    [ "${_debug}" == "n" ] && scripts/config -d DEBUG_INFO \
                                             -d DEBUG_INFO_BTF \
                                             -d DEBUG_INFO_DWARF4 \
                                             -d PAHOLE_HAS_SPLIT_BTF \
                                             -d DEBUG_INFO_BTF_MODULES

    # Run olddefconfig
    _info "Executing 'make olddefconfig'"
    make ${BUILD_FLAGS[*]} olddefconfig

    # Here we slightly break the config by removing one of the
    # members of the 'Processor family' selection.
    # This causes oldconfig to always invoke that selection.
    sed -i '/CONFIG_GENERIC_CPU/d' .config || :
    # For a slim chance that someone is building X86_32
    sed -i '/CONFIG_M686/d' .config || :

    case ${_subarch} in
        "")
            # Ask for subarch if none provided
            make "${BUILD_FLAGS[@]}" oldconfig
            ;;
        "1" | "GENERIC_CPU")
            # Set x86-64 microarch
            scripts/config -e GENERIC_CPU
            scripts/config --set-val X86_64_VERSION "${_subarch_microarch}"
            make "${BUILD_FLAGS[@]}" oldconfig
            ;;
        [1-9]|[1-3][0-9]|[4][0-3]|42)
            # 1 to 9, 10 to 39, 40 to 42
            # 42 is the last supported value here, refer to the _subarch
            # documentation above and keep the last section of this check
            # in sync with the supported value.
            # stderr checks below shouldn't be needed with the above check in place,
            # but will be left in-place regardless in case of future updates
            # breaking something

            # We're only interested in stderr
            {
                local __ERROR
                __ERROR="$(echo "${_subarch}" | make "${BUILD_FLAGS[@]}" oldconfig 2>&1 1>&${out})"
            } {out}>/dev/null

            # Invoke echo to sanitize the __ERROR as it can contain
            # newlines or carriage returns, thus breaking the script.
            # shellcheck disable=SC2116
            if [ -n "$(echo ${__ERROR})" ]; then
                _warning "Selected subarch: ${_subarch} is not supported"
                exit 1
            fi
            ;;
        *)
            # String - check if it exists in .config and if it does - set it
            if grep -q -e "CONFIG_${_subarch}[[:space:]]" -e "CONFIG_${_subarch}=" .config; then
                # Check if option exists in .config
                scripts/config -e "${_subarch}"
                make "${BUILD_FLAGS[@]}" olddefconfig
            else
                _warning "Unrecognized subarch value: ${_subarch}"
                exit 1
            fi
            ;;
    esac
}


## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#prepare()
prepare() {
    cd "${_src_linux}" || exit 1

    _check_deprecated_settings
    _apply_patches

    [ -n "${_use_current}" ] && _copy_defconfig
    [ -n "${_optimize_defconfig}" ] || [ -z "${_use_current}" ] && _update_defconfig

    # Read and apply modprobed database
    # See https://aur.archlinux.org/packages/modprobed-db
    if [ -n "${_localmodcfg}" ]; then
        if [ -e "${HOME}/.config/modprobed.db" ]; then
            _info "Applying the modprobed database"
            make ${BUILD_FLAGS[*]} LSMOD=${HOME}/.config/modprobed.db localmodconfig
        else
            _info "No modprobed.db file was found at ${HOME}/.config, skipping"
        fi
    fi

    # Open configuration editors
    _modify_defconfig

    # Save configuration
    # shellcheck disable=SC2015
    [ -n "${_copyfinalconfig}" ] && cp -Tf ./.config "${startdir}/kconfig-new" || true

    # Write kernel version
    make -s kernelrelease > version
}


## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#build()
build() {
    cd "${_src_linux}" || exit 1
    make ${BUILD_FLAGS[*]} all
}


## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#package()
_package() {
    pkgdesc="${pkgdesc} This package includes the kernel and compiled modules."
    depends=("coreutils" "kmod" "initramfs")
    optdepends=("wireless-regdb: to set the correct wireless channels of your country"
                "linux-firmware: firmware images needed for some devices")
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE)
    install=linux.install

    cd "${_src_linux}" || exit 1
    local "__modulesdir=${pkgdir}/usr/lib/modules/$(<version)"

    # Create boot image
    # systemd expects to find the kernel there to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "${__modulesdir}/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "${pkgbase}" | install -Dm644 /dev/stdin "${__modulesdir}/pkgbase"

    # Install modules
    # We specify DEPMOD=/doesnt/exist here to suppress depmod
    ZSTD_CLEVEL=19 make ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}/usr" \
        INSTALL_MOD_STRIP=1 DEPMOD=/doesnt/exist modules_install

    # Remove build directory
    rm -vrf "${__modulesdir}"/build
}


## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#package()
_package-headers() {
    pkgdesc="${pkgdesc} This package includes header files and scripts for building kernel modules."
    depends=("pahole")

    cd "${_src_linux}" || exit 1
    local "__builddir=${pkgdir}/usr/lib/modules/$(<version)/build"

    install -Dt "${__builddir}" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "${__builddir}/kernel" -m644 kernel/Makefile
    install -Dt "${__builddir}/arch/x86" -m644 arch/x86/Makefile
    cp -t "${__builddir}" -a scripts

    # Required when STACK_VALIDATION is enabled
    install -Dt "${__builddir}/tools/objtool" tools/objtool/objtool

    # Required when DEBUG_INFO_BTF_MODULES is enabled
    [ -f tools/bpf/resolve_btfids/resolve_btfids ] && install -Dt "${__builddir}/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

    cp -t "${__builddir}" -a include
    cp -t "${__builddir}/arch/x86" -a arch/x86/include
    install -Dt "${__builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

    install -Dt "${__builddir}/drivers/md" -m644 drivers/md/*.h
    install -Dt "${__builddir}/net/mac80211" -m644 net/mac80211/*.h

    # https://bugs.archlinux.org/task/13146
    install -Dt "${__builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # https://bugs.archlinux.org/task/20402
    install -Dt "${__builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "${__builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "${__builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

    # https://bugs.archlinux.org/task/71392
    install -Dt "${__builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

    find . -name 'Kconfig*' -exec install -Dm644 {} "${__builddir}/{}" \;

    # Remove redundant architectures
    local __arch
    for __arch in "${__builddir}/arch/"*/; do
        [[ ${__arch} = */x86/ ]] && continue
        _info "Removing '$(basename "${__arch}")'"
        rm -r "${__arch}"
    done

    # Remove documentation
    rm -r "${__builddir}/Documentation"

    # Remove broken symlinks
    find -L "${__builddir}" -type l -printf "Removing %P\n" -delete

    # Remove loose objects
    find "${__builddir}" -type f -name '*.o' -printf "Removing %P\n" -delete

    # Strip build tools
    local __file
    while read -rd "" __file; do
        case "$(file -Sib "${__file}")" in
            application/x-sharedlib\;*)       # Libraries (.so)
                strip -v ${STRIP_SHARED} "${__file}" ;;
            application/x-archive\;*)         # Libraries (.a)
                strip -v ${STRIP_STATIC} "${__file}" ;;
            application/x-executable\;*)      # Binaries
                strip -v ${STRIP_BINARIEreS} "${__file}" ;;
            application/x-pie-executable\;*)  # Relocatable binaries
                strip -v ${STRIP_SHARED} "${__file}" ;;
        esac
    done < <(find "${__builddir}" -type f -perm -u+x ! -name vmlinux -print0)

    # Strip vmlinux
    strip -v ${STRIP_STATIC} "${__builddir}/vmlinux"

    # Add symlink to build directory
    mkdir -p "${pkgdir}/usr/src"
    ln -sr "${__builddir}" "${pkgdir}/usr/src/${pkgbase}"
}


pkgname=("${pkgbase}" "${pkgbase}-headers")
for _package in "${pkgname[@]}"; do
  eval "package_${_package}() {
    $(declare -f "_package${_package#"${pkgbase}"}")
    _package${_package#"${pkgbase}"}
  }"
done
