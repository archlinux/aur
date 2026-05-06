# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ratherapia-git
_pkgname=ratherapia
pkgver=0.1.1.r0.ge7e4f0c
pkgrel=1
pkgdesc='blends ambient sound, rain textures, reactive terminal particles, and an optional inline 3D rat scene into a quiet TUI instrument.'
arch=('x86_64' 'aarch64')
url='https://github.com/ozzyocak/ratherapia'
license=('MIT')
makedepends=('cargo' 'git')
provides=('ratherapia')
conflicts=('ratherapia-git')
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
    install -Dm0755 target/release/ratherapia "$pkgdir/usr/bin/ratherapia"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
