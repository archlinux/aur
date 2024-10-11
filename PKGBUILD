# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com
pkgname=zeitfetch
pkgver=0.1.13
pkgrel=1
pkgdesc="A neofetch implementation in Rust aiming to be near instantaneous, with the least amount of dependencies possible"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=("MIT")
url="https://github.com/nidnogg/zeitfetch"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
conflicts=('zeitfetch-git')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2338aa9353b4e2cdbfc596c61733b9b860b7dec648be2496963c63331c981f2f')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
