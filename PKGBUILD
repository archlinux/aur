# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
pkgname=mazter
pkgver=1.0.0
pkgrel=1
pkgdesc="Mazes in your terminal"
arch=('x86_64')
url="https://github.com/canop/${pkgname}"
license=(MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=(${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate)
sha512sums=('024b496104ee393ea175523bef74578d627530a98a603eab013b1ca1567f3317c567da426e561656c8f7ee243a7e4298fb0766914be73146752ed2405935086c')

prepare() {
  cd ${pkgname}-${pkgver}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd ${pkgname}-${pkgver}
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd ${pkgname}-${pkgver}
  cargo test --frozen --all-features
}

package() {
  cd ${pkgname}-${pkgver}
  install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
