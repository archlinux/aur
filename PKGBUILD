# Maintainer: ayaya_neko <a15355447898a@outlook.com>

### BUILD OPTIONS
# You can modify these settings by executing "env _<setting>=<value> makepkg"
# instead of modifying the PKGBUILD file. Here's an example:
# env _makemenuconfig=y _copyfinalconfig=y makepkg

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

# Enable compilation with LLVM
# Be warned, this is largely untested by me (im_zerou). It *should* work,
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

# x86_64 microarchitecture to optimize for.
#
# Support has been removed in the kernel 7.0 update, as we threw out
# the kernel compiler patch for multiple microarchitectures out the
# window in the process.
: "${_subarch:=""}"

# See '_subarch'
: "${_subarch_microarch:=""}"

### DEPRECATED BUILD OPTIONS END


# Kernel version
_kernel_major=7.2
_kernel_minor=1
# Clear Linux patches version
_clr=7.2-1607
# Source directory names
_src_linux=linux-${_kernel_major}


# Package information
pkgbase=linux-clear-cjktty-zfs
pkgver=${_kernel_major}.${_kernel_minor}
pkgrel=1
pkgdesc="Clear Linux内核,带有zfs和cjktty并开启kexec"
arch=("x86_64")
url="https://git.staropensource.de/StarOpenSource/Linux-Tachyon"
license=("GPL-2.0-only")
makedepends=("bc" "cpio" "gettext" "git" "libelf" "pahole" "perl" "python" "tar" "xz" "zstd")
options=("!strip" "!debug")
source=(
    "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel_major}.tar.xz"
    "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel_major}.tar.sign"
    "https://cdn.kernel.org/pub/linux/kernel/v7.x/patch-${_kernel_major}.${_kernel_minor}.xz"
    "tachyon::git+https://git.staropensource.de/StarOpenSource/Linux-Tachyon.git"
    "git+https://github.com/openzfs/zfs.git#tag=zfs-2.4.4"
    "0001-cjktty.patch::https://github.com/bigshans/cjktty-patches/raw/master/v7.x/cjktty-7.2.patch"
    "0002-cjktty-32.patch::https://github.com/bigshans/cjktty-patches/raw/master/cjktty-add-cjk32x32-font-data.patch"
)


# Integrity & signature verification
# -> SHA-256 checksums of the package's sources
#    These need to be updated each release; see the 'source' array 
sha256sums=(
    "f9fef3d14c0df53819026f4be74459835c2a0b0dcbf5b5bbd9ea19f0829402b3"
    "SKIP"
    "35842830fcd2c12eb873aeac2365c25597d2cfe3a26edc451b55cdbe8e051d78"
    "SKIP"
    'SKIP'
    'SKIP'
    'SKIP'
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

    if [ -n "${_subarch}" ] || [ -n "${_subarch_microarch}" ]; then
        _warning "'_subarch' and '_subarch_microarch' are no longer supported"
    fi

    # To avoid an error
    true
}

## Parses the linux.spec file for patches to apply
_get_patches() {
    # Get the list of patches from the file, ignore the comments
    grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list.txt
    # Experimental patches
    if [[ "${_additionalpatches,,}" == *"+experimental"* ]]; then
        grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list_exp.txt
        grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list_exp_mm.txt
        grep -Ev '^\s*#' ${srcdir}/tachyon/patch_list_exp_sched.txt
    fi
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
        _error "Your kernel was not compiled with IKCONFIG_PROC."
        _error "Unable to read kernel configuration, aborting."
        return 1
    fi
}


## When reusing current config, also apply local patches, integrate ZFS,
## apply extra kernel options, then sync with olddefconfig (non-interactive).
_apply_overrides_on_current_config() {
    # Apply any local patches shipped via source array (e.g., cjktty)
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        src="${src%.zst}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 <"../$src"
    done

    # Sync config after local patch changes before prepare steps touch Kconfig.
    _info "Executing 'make olddefconfig' before ZFS integration (current config reuse)"
    make ${BUILD_FLAGS[*]} olddefconfig

    # Prepare kernel tree for external integration
    make ${BUILD_FLAGS[*]} prepare -j$(nproc)
    make ${BUILD_FLAGS[*]} modules_prepare -j$(nproc)

    # Integrate ZFS as builtin
    cd ${srcdir}/"zfs"
    ./autogen.sh
    sed -i "s|\$(uname -r)|${pkgver}-clear-cjktty-zfs|g" configure
    ./configure CC=gcc --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
        --datadir=/usr/share --includedir=/usr/include --with-udevdir=/lib/udev \
        --libexecdir=/usr/lib/zfs --with-config=kernel \
        --enable-linux-builtin=yes \
        --with-linux=${srcdir}/${_src_linux} \
        --with-linux-obj=${srcdir}/${_src_linux}
    ./copy-builtin ${srcdir}/${_src_linux}

    # Back to kernel tree
    cd ${srcdir}/${_src_linux}

    _apply_always_on_overrides

    # Finally, sync config without interaction
    _info "Executing 'make olddefconfig' (current config reuse)"
    make ${BUILD_FLAGS[*]} olddefconfig
}

