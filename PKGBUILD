# Maintainer: trbn1 <aur@trbn.me>
pkgname=maki
pkgver=0.4.4
pkgrel=1
pkgdesc='An efficient AI coding agent extendable by neovim like Lua plugins'
arch=('x86_64' 'aarch64')
url='https://github.com/tontinton/maki'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'zlib')
optdepends=('rtk: for reduced token consumption')
conflicts=('maki-bin')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ffea03a575ea6d5eb7c75c3271b859bff43dbbc705085cb294c6f55b6cfae17c')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
