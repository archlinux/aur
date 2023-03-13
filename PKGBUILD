# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.5.2
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('MIT')
depends=('openssl' 'lm_sensors')
optdepends=('ca-certificates: HTTPS requests')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('de9b1868c81dc1018e504656893388960a2a5820d5ac128538b00e1289d4e44955e4308029bdc4b3843f6afc42ebebdaabd7c959017fe850d323b92687d52c8b')

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
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 systemd.minmon.service $pkgdir/usr/lib/systemd/system/minmon.service
}
