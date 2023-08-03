# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.5.8
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('APACHE' 'MIT')
depends=('openssl' 'lm_sensors')
optdepends=('ca-certificates: HTTPS requests')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c494c83145b81d693f0159ba631b0db24cfd0a8a7b97d140a9961e144b882373b8cedcc8b09029b7adead85c25bc1f85dd250a9a3f51a5cd70602697bd5ef98a')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked --features full
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --release --locked --features full
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm 644 systemd.minmon.service $pkgdir/usr/lib/systemd/system/minmon.service
}
