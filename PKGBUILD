# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=cramino
pkgver=0.15.0
pkgrel=2
pkgdesc='A fast tool for BAM/CRAM quality evaluation of long reads. https://doi.org/10.1093/bioinformatics/btad311'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake' 'clang')
url='https://github.com/wdecoster/cramino'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/cramino/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('731d4232e8a5503f704825b04e8ff081294381a1324fec3e59771ca773c68465')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

