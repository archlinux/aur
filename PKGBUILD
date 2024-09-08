# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=sctd
pkgver=0.3.0
pkgrel=1
pkgdesc="A daemon to change the display color temperature based on time of day"
url="https://github.com/amir/sctd"
arch=(x86_64 i686)
license=(custom)
depends=(gcc-libs libx11 libxrandr)
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amir/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('5f2c8da707462c23bd32da2de3e527304bcf31f5aac841babb64853b38d4971656a9edefb7fdc5e63ef33cbeefc84e17fcb10ce26b514c4ac7b309326b210efa')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
