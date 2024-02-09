# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=cramino
pkgver=0.14.1
pkgrel=1
pkgdesc='A fast tool for BAM/CRAM quality evaluation of long reads. https://doi.org/10.1093/bioinformatics/btad311'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/cramino'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/cramino/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('57e15afb113808c327a4ec843ae1677f37c35f692e04927cfcc3823affac6cff')

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

