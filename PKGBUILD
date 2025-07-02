# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.11.0
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('APACHE' 'MIT')
depends=('openssl' 'lm_sensors')
optdepends=('ca-certificates: HTTPS requests')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('23c4b9d2e01018f8e98534e5f4d303f6c53b1aac972f14339b2f4f21331e08edfc13e32430566fddc9f00fef6751990a8dec22d7232dbf543520e04b5d0b4427')

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
