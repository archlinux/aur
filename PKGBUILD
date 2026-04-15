# Maintainer: Guru <anjanaya@gmail.com>
pkgname=rpg
pkgver=0.11.0
pkgrel=1
pkgdesc="Modern Postgres terminal written in Rust with built-in DBA diagnostics and AI assistant"
arch=('x86_64')
url="https://github.com/NikolayS/rpg"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
provides=('rpg')
conflicts=('rpg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/NikolayS/rpg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bd3d300d14928c0b856a06db1cebe55d73a3cc5fdc58efce281a00819e826bf')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Unset C flags to prevent makepkg's -O2 from overriding
    # aws-lc-sys's required -O0 for jitterentropy
    unset CFLAGS CXXFLAGS LDFLAGS
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/rpg" "${pkgdir}/usr/bin/rpg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
