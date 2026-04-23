# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=classfi-git
_pkgname=classfi
pkgver=0.1.1.r0.g2efaa3f
pkgrel=1
pkgdesc='A simple classical music player'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/carmiac/classfi'
license=('GPL-3.0')
depends=('mpv')
makedepends=('cargo' 'git')
provides=('classfi')
conflicts=('classfi' 'classfi-bin')
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
    install -Dm0755 target/release/classfi "$pkgdir/usr/bin/classfi"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
