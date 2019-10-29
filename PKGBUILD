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

_major=4.19
_minor=81
_srcname=linux-${_major}
_clr=${_major}.79-86
pkgbase=linux-clear-lts2018
pkgver=${_major}.${_minor}
pkgrel=1
arch=('x86_64')
url="https://github.com/clearlinux-pkgs/linux-lts2018"
license=('GPL2')
makedepends=('bc' 'cpio' 'git' 'inetutils' 'kmod' 'libelf' 'xmlto')
options=('!strip')
_gcc_more_v='20190822'
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${_major}.tar".{xz,sign}
  "https://cdn.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
  "${pkgbase}::git+https://github.com/clearlinux-pkgs/linux-lts2018.git#tag=${_clr}"
  "enable_additional_cpu_optimizations-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/$_gcc_more_v.tar.gz"
  '60-linux.hook'  # pacman hook for depmod
  '90-linux.hook'  # pacman hook for initramfs regeneration
  'linux.preset'   # standard config files for mkinitcpio ramdisk
)

_kernelname=${pkgbase#linux}
: ${_kernelname:=-clear-lts2018}

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="@${SOURCE_DATE_EPOCH:-$(date +%s)}"

prepare() {
    cd ${_srcname}

    ### Add upstream patches
        msg2 "Add upstream patches"
        patch -Np1 -i ../patch-${pkgver}

    ### Setting version
        msg2 "Setting version..."
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "$_kernelname" > localversion.20-pkgname

    ### Add Clearlinux patches
        for i in $(grep '^Patch' ${srcdir}/${pkgbase}/linux-lts2018.spec | grep -Ev '^Patch0126' | sed -n 's/.*: //p'); do
        msg2 "Applying patch ${i}..."
        patch -Np1 -i "$srcdir/${pkgbase}/${i}"
        done

    ### Setting config
        msg2 "Setting config..."
        cp -Tf $srcdir/${pkgbase}/config ./.config

    ### Enable extra stuff from arch kernel
        msg2 "Enable extra stuff from arch kernel..."

        scripts/config --undefine CONFIG_MODULE_SIG_FORCE \
                       --enable CONFIG_MODULE_COMPRESS \
                       --enable-after CONFIG_MODULE_COMPRESS CONFIG_MODULE_COMPRESS_XZ \
                       --enable CONFIG_DELL_SMBIOS_SMM \
                       --enable-after CONFIG_SOUND CONFIG_SOUND_OSS_CORE \
                       --enable CONFIG_SND_OSSEMUL \
                       --module-after CONFIG_SND_OSSEMUL CONFIG_SND_MIXER_OSS \
                       --module-after CONFIG_SND_MIXER_OSS CONFIG_SND_PCM_OSS \
                       --enable-after CONFIG_SND_PCM_OSS CONFIG_SND_PCM_OSS_PLUGINS

        # Scheduler features
        scripts/config --undefine CONFIG_RT_GROUP_SCHED

        # Queueing/Scheduling
        scripts/config --module CONFIG_NET_SCH_CAKE

        # PATA SFF controllers with BMDMA
        scripts/config --module CONFIG_PATA_JMICRON

        # Power management and ACPI options
        scripts/config --enable CONFIG_ACPI_REV_OVERRIDE_POSSIBLE \
                       --enable CONFIG_HIBERNATION

        # Console display driver support
        scripts/config --enable CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER

        # Security options
        scripts/config --enable CONFIG_SECURITY_SELINUX \
                       --enable-after CONFIG_SECURITY_SELINUX CONFIG_SECURITY_SELINUX_BOOTPARAM \
                       --set-val CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE 0 \
                       --enable CONFIG_SECURITY_SMACK \
                       --enable-after CONFIG_SECURITY_SMACK CONFIG_SECURITY_SMACK_BRINGUP \
                       --enable-after CONFIG_SECURITY_SMACK_BRINGUP CONFIG_SECURITY_SMACK_NETFILTER \
                       --enable-after CONFIG_SECURITY_SMACK_NETFILTER CONFIG_SECURITY_SMACK_APPEND_SIGNALS \
                       --enable CONFIG_SECURITY_TOMOYO \
                       --enable CONFIG_SECURITY_APPARMOR \
                       --set-val CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE 0 \
                       --enable CONFIG_SECURITY_YAMA

        make olddefconfig

    ### Patch source to unlock additional gcc CPU optimizations
        # https://github.com/graysky2/kernel_gcc_patch
        if [ "${_enable_gcc_more_v}" = "y" ]; then
        msg2 "Applying enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch ..."
        patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"
        fi

    ### Get kernel version
        if [ "${_enable_gcc_more_v}" = "y" ] || [ -n "${_subarch}" ]; then
        yes "$_subarch" | make oldconfig
        else
        make prepare
        fi

    ### Prepared version
        make -s kernelrelease > version
        msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
          if [ -f $HOME/.config/modprobed.db ]; then
            msg2 "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
          else
            msg2 "No modprobed.db data found"
            exit
          fi
        fi

    ### do not run `make olddefconfig` as it sets default options
        yes "" | make config >/dev/null

    ### Running make nconfig

        [[ -z "$_makenconfig" ]] || make nconfig

    ### Save configuration for later reuse

        cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${_kernelname}"
}

build() {
    cd ${_srcname}

    make bzImage modules
}

_package() {
    pkgdesc="Clearlinux lts2018 kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')
    provides=('WIREGUARD-MODULE')
    backup=("etc/mkinitcpio.d/${pkgbase}.preset")
    install=linux.install

    cd $_srcname

    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"
    install -Dm644 "$modulesdir/vmlinuz" "$pkgdir/boot/vmlinuz-$pkgbase"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    msg2 "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

    # remove build and source links
    rm "$modulesdir"/{source,build}

    msg2 "Installing hooks..."
    
    # sed expression for following substitutions
    local subst="
      s|%PKGBASE%|$pkgbase|g
      s|%KERNVER%|$kernver|g
    "

    # hack to allow specifying an initially nonexisting install file
    sed "$subst" "$startdir/$install" > "$startdir/$install.pkg"
    true && install=$install.pkg

    # fill in mkinitcpio preset and pacman hooks
    sed "$subst" ../linux.preset | install -Dm644 /dev/stdin \
        "$pkgdir/etc/mkinitcpio.d/$pkgbase.preset"
    sed "$subst" ../60-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/60-${pkgbase}.hook"
    sed "$subst" ../90-linux.hook | install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/libalpm/hooks/90-${pkgbase}.hook"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Header files and scripts for building modules for linux-clear-lts2018"

    cd ${_srcname}
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    msg2 "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # add xfs and shmem for aufs building
    mkdir -p "$builddir"/{fs/xfs,mm}

    # ???
    mkdir "$builddir/.tmp_versions"

    msg2 "Installing headers..."
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

    msg2 "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

    msg2 "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */x86/ ]] && continue
        echo "Removing $(basename "$arch")"
        rm -r "$arch"
    done

    msg2 "Removing documentation..."
    rm -r "$builddir/Documentation"

    msg2 "Removing broken symlinks..."
    find -L "$builddir" -type l -printf 'Removing %P\n' -delete

    msg2 "Removing loose objects..."
    find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

    msg2 "Stripping build tools..."
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

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha256sums=('0c68f5655528aed4f99dae71a5b259edc93239fa899e2df79c055275c21749a1'
            'SKIP'
            '42c2ae8c4178ca27dd7e5da55db3b4f078091b8d22d7d31d82064f4ddc86d73b'
            'SKIP'
            '8c11086809864b5cef7d079f930bd40da8d0869c091965fa62e95de9a0fe13b5'
            '452b8d4d71e1565ca91b1bebb280693549222ef51c47ba8964e411b2d461699c'
            'c043f3033bb781e2688794a59f6d1f7ed49ef9b13eb77ff9a425df33a244a636'
            'ad6344badc91ad0630caacde83f7f9b97276f80d26a20619a87952be65492c65')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
