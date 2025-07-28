# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=motus
pkgver=0.4.0
pkgrel=1
pkgdesc="A dead simple password generator"
arch=("i686" "x86_64" "aarch64")
license=("AGPL-3.0-only")
url="https://github.com/oleiade/motus"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha256sums=('eaa547e0821906cba7553ff7a51309cc39d450b215748a907bd7db1614ce0c85')
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
