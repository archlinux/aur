# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=maki
pkgver=0.7.0
pkgrel=1
pkgdesc='An efficient AI coding agent extendable by neovim like Lua plugins'
arch=('x86_64' 'aarch64')
url='https://github.com/tontinton/maki'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'zlib')
optdepends=('rtk: for reduced token consumption')
conflicts=('maki-bin')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
            "${pkgname}-pr1287.patch::https://patch-diff.githubusercontent.com/raw/tontinton/maki/pull/1287.patch")
sha256sums=('d05cdacd78963fb490aa4ac7c0ed0494177176577d191460177ec6ee0d08eea3'
            '3de8aeb4c5f2c6ff64cccd9adc5f63c558fb731f5aebf3f07af20a6e6ba47f18')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/${pkgname}-pr1287.patch"
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
