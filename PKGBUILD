
pkgname=ripunzip
pkgver=2.0.4
pkgrel=4
pkgdesc="Extract zip files in parallel"
url=https://github.com/GoogleChrome/ripunzip
license=('MIT')
arch=('x86_64')
depends=(bzip2 libgcc glibc xz)
makedepends=(rust pkgconf)
source=("${pkgname}${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b485dc58777fb8637ff0509c72dc6b50235f6a01fecbf382365437be704a8468')

prepare(){
  cd ${pkgname}-$pkgver
  # cargo fetch --locked --target host-tuple #DL larger crates
  sed -i "/^rust-version/d" Cargo.toml
  cargo remove reqwest
  cargo add reqwest --no-default-features --features blocking,rustls
}

build(){
  cd ${pkgname}-$pkgver
  export RUSTFLAGS+=" -C force-unwind-tables=no ${RUSTFLAGS}"
  test ${RUSTC_BOOTSTRAP} = 1 && test -e /usr/lib/rustlib/src/rust/library/Cargo.toml && _cargoflags='-Zbuild-std=std,panic_abort --config=profile.release.panic="immediate-abort" -Zpanic-immediate-abort'
  cargo build --release $_cargoflags #--frozen
}

package(){
  unset optdepends
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/${pkgname}
}
