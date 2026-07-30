# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=usbtree-git
_pkgname=usbtree
pkgver=0.1.0.r3.g26a20ba
pkgrel=1
pkgdesc='Live USB device tree in your terminal.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/gnomeria/usbtree'
license=(
    'MIT'
)
makedepends=(
    'cargo'
    'git'
    'pkgconf'
    'openssl'
    'libgit2'
)
options=(
    !lto
    !debug
    !strip
)
provides=('usbtree')
conflicts=('usbtree' 'usbtree-bin')
source=("${_pkgname}-main::git+$url.git#branch=main")
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
    install -Dm0755 target/release/usbtree "$pkgdir/usr/bin/usbtree"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
