# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

### BUILD OPTIONS

# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Optionally select a sub architecture by number if building in a clean chroot
# Leaving this entry blank will require user interaction during the build
# which will cause a failure to build if using makechrootpkg. Note that the
# generic (default) option is 30.
#
# Note - the march=native option is unavailable by this method, use the nconfig
# and manually select it.
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

pkgbase=linux-pds
pkgver=6.1.1.arch1
pkgrel=1
pkgdesc="Linux"
_srcver_tag=v${pkgver%.*}-${pkgver##*.}
url="https://github.com/archlinux/linux/commits/$_srcver_tag"
arch=(x86_64)
license=(GPL2)
makedepends=(
    bc libelf pahole cpio perl tar xz
    xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick texlive-latexextra
    git
)
options=('!strip')

_reponame="linux-archlinux"
_repo_url="https://github.com/archlinux/linux.git"

_reponame_kernel_patch="kernel_compiler_patch"
_repo_url_kernel_patch="https://github.com/graysky2/${_reponame_kernel_patch}.git"
_kernel_patch_name="more-uarches-for-kernel-5.17+.patch"

_pkgdesc_extra="~ featuring Alfred Chen's PDS CPU scheduler, rebased by TkG"

PatchesArray=(
    0009-prjc_v6.1-r0.patch
    0005-glitched-pds.patch
)

source=(
    "${_reponame}::git+${_repo_url}?signed#tag=$_srcver_tag"
    "git+${_repo_url_kernel_patch}"
    config # kernel config file
    ${PatchesArray[@]}
)
validpgpkeys=(
    "ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
    "647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
    "A2FF3A36AAA56654109064AB19802F8B0D70FC30"  # Jan Alexander Steffens (heftig)
    "C7E7849466FE2358343588377258734B41C31549"  # David Runge <dvzrv@archlinux.org>
)
sha512sums=('SKIP'
            'SKIP'
            '43eb44979e3b8d3098524351e966e1f79d0a3a51a85e59176716a10fda43cc8baa71d886ab0bc36617f7774cf14579e2ebdec232d1d88fcbe3cb7a2b5d757322'
            '48bd8d10ebd46ad176c2e6b07fb30bded6bac39fbd837ead060736bb045f97ef50d16ed8ddc3d4c1cc15e94e6da425dba652f1e57f8f7c3db252b8df8e83c946'
            '889f0a49f326de3f119290256393b09a9e9241c2a297ca0b7967a2884e4e35d71388d2a559e4c206f55f67228b65e8f2013a1ec61f6ff8f1de3b6a725fd5fa57')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd "$srcdir/$_reponame"

    msg2 "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    FullPatchesArray=(
        $_reponame_kernel_patch/$_kernel_patch_name
        ${PatchesArray[@]}
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

    # Set yield_type to 0
    sed -i -e 's/int sched_yield_type __read_mostly = 1;/int sched_yield_type __read_mostly = 0;/' ./kernel/sched/alt_core.c

    # do not run 'make olddefconfig' as it sets default options
    yes "" | make config >/dev/null
    
    msg2 "Showing config diff"
    diff -u ../config .config || :

    make -s kernelrelease > version
    msg2 "Prepared $pkgbase version $(<version)"

    [[ -z "$_makenconfig" ]] || make nconfig

    # save configuration for later reuse
    cat .config > "$startdir/config.last"
}

build() {
    cd $_reponame
    make all
    make htmldocs
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules $_pkgdesc_extra"
    depends=(
        coreutils kmod initramfs
        wireless-regdb linux-firmware thrash-protect
    )
    provides=(
        VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE KSMBD-MODULE
    )
    replaces=(
        virtualbox-guest-modules-arch wireguard-arch
    )

    cd $_reponame
    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    msg2 "Installing boot image..."
    # systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    msg2 "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        DEPMOD=/doesnt/exist modules_install  # Suppress depmod

    # remove build and source links
    rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel $_pkgdesc_extra"
    depends=(pahole)

    cd $_reponame
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

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel $_pkgdesc_extra"

    cd $_srcname
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    msg2 "Installing documentation..."
    local src dst
    while read -rd '' src; do
        dst="${src#Documentation/}"
        dst="$builddir/Documentation/${dst#output/}"
        install -Dm644 "$src" "$dst"
    done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/share/doc"
    ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
        $(declare -f "_package${_p#$pkgbase}")
        _package${_p#$pkgbase}
    }"
done

# vim:set ts=8 sts=2 sw=2 et:
