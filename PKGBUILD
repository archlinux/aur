# Maintainer: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

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

pkgbase=linux-bcachefs-git
pkgver=5.2.21.arch1.r844589.e96bfb9bc2c1
pkgrel=1
_srcver_tag=5.2.21-arch1
url="https://github.com/koverstreet/bcachefs"
arch=(x86_64)
license=(GPL2)
makedepends=(
    xmlto
    kmod
    inetutils
    bc
    libelf
    python-sphinx
    python-sphinx_rtd_theme
    graphviz
    imagemagick
    git
)
options=('!strip')

_reponame="bcachefs"
_repo_url="https://github.com/koverstreet/$_reponame"

_reponame_gcc_patch="kernel_gcc_patch"
_repo_url_gcc_patch="https://github.com/graysky2/$_reponame_gcc_patch"
_gcc_patch_name="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

_pkgdesc_extra="~ featuring Kent Overstreet's bcachefs filesystem"

source=(
    "git+$_repo_url#branch=master"
    "git+$_repo_url_gcc_patch"
    config         # the main kernel config file
)
validpgpkeys=(
    'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
    '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha512sums=('SKIP'
            'SKIP'
            'd9519955c66275dbb8a1b056eb799b97387fab4cadb96de3a400cef7ec39f6a3ad0228c6deb24401f4ad65ffb6ed6173b27f453a1edf9c5e2a36c3a46851d4a8')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="@${SOURCE_DATE_EPOCH:-$(date +%s)}"

pkgver() {
    cd "$_reponame"
    printf "%s.r%s.%s" "${_srcver_tag//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $_reponame

    msg2 "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    msg2 "Adding patches from Linux upstream kernel repository..."
    git remote add upstream_stable "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git" || true
    # git pull --no-edit -s recursive -X ours upstream_stable v${_srcver_tag//-arch*/}
    git pull --no-edit upstream_stable v${_srcver_tag//-arch*/}

    # https://github.com/koverstreet/bcachefs/issues/74
    git revert --no-edit c785529bebceeaf38db8ebf9b50ff3a173fb18c6
    # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.2.1&id=c785529bebceeaf38db8ebf9b50ff3a173fb18c6
    # block: fix .bi_size overflow    

    msg2 "Adding patches from Arch Linux kernel repository..."
    git remote add arch_stable "https://git.archlinux.org/linux.git" || true
    # git pull --no-edit arch_stable "v$_srcver_tag"
    git fetch arch_stable v5.2.14-arch2

    git cherry-pick 7097880bd7857294d2b91084a35d2211cef7dd8b
    # https://git.archlinux.org/linux.git/commit/?h=v5.1.16-arch1&id=fd0f4757ded3627edc883650941a26a21e435a7d
    # add sysctl to disallow unprivileged CLONE_NEWUSER by default

    git cherry-pick de96c660ed1f470fed317e987444634cb6287d57
    # https://git.archlinux.org/linux.git/commit/?h=v5.1.16-arch1&id=7e6c7c0d56e1342b9ad5d8071736a5851d1ae1c7
    # ZEN: Add CONFIG for unprivileged_userns_clone

    msg2 "Fixing EXTRAVERSION..."
    sed -i 's/EXTRAVERSION =/EXTRAVERSION = -arch1/g' "$srcdir/$_reponame/Makefile"

    # https://github.com/graysky2/kernel_gcc_patch
    msg2 "Patching to enabled additional gcc CPU optimizatons..."
    patch -Np1 -i "$srcdir/$_reponame_gcc_patch/$_gcc_patch_name"
    
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

    make -s kernelrelease > version
    msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

    [[ -z "$_makenconfig" ]] || make nconfig

    # save configuration for later reuse
    cat .config > "$startdir/config.last"
}

build() {
    cd $_reponame
    make bzImage modules htmldocs
}

_package() {
    pkgdesc="The ${pkgbase/linux/Linux} kernel and modules $_pkgdesc_extra"
    depends=(
        coreutils
        kmod
        initramfs
        bcachefs-tools-git
    )
    optdepends=(
        "crda: to set the correct wireless channels of your country"
        "linux-firmware: firmware images needed for some devices"
    )
    provides=("$pkgbase=$pkgver")

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
    make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

    # remove build and source links
    rm "$modulesdir"/{source,build}

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel $_pkgdesc_extra"
    depends=("$pkgbase=$pkgver")
    provides=(
        "$pkgbase-headers=$pkgver"
        "linux-headers=$pkgver"
    )

    cd $_reponame
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

_package-docs() {
    pkgdesc="Kernel hackers manual - HTML documentation that comes with the ${pkgbase/linux/Linux} kernel $_pkgdesc_extra"
    depends=("$pkgbase=$pkgver")
    provides=(
        "$pkgbase-docs=$pkgver"
        "linux-docs=$pkgver"
    )

    cd $_reponame
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    msg2 "Installing documentation..."
    mkdir -p "$builddir"
    cp -t "$builddir" -a Documentation

    msg2 "Removing doctrees..."
    rm -r "$builddir/Documentation/output/.doctrees"

    msg2 "Moving HTML docs..."
    local src dst
    while read -rd '' src; do
        dst="$builddir/Documentation/${src#$builddir/Documentation/output/}"
        mkdir -p "${dst%/*}"
        mv "$src" "$dst"
        rmdir -p --ignore-fail-on-non-empty "${src%/*}"
    done < <(find "$builddir/Documentation/output" -type f -print0)

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/share/doc"
    ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

    msg2 "Fixing permissions..."
    chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=(
    "$pkgbase"
    "$pkgbase-headers"
    "$pkgbase-docs"
)
for _p in "${pkgname[@]}"; do
    eval "package_$_p() {
        $(declare -f "_package${_p#$pkgbase}")
        _package${_p#$pkgbase}
    }"
done
