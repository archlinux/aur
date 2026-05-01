# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ratatui-gamepad-tester-git
_pkgname=ratatui-gamepad-tester
pkgver=0.1.1.r0.gf1ae2de
pkgrel=1
pkgdesc='TUI app for visualizing gamepad input'
arch=('x86_64' 'aarch64')
url='https://github.com/sermuns/ratatui-gamepad-tester'
license=('GPL-3.0')
makedepends=('cargo' 'git')
provides=('ratatui-gamepad-tester')
conflicts=('ratatui-gamepad-tester' 'ratatui-gamepad-tester-bin')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/ratatui-gamepad-tester "$pkgdir/usr/bin/ratatui-gamepad-tester"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
