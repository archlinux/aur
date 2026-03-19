# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=alevin-fry
pkgver=0.12.0
pkgrel=1
pkgdesc='A suite of tools for the rapid, accurate and memory-frugal processing single-cell and single-nucleus sequencing data'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake')
url='https://alevin-fry.readthedocs.io/en/latest/'
license=('BSD-3-Clause')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/COMBINE-lab/alevin-fry/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('bc77b729570c6613b14402820a517c188425a573d908ef9cb25d3a4b5bf91060')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$(rustc -vV | sed -n 's/host: //p')"
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
