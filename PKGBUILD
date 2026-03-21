# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=alevin-fry
pkgver=0.13.0
pkgrel=1
pkgdesc='A suite of tools for the rapid, accurate and memory-frugal processing single-cell and single-nucleus sequencing data'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake')
url='https://alevin-fry.readthedocs.io/en/latest/'
license=('BSD-3-Clause')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/COMBINE-lab/alevin-fry/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('d9cefde417305388c8af08d13d3bf39ef4bf765b3c3ed9548c1d4b04722669f6')

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
