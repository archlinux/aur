# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
: "${_makenconfig:=""}"

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
: "${_localmodcfg:=""}"

### IMPORTANT: Do no edit below this line unless you know what you're doing

_major=4.14
_minor=284
_srcname=linux-${_major}
_clr=${_major}.280-201
pkgbase=linux-clear-lts2017
pkgver=${_major}.${_minor}
pkgrel=1
pkgdesc='Clear Linux lts2017'
arch=('x86_64')
url="https://github.com/clearlinux-pkgs/linux-lts2017"
license=('GPL2')
makedepends=('bc' 'cpio' 'git' 'libelf' 'pahole' 'xmlto')
options=('!strip')
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${_major}.tar".{xz,sign}
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  "${pkgbase}::git+https://github.com/clearlinux-pkgs/linux-lts2017.git#tag=${_clr}"
)

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
    for i in $(grep '^Patch' ${srcdir}/${pkgbase}/linux-lts2017.spec | grep -Ev '^Patch0127' | sed -n 's/.*: //p'); do
        echo "Applying patch ${i}..."
        patch -Np1 -i "$srcdir/${pkgbase}/${i}"
    done

    ### Setting config
    echo "Setting config..."
    cp -Tf $srcdir/${pkgbase}/config ./.config

    ### Enable extra stuff from arch kernel
    echo "Enable extra stuff from arch kernel..."

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
                   --enable MODULE_COMPRESS \
                   --enable-after MODULE_COMPRESS MODULE_COMPRESS_XZ

    # Networking support
    scripts/config --enable NETFILTER_INGRESS

    # Device Drivers
    scripts/config --module PATA_JMICRON \
                   --enable SOUND_OSS_CORE \
                   --enable SND_OSSEMUL \
                   --module-after SND_OSSEMUL SND_MIXER_OSS \
                   --module-after SND_MIXER_OSS SND_PCM_OSS \
                   --enable-after SND_PCM_OSS SND_PCM_OSS_PLUGINS

    # Kernel hacking -> Compile-time checks and compiler options -> Make section mismatch errors non-fatal
    scripts/config --enable SECTION_MISMATCH_WARN_ONLY

    # Security options
    scripts/config --enable SECURITY_SELINUX \
                   --enable-after SECURITY_SELINUX SECURITY_SELINUX_BOOTPARAM \
                   --set-val SECURITY_SELINUX_BOOTPARAM_VALUE 0 \
                   --enable SECURITY_SMACK \
                   --enable-after SECURITY_SMACK SECURITY_SMACK_BRINGUP \
                   --enable-after SECURITY_SMACK_BRINGUP SECURITY_SMACK_NETFILTER \
                   --enable-after SECURITY_SMACK_NETFILTER SECURITY_SMACK_APPEND_SIGNALS \
                   --enable SECURITY_TOMOYO \
                   --enable SECURITY_APPARMOR \
                   --set-val SECURITY_APPARMOR_BOOTPARAM_VALUE 0 \
                   --enable SECURITY_YAMA

    make olddefconfig
    diff -u $srcdir/$pkgbase/config .config || :

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
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            echo "No modprobed.db data found"
            exit
        fi
    fi

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make nconfig

    ### Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
    cd ${_srcname}
    make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('wireless-regdb: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
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

    # add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # add xfs and shmem for aufs building
    mkdir -p "$builddir"/{fs/xfs,mm}

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
        case "$(file -bi "$file")" in
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

sha256sums=('f81d59477e90a130857ce18dc02f4fbe5725854911db1e7ba770c7cd350f96a7'
            'SKIP'
            '8a00f2792a5cb31580f070f6e839390327d532cad76906a362ce78ae03f15b5e'
            'SKIP')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
