
pkgname=ripunzip
pkgver=2.0.3
pkgrel=1
pkgdesc="Extract zip files in parallel"
url=https://github.com/google/ripunzip
license=('MIT')
arch=('x86_64')
depends=(bzip2 gcc-libs glibc openssl xz)
makedepends=(rust pkgconf)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
source=("${pkgname}${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d44262d390dc3fa41b7de2e28a199aef4343c0197b5a1c9216e13b1aa0f0273f')

prepare(){
  cd ${pkgname}-$pkgver
  cargo fetch --locked --target $(rustc --print host-tuple)
}
unset prepare # DL larger crates

build(){
  cd ${pkgname}-$pkgver
  test ${RUSTC_BOOTSTRAP} = 1 && _cargoflags="-Zbuild-std=std,panic_abort -Zbuild-std-features=panic_immediate_abort"
  cargo build --release $_cargoflags #--frozen
}

package(){
  unset optdepends
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
