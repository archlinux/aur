# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=cramino
pkgver=1.0.0
pkgrel=1
pkgdesc='A fast tool for BAM/CRAM quality evaluation of long reads. https://doi.org/10.1093/bioinformatics/btad311'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake' 'clang')
url='https://github.com/wdecoster/cramino'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/cramino/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('70b577982955cc8a736f07fe92e4ddb0855676ff9b98e7380c78aac67a7309f8')

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

