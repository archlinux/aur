# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=motus
pkgver=0.3.1
pkgrel=1
pkgdesc="A dead simple password generator"
arch=("i686" "x86_64" "aarch64")
license=("AGPL-3.0-only")
url="https://github.com/oleiade/motus"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('2c803838a5d8c1cd7f82a120c9d9a46db65fdee824e0cdd94c055902055a09bf')
prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
