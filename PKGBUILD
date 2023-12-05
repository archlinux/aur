# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Original package maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

### BUILD OPTIONS

# Set these variables to ANYTHING that is not null to enable them

# Set to force building with a particular commit ~ takes precedence over _bcachefs_branch
_bcachefs_commit=

# Set to force building with a particular branch
_bcachefs_branch=

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 40.
#
# Note - the march=native option is unavailable by this method, use the nconfig
# and manually select it.
#
# 1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
# 2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3)
# 3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10)
# 4. AMD Barcelona (MBARCELONA)
# 5. AMD Bobcat (MBOBCAT)
# 6. AMD Jaguar (MJAGUAR)
# 7. AMD Bulldozer (MBULLDOZER)
# 8. AMD Piledriver (MPILEDRIVER)
# 9. AMD Steamroller (MSTEAMROLLER)
# 10. AMD Excavator (MEXCAVATOR)
# 11. AMD Zen (MZEN)
# 12. AMD Zen 2 (MZEN2)
# 13. AMD Zen 3 (MZEN3)
# 14. AMD Zen 4 (MZEN4)
# 15. Intel P4 / older Netburst based Xeon (MPSC)
# 16. Intel Core 2 (MCORE2)
# 17. Intel Atom (MATOM)
# 18. Intel Nehalem (MNEHALEM)
# 19. Intel Westmere (MWESTMERE)
# 20. Intel Silvermont (MSILVERMONT)
# 21. Intel Goldmont (MGOLDMONT)
# 22. Intel Goldmont Plus (MGOLDMONTPLUS)
# 23. Intel Sandy Bridge (MSANDYBRIDGE)
# 24. Intel Ivy Bridge (MIVYBRIDGE)
# 25. Intel Haswell (MHASWELL)
# 26. Intel Broadwell (MBROADWELL)
# 27. Intel Skylake (MSKYLAKE)
# 28. Intel Skylake X (MSKYLAKEX)
# 29. Intel Cannon Lake (MCANNONLAKE)
# 30. Intel Ice Lake (MICELAKE)
# 31. Intel Cascade Lake (MCASCADELAKE)
# 32. Intel Cooper Lake (MCOOPERLAKE)
# 33. Intel Tiger Lake (MTIGERLAKE)
# 34. Intel Sapphire Rapids (MSAPPHIRERAPIDS)
# 35. Intel Rocket Lake (MROCKETLAKE)
# 36. Intel Alder Lake (MALDERLAKE)
# 37. Intel Raptor Lake (MRAPTORLAKE)
# 38. Intel Meteor Lake (MMETEORLAKE)
# 39. Intel Emerald Rapids (MEMERALDRAPIDS)
# 40. Generic-x86-64 (GENERIC_CPU)
# 41. Generic-x86-64-v2 (GENERIC_CPU2)
# 42. Generic-x86-64-v3 (GENERIC_CPU3)
# 43. Generic-x86-64-v4 (GENERIC_CPU4)
# 44. Intel-Native optimizations autodetected by the compiler (MNATIVE_INTEL)
# 45. AMD-Native optimizations autodetected by the compiler (MNATIVE_AMD)
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

pkgbase=linux-bcachefs-git
pkgver=6.7.0.rc4.1.bcachefs.git.00088.g7b9c2240f97d.dirty
pkgrel=1
pkgdesc="Linux"
url="https://github.com/koverstreet/bcachefs"
arch=(x86_64)
license=(GPL2)
makedepends=(
    bc
    cpio
    gettext
    git
    libelf
    pahole
    perl
    python
    tar
    xz

    # htmldocs
    graphviz
    imagemagick
    python-sphinx
    texlive-latexextra
)
options=('!strip')

_srcname="linux-bcachefs"
_src_url="https://github.com/koverstreet/bcachefs.git"
_srcname_kernel_patch="kernel_compiler_patch"
_src_url_kernel_patch="https://github.com/graysky2/${_srcname_kernel_patch}.git"
_kernel_patch_name="more-uarches-for-kernel-5.17+.patch"

_pkgdesc_extra="~ featuring Kent Overstreet's bcachefs filesystem"

_kernel_base_string="${_srcname}::git+${_src_url}"
if [ -n "${_bcachefs_commit}" ]; then
    kernel_source_string="${_kernel_base_string}#commit=${_bcachefs_commit}"
elif [ -n "${_bcachefs_branch}" ]; then
    kernel_source_string="${_kernel_base_string}#branch=${_bcachefs_branch}"
else
    kernel_source_string="${_kernel_base_string}#branch=master"
fi

source=(
    ${kernel_source_string}
    #"${_srcname_upstream}::git+${_src_url_upstream}"
    "git+${_src_url_kernel_patch}"
    config  # the main kernel config file
)
validpgpkeys=(
    ABAF11C65A2970B130ABE3C479BE3E4300411886  # Linus Torvalds
    647F28654894E3BD457199BE38DBBDC86092693E  # Greg Kroah-Hartman
    A2FF3A36AAA56654109064AB19802F8B0D70FC30  # Jan Alexander Steffens (heftig)
)

sha256sums=('SKIP'
            'SKIP'
            '6e0bf273a2334f21e622f4a1dc6c1bf94bfce4e3031ab4c3ec2228028dd8f502')
b2sums=('SKIP'
        'SKIP'
        '77aa132600098813a99253fc2caa93765374d42ef28ee22af45774ec5f36c1bfa8deffafd26e677a43b43d826980fa863bba12a67f31eaab295e96f16975041f')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    msg2 "Setting version..."
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    FullPatchesArray=(
        $_srcname_kernel_patch/$_kernel_patch_name
    )
    for MyPatch in "${FullPatchesArray[@]}"
    do
        msg2 "Applying patch $MyPatch..."
        patch -Np1 -i "$srcdir/$MyPatch"
    done

    msg2 "Setting config..."
    cp ../config .config

    if [ -n "$_subarch" ]; then
        yes "$_subarch" | make oldconfig
    else
        make prepare
    fi

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

    # do not run 'make olddefconfig' as it sets default options
    yes "" | make config >/dev/null

    msg2 "Showing config diff"
    diff -u ../config .config || :

    make -s kernelrelease > version
    msg2 "Prepared $pkgbase version $(<version)"
    _srcver_tag=$(<version)

    [[ -z "$_makenconfig" ]] || make nconfig

    # save configuration for later reuse
    cat .config > "$startdir/config.last"
}

pkgver() {
    cd $_srcname
    printf "%s" "${_srcver_tag//-/.}"
}

build() {
    cd $_srcname
    make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules $_pkgdesc_extra"
    depends=(
        coreutils
        initramfs
        kmod
        bcachefs-tools-git
    )
    optdepends=(
        'wireless-regdb: to set the correct wireless channels of your country'
        'linux-firmware: firmware images needed for some devices'
    )
    provides=(
        KSMBD-MODULE
        VIRTUALBOX-GUEST-MODULES
        WIREGUARD-MODULE
    )
    replaces=(
        virtualbox-guest-modules-arch
        wireguard-arch
    )

    cd $_srcname
    local modulesdir="$pkgdir/usr/lib/modules/$(<version)"

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    msg2 "Installing modules..."
    ZSTD_CLEVEL=19 make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install  # Suppress depmod

    # remove build link
    rm "$modulesdir"/build
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel $_pkgdesc_extra"
    depends=(pahole)

    cd $_srcname
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    msg2 "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # required when STACK_VALIDATION is enabled
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # required when DEBUG_INFO_BTF_MODULES is enabled
    install -Dt "$builddir/tools/bpf/resolve_btfids" tools/bpf/resolve_btfids/resolve_btfids

    msg2 "Installing headers..."
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

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=(
    "$pkgbase"
    "$pkgbase-headers"
)
for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
        $(declare -f "_package${_p#$pkgbase}")
        _package${_p#$pkgbase}
    }"
done

# vim:set ts=8 sts=2 sw=2 et:
