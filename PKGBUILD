
pkgname=ripunzip
pkgver=2.0.4
pkgrel=2
pkgdesc="Extract zip files in parallel"
url=https://github.com/google/ripunzip
license=('MIT')
arch=('x86_64')
depends=(bzip2 gcc-libs glibc openssl xz)
makedepends=(rust pkgconf mold)
optdepends=("rust-src: optimize with RUSTC_BOOTSTRAP=1")
source=("${pkgname}${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b485dc58777fb8637ff0509c72dc6b50235f6a01fecbf382365437be704a8468')

prepare(){
  cd ${pkgname}-$pkgver
  cargo fetch --locked --target $(rustc --print host-tuple)
}
unset prepare # DL larger crates

build(){
  cd ${pkgname}-$pkgver
  export RUSTFLAGS="-C force-unwind-tables=no ${RUSTFLAGS} -C link-arg=-fuse-ld=mold"
  test ${RUSTC_BOOTSTRAP} = 1 && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags #--frozen
}

package(){
  unset optdepends
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
