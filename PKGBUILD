# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.12.0
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('APACHE' 'MIT')
depends=('openssl' 'lm_sensors')
optdepends=('ca-certificates: HTTPS requests')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('5564597f8e730908946ef1c1a18758ee92e097122b2de0a012decc1c4106b88babeda22a6892e0e8c2b6d0d36ea50f950c4de2f6deb96c2a5ae1339a7877317b')

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
