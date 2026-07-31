# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smyx-git
_pkgname=smyx
pkgver=0.2.7.r5.g2638e92
pkgrel=1
pkgdesc='Navidrome player for the terminal. With reactive themes.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/ayanchavand/Smyx'
license=('MIT')
makedepends=(
    'cargo'
    'git'
)
options=(
    !lto
    !debug
)
provides=('smyx')
conflicts=('smyx' 'smyx-bin')
source=("${_pkgname}-main::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 target/release/smyx "$pkgdir/usr/bin/smyx"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
