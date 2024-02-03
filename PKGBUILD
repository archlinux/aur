# Maintainer: Natty4 <natty.sh.git at gmail dot com>
pkgname="dfmd-git"
pkgver=v0.1.0.r0.g62fd5d9
pkgrel=1
pkgdesc="A configurable handler for file manager DBus activities"
arch=("x86_64")
license=("GPL-3.0-or-later")
url="https://github.com/AMNatty/dfmd"
source=("${pkgname}::git+${url}?signed")
validpgpkeys=('4F9434A2EAC21BEC148F3656BF6CB659ADEE60EC')
sha1sums=('SKIP')
makedepends=("cargo" "git")
depends=("dbus")
optdepends=("xdg-utils: default open actions")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname/target/release/dfmd" "$pkgdir/usr/bin/dfmd"
    install -Dm644 "$srcdir/$pkgname/LICENSE.MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MIT"
    install -Dm644 "$srcdir/$pkgname/LICENSE.GPLv3" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPLv3"
    install -Dm644 "$srcdir/$pkgname/org.freedesktop.FileManager1.service" "$pkgdir/usr/share/dbus-1/services/sh.natty.FileManager1.service"
}
