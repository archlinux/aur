# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=sctd
pkgver=0.4.0
pkgrel=1
pkgdesc="A daemon to change the display color temperature based on time of day"
url="https://github.com/amir/sctd"
arch=(x86_64 i686)
license=(custom)
depends=(gcc-libs libx11 libxrandr)
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amir/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('f281dbccee7fd187333259049d7b39be41a1c6fc62a5dbccbcc49cdef95884e963c0747fce49502a2bb6d57f574e255896543a6cfb4cdcbd2ba3c70371b8d8de')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/$pkgname -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
