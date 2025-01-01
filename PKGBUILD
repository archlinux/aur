# Maintainer: Kef Schecter <furrykef@gmail.com>
# Contributor: Mr.Smith1974
# Contributor: Christoph Brill <egore911@gmail.com>

_pkgname=abstreet
pkgname=${_pkgname}-git
pkgver=r8425.d30c36a22a
pkgrel=1
pkgdesc='A traffic simulation game exploring how small changes to roads affect everyone'
arch=('x86_64')
url='https://github.com/a-b-street/abstreet'
license=('Apache-2.0')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libxcb')
makedepends=('cargo' 'desktop-file-utils' 'git' 'python3' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("git+https://github.com/a-b-street/abstreet.git"
        "$_pkgname.sh"
        "$_pkgname.desktop")
b2sums=('SKIP'
        '8b43a3490b2234cfb742d333a1b66115836efb67c701fb97649d2701722426b333e1fdf0ff9b619e97f3c7dc616b66333c89a3f459a10182e21fe15461457680'
        '94d1d229d1ca5cbae5430d76960bc181c41218bbb683d1ba47d585b27a52479809de3a05200522cc52b11eb6e2efc4407b262150e3894838954a7de4e076b178')

pkgver() {
    printf "r%s.%s" "$(git -C ${_pkgname} rev-list --count HEAD)" "$(git -C ${_pkgname} rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo run --bin updater -- download --minimal
    cargo build --release
}

# Disabled until all test pass
#check() {
#    cd "$srcdir/$_pkgname"
#    CARGO_INCREMENTAL=0 cargo test --release
#}

package() {
    cd "$srcdir"
    install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
    desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" $_pkgname.desktop
    cd "$_pkgname"
    install -Dm644 data/system/assets/pregame/icon.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
    install -dm755 "$pkgdir/opt/$_pkgname/target"
    cp -dpr --no-preserve=ownership target/release "$pkgdir/opt/$_pkgname/target/release"
    cp -dpr --no-preserve=ownership data "$pkgdir/opt/$_pkgname/data"

    # Create data/player folder.
    # It goes in the games group (gid 50).
    install -dm775 -g 50 "$pkgdir/opt/$_pkgname/data/player"

    # Put main executable in games group (gid 50) and use setgid.
    # That way it can write to the data/player folder.
    # (Upstream should be changed to use something in homedir instead.
    # Then all this gid 50 rigamarole should be unnecessary.)
    chmod g+s "$pkgdir/opt/$_pkgname/target/release/game"
    chgrp 50 "$pkgdir/opt/$_pkgname/target/release/game"
}

