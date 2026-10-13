# Maintainer: mestik78 <https://github.com/Mestik78>
pkgname=hyprgrid
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-fast 3D workspace grid manager for Hyprland (Monitor × Row × Column)"
arch=('x86_64')
url="https://github.com/Mestik78/hyprgrid"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mestik78/hyprgrid/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0000edfc6d1cd4a542e93aefd4fe96198113e8e8b84dd04201efd8254edaa0a0')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/hyprgrid "${pkgdir}/usr/bin/hyprgrid"
    install -Dm644 hyprgrid.example.toml "${pkgdir}/usr/share/hyprgrid/config.example.toml"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
