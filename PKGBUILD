# Maintainer: reakjra <reakjra@proton.me>
pkgname=omikuji-git
_pkgname=omikuji
pkgver=r0.0.0
pkgrel=1
pkgdesc='Qt/QML based wine apps launcher for Linux (development version)'
arch=('x86_64')
url='https://github.com/reakjra/omikuji'
license=('GPL-3.0-or-later')
options=('!lto' '!strip')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('qt6-base' 'qt6-declarative' 'qt6-svg')
makedepends=('rust' 'cargo' 'pkgconf' 'cmake' 'git' 'qt6-shadertools')
source=("$_pkgname::git+https://github.com/reakjra/omikuji.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/.cargo"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/.cargo"
    unset CFLAGS LTOFLAGS
    export CXXFLAGS="-Wno-sfinae-incomplete"
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/omikuji" "$pkgdir/usr/bin/omikuji"

    install -Dm644 "crates/omikuji/qml/icons/app.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/omikuji.png"

    sed "s|@EXEC_PATH@|/usr/bin/omikuji|" packaging/omikuji.desktop.in > omikuji.desktop
    install -Dm644 omikuji.desktop "$pkgdir/usr/share/applications/omikuji.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
