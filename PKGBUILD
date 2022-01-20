# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Grey Christoforo <first name at last name dot net>
pkgname=wasm-bindgen-cli
pkgver=0.2.79
pkgrel=1
pkgdesc="Command line interface of the wasm-bindgen attribute and project."
arch=('x86_64')
url="https://github.com/rustwasm/wasm-bindgen"
license=('APACHE' 'MIT')
depends=('rust-wasm' 'nodejs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('17a4fcbd7cdd373f99282d82d1beea348e740f32eb5b4d92ae64c49343e9ff47')

prepare() {
    cd "wasm-bindgen-${pkgver}/crates/cli"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "wasm-bindgen-${pkgver}/crates/cli"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "wasm-bindgen-${pkgver}/crates/cli"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package(){
    cd "wasm-bindgen-${pkgver}/crates/cli"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "${pkgdir}/usr/bin/" {} \;
    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-MIT
    install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE-APACHE
}
# vim:set ts=4 sw=4 et:
