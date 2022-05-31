# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=httplz
_pkgname=http
pkgver=1.12.5
pkgrel=1
pkgdesc="Host These Things Please - a basic http server written in Rust"
arch=("x86_64" "i686" "armv6h" "armv7h" "aarch64")
url="https://github.com/thecoshman/http"
license=("MIT")
conflicts=("httplz-bin")
depends=("openssl" "bzip2")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('25cc6a542dac9d4cce8370cee49a71ab48db02a0706a7df92f1e3e0e8082db154d5e68224a23603b2143a087e86ce67383e55c66844e5cfd9fa340b5f4d80b38')

prepare() {
  cd ${_pkgname}-${pkgver}
  cargo update
  cargo fetch --locked --target="${CARCH}-unknown-linux-gnu"
}

build() {
  cd ${_pkgname}-${pkgver}
  # only build and install the `httplz` binary and exclude `http`
  # they are identical and `httplz` is significantly less likely to cause conflicts
  cargo build --release --frozen --all-features --target-dir="target" --bin="httplz"
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm755 target/release/httplz "${pkgdir}/usr/bin/httplz"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