## Applies custom features that must remain enabled regardless of config strategy.
_apply_always_on_overrides() {

    # Enable ZFS and other custom options
    scripts/config -e CONFIG_ZFS

    # cjktty fonts
    scripts/config -e CONFIG_FONT_CJK_16x16 \
                   -e CONFIG_FONT_CJK_32x32

    # kexec related options
    scripts/config -e CONFIG_ARCH_SUPPORTS_KEXEC \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_FILE \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_SIG \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_SIG_FORCE \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_BZIMAGE_VERIFY_SIG \
                   -e CONFIG_ARCH_SUPPORTS_KEXEC_JUMP \
                   -e CONFIG_ARCH_SUPPORTS_CRASH_DUMP \
                   -e CONFIG_ARCH_SUPPORTS_CRASH_HOTPLUG

    # Virtual USB for specific use-cases
    scripts/config -m CONFIG_USB_DUMMY_HCD \
                   -m CONFIG_USB_MASS_STORAGE
}

## Applies optional maintainer defaults on top of the selected base config.
_apply_optional_defconfig_overrides() {
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
    # OpenVPN data channel offload (OVPN-DCO)
    scripts/config -e OVPN
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

    # Google's BBRv3 TCP algo
    scripts/config -e TCP_CONG_BBR \
                   -e NET_SCH_FQ \
                   --set-str DEFAULT_TCP_CONG bbr \
                   --set-str DEFAULT_NET_SCH fq

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

    # Keep the helper non-fatal when optional branches are skipped.
    true
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

	# 添加cjktty补丁
	local src
	for src in "${source[@]}"; do
		src="${src%%::*}"
		src="${src##*/}"
		src="${src%.zst}"
		[[ $src = *.patch ]] || continue
		echo "Applying patch $src..."
		patch -Np1 <"../$src"
	done

	# Sync config before prepare steps so new/changed symbols take defaults.
	_info "Executing 'make olddefconfig' before ZFS integration"
	make ${BUILD_FLAGS[*]} olddefconfig

	# 编译zfs前面的准备
	make ${BUILD_FLAGS[*]} prepare -j$(nproc)
	make ${BUILD_FLAGS[*]} modules_prepare -j$(nproc)

	# 添加zfs补丁
	cd ${srcdir}/"zfs"
	./autogen.sh
	sed -i "s|\$(uname -r)|${pkgver}-clear-cjktty-zfs|g" configure
	./configure CC=gcc --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin --libdir=/usr/lib \
		--datadir=/usr/share --includedir=/usr/include --with-udevdir=/lib/udev \
		--libexecdir=/usr/lib/zfs --with-config=kernel \
		--enable-linux-builtin=yes \
		--with-linux=${srcdir}/${_src_linux} \
		--with-linux-obj=${srcdir}/${_src_linux}
	./copy-builtin ${srcdir}/${_src_linux}

	# 开启zfs选项
	cd ${srcdir}/${_src_linux}
	_apply_always_on_overrides
	_apply_optional_defconfig_overrides

    # Enable LLVM compilation
    # Run olddefconfig
    _info "Executing 'make olddefconfig'"
    make ${BUILD_FLAGS[*]} olddefconfig
}


## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#prepare()
prepare() {
    cd "${_src_linux}" || exit 1

    _check_deprecated_settings
    _apply_patches

    # Config strategy:
    # - If reusing current config, only apply maintainer defaults when requested.
    # - Otherwise, prepare a fresh defconfig with maintainer defaults.
    if [ -n "${_use_current}" ]; then
        _copy_defconfig
        _apply_overrides_on_current_config
        [ -n "${_optimize_defconfig}" ] && _apply_optional_defconfig_overrides && make ${BUILD_FLAGS[*]} olddefconfig
    else
        _update_defconfig
    fi

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
    pkgdesc="${pkgdesc} 此包包括内核和已编译的模块"
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
    # Silence this make call as it's just a compress + move operation
    ZSTD_CLEVEL=3 make -s ${BUILD_FLAGS[*]} INSTALL_MOD_PATH="${pkgdir}/usr" \
        INSTALL_MOD_STRIP=1 DEPMOD=/doesnt/exist modules_install

    # Remove build directory
    rm -vrf "${__modulesdir}"/build
}

## makepkg method; see https://wiki.archlinux.org/title/Creating_packages#package()
_package-headers() {
    pkgdesc="${pkgdesc} 此包包括用于构建内核模块的头文件和脚本"
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
