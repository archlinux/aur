# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=zeitfetch
pkgver=0.1.16
pkgrel=1
pkgdesc="A neofetch implementation in Rust aiming to be near instantaneous, with the least amount of dependencies possible"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=("MIT")
url="https://github.com/nidnogg/zeitfetch"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
conflicts=('zeitfetch-git')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dfdfb0eb37b8b305b3964338a72b6171aa6bea6a2269170ddeefbec465e418c0')

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
