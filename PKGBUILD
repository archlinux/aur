# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

_enable_gcc_more_v="y"
# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 30.
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
#  13. Intel P4 / older Netburst based Xeon (MPSC)
#  14. Intel Atom (MATOM)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Nehalem (MNEHALEM)
#  17. Intel Westmere (MWESTMERE)
#  18. Intel Silvermont (MSILVERMONT)
#  19. Intel Goldmont (MGOLDMONT)
#  20. Intel Goldmont Plus (MGOLDMONTPLUS)
#  21. Intel Sandy Bridge (MSANDYBRIDGE)
#  22. Intel Ivy Bridge (MIVYBRIDGE)
#  23. Intel Haswell (MHASWELL)
#  24. Intel Broadwell (MBROADWELL)
#  25. Intel Skylake (MSKYLAKE)
#  26. Intel Skylake X (MSKYLAKEX)
#  27. Intel Cannon Lake (MCANNONLAKE)
#  28. Intel Ice Lake (MICELAKE)
#  29. Intel Cascade Lake (MCASCADELAKE)
#  30. Generic-x86-64 (GENERIC_CPU)
#  31. Native optimizations autodetected by GCC (MNATIVE)
_subarch=

# Compile ONLY used modules to VASTLY reduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

_major=5.6
_minor=0
_rc=6
_srcname=linux-${_major}-rc${_rc}
_clr=${_major}.0.rc4-14
pkgbase=linux-clear-current
pkgver=${_major}.${_minor}.rc${_rc}
pkgrel=1
pkgdesc='Clear Linux current'
arch=('x86_64')
url="https://github.com/clearlinux-pkgs/linux-current"
license=('GPL2')
makedepends=('bc' 'cpio' 'git' 'kmod' 'libelf' 'xmlto')
options=('!strip')
_gcc_more_v='20191217'
source=(
  "https://git.kernel.org/torvalds/t/${_srcname}.tar.gz"
  "clearlinux-current::git+https://github.com/clearlinux-pkgs/linux-current.git#tag=${_clr}"
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz"
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd ${_srcname}

    ### Setting version
        echo "Setting version..."
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Add Clearlinux patches
        for i in $(grep '^Patch' ${srcdir}/clearlinux-current/linux-current.spec | grep -Ev '^Patch0123|^Patch0051' | sed -n 's/.*: //p'); do
        echo "Applying patch ${i}..."
        patch -Np1 -i "$srcdir/clearlinux-current/${i}"
        done

    ### Setting config
        echo "Setting config..."
        cp -Tf $srcdir/clearlinux-current/config ./.config

    ### Enable extra stuff from arch kernel
        echo "Enable extra stuff from arch kernel..."

        # General setup
        scripts/config --enable IKCONFIG \
                       --enable-after IKCONFIG IKCONFIG_PROC \
                       --undefine RT_GROUP_SCHED

        # Power management and ACPI options
        scripts/config --enable ACPI_REV_OVERRIDE_POSSIBLE  \
                       --enable ACPI_TABLE_UPGRADE

        # Enable loadable module support
        scripts/config --undefine MODULE_SIG_FORCE \
                       --enable MODULE_COMPRESS \
                       --enable-after MODULE_COMPRESS MODULE_COMPRESS_XZ

        # Networking support
        scripts/config --enable NETFILTER_INGRESS \
                       --module NET_SCH_CAKE

        # Device Drivers
        scripts/config --enable FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER \
                       --enable DELL_SMBIOS_SMM \
                       --module PATA_JMICRON \
                       --enable-after SOUND SOUND_OSS_CORE \
                       --enable SND_OSSEMUL \
                       --module-after SND_OSSEMUL SND_MIXER_OSS \
                       --module-after SND_MIXER_OSS SND_PCM_OSS \
                       --enable-after SND_PCM_OSS SND_PCM_OSS_PLUGINS

        # Security options
        scripts/config --enable SECURITY_SELINUX \
                       --enable-after SECURITY_SELINUX SECURITY_SELINUX_BOOTPARAM \
                       --enable SECURITY_SMACK \
                       --enable-after SECURITY_SMACK SECURITY_SMACK_BRINGUP \
                       --enable-after SECURITY_SMACK_BRINGUP SECURITY_SMACK_NETFILTER \
                       --enable-after SECURITY_SMACK_NETFILTER SECURITY_SMACK_APPEND_SIGNALS \
                       --enable SECURITY_TOMOYO \
                       --enable SECURITY_APPARMOR \
                       --enable SECURITY_YAMA

        make olddefconfig

    ### Patch source to unlock additional gcc CPU optimizations
        # https://github.com/graysky2/kernel_gcc_patch
        if [ "${_enable_gcc_more_v}" = "y" ]; then
        echo "Applying enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v5.5+.patch ..."
        patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v5.5+.patch"
        fi

    ### Get kernel version
        if [ "${_enable_gcc_more_v}" = "y" ] || [ -n "${_subarch}" ]; then
        yes "$_subarch" | make oldconfig
        else
        make prepare
        fi

    ### Prepared version
        make -s kernelrelease > version
        echo "Prepared $pkgbase version $(<version)"

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
          if [ -f $HOME/.config/modprobed.db ]; then
            echo "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
          else
            echo "No modprobed.db data found"
            exit
          fi
        fi

    ### do not run `make olddefconfig` as it sets default options
        yes "" | make config >/dev/null

    ### Running make nconfig

        [[ -z "$_makenconfig" ]] || make nconfig

    ### Save configuration for later reuse

        cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
}

build() {
    cd ${_srcname}
    make -j$(nproc) bzImage modules
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=('WIREGUARD-MODULE')
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
    make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

    # remove build and source links
    rm "$modulesdir"/{source,build}

    echo "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"

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

    # http://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

    # http://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

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

    echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

    echo "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha256sums=('d37d25c7de5dc40a7cd6823fff57c7fc5fe098563b195b3708acd577e5e40248'
            'SKIP'
            '7a4a209de815f4bae49c7c577c0584c77257e3953ac4324d2aa425859ba657f5')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
