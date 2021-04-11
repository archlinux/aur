# Maintainer: Mizuha <miizuuha[at]notgooglemail[dot]com>
# Contributor: Kyle De'Vir (QuartzDragon) <kyle[dot]devir[at]mykolab[dot]com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
pkgbase=linux-zen-bcachefs-git
pkgver=v5.10.27.zen1.r971607.feeca9682c64
_srcver_tag=v5.10.27.zen1
pkgrel=1
pkgdesc="Linux ZEN with bcachefs"
url="https://github.com/koverstreet/bcachefs"
arch=(x86_64)
license=(GPL2)

makedepends=(
    bc kmod libelf pahole cpio perl tar xz xmlto python-sphinx
    python-sphinx_rtd_theme graphviz imagemagick git
)

options=('!strip')

_linuxname="linux-kernel"
_linuxurl="https://git.kernel.org/pub/scm/linux/kernel/git/stable/${_linuxname%%-kernel}.git"
_bchfsname="bcachefs-kernel"
_bchfsurl="https://github.com/koverstreet/${_bchfsname%%-kernel}.git"
_zenname="zen-kernel"
_zenurl="https://github.com/zen-kernel/${_zenname}.git"

source=(
    "${_linuxname}::git+${_linuxurl}#branch=linux-5.10.y"
    "${_bchfsname}::git+${_bchfsurl}#branch=master"
    "${_zenname}::git+${_zenurl}#branch=5.10/master"
    choose-gcc-optimization.sh
    config      # the main kernel config file
)

validpgpkeys=(
    "ABAF11C65A2970B130ABE3C479BE3E4300411886"  # Linus Torvalds
    "647F28654894E3BD457199BE38DBBDC86092693E"  # Greg Kroah-Hartman
)

sha512sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    '95397a817c10437f5f1765a1a529744cce905e142d8a835769f9271d2736b5dc967900e068999540a9032ccb6b8db080d0e92a48fcdb1d948aa0e7d1f34d2984'
    '70d1b2da1642b9941230d03d62f061f47e94ea65882d014e311ce292fbceabd26e3362035a321971a7fdf3909ebd50fd3538b294c9d90ade61ec7a2ef0f8499f'
)

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd "$srcdir/$_bchfsname"

    git remote add zen "$srcdir/$_zenname" || true
    git remote add linux "$srcdir/$_linuxname" || true
    git pull --no-edit --no-rebase zen makepkg
    git pull --no-edit --no-rebase linux makepkg ||
        git checkout --theirs Makefile

    msg2 "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname

    msg2 "Setting config..."
    cp "$srcdir/config" .config

    # Lets user choose microarchitecture optimization in GCC
    sh "$srcdir/choose-gcc-optimization.sh"

    make prepare

    # Do not run 'make olddefconfig' as it sets default options
    yes "" | make config >/dev/null

    make -s kernelrelease > version
    msg2 "Prepared $pkgbase version $(<version)"

    # Save configuration for later reuse
    cat .config > "$startdir/config.last"
}

pkgver() {
    cd "$srcdir/$_bchfsname"
    printf "%s.r%s.%s" "${_srcver_tag//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_bchfsname"
    make all
    make htmldocs
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=(coreutils kmod initramfs bcachefs-tools-git)

    optdepends=(
        'crda: to set the correct wireless channels of your country'
        'linux-firmware: firmware images needed for some devices'
    )

    provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE VHBA-MODULE)
    replaces=()

    cd "$srcdir/$_bchfsname"
    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"

    msg2 "Installing boot image..."
    # Systemd expects to find the kernel here to allow hibernation
    # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
    install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

    # Used by mkinitcpio to name the kernel
    echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

    msg2 "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

    # Remove build and source links
    rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=(pahole)

    cd "$srcdir/$_bchfsname"
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

    msg2 "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
        localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
    cp -t "$builddir" -a scripts

    # Add objtool for external module building and enabled VALIDATION_STACK option
    install -Dt "$builddir/tools/objtool" tools/objtool/objtool

    # Add xfs and shmem for aufs building
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

    msg2 "Stripping vmlinux..."
    strip -v $STRIP_STATIC "$builddir/vmlinux"

    msg2 "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"

    cd "$srcdir/$_bchfsname"
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
