# Maintainer: trbn1 <aur@trbn.me>
pkgname=maki
pkgver=0.4.1
pkgrel=1
pkgdesc='An efficient AI coding agent extendable by neovim like Lua plugins'
arch=('x86_64' 'aarch64')
url='https://github.com/tontinton/maki'
license=('MIT')
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'zlib')
conflicts=('maki-bin')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84ece23bd235d3e5cc9e8e56d0450febc19d2c75c0a44adbf6aa22345904188a')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
