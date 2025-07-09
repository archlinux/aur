# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=tatuin
pkgver=0.19.0
pkgrel=1
pkgdesc="Task Aggregator TUI for Obsidian, Todoist, Gitlab TODO and Github Issues"
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/panter-dsd/tatuin"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs' 'openssl')
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5bfacf4b8b76706b99b2f220d249e2e0bb41fd8afeed62a4607ce2acecc3bddc')

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
    install -Dm655 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
