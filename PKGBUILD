# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=nnd-git
_pkgname=nnd
pkgver=0.77.r0.g2f14def
pkgrel=1
pkgdesc='A debugger for Linux'
arch=(
    'x86_64' 
    'aarch64' 
    'riscv64'
)
url='https://github.com/al13n321/nnd'
license=('Apache-2.0')
depends=(
    'glibc'
    'libgcc'
)
makedepends=(
    'cargo'
    'git'
)
options=(!lto)
provides=('nnd')
conflicts=(
    'nnd'
    'nnd-bin'
)
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/nnd "$pkgdir/usr/bin/nnd"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
