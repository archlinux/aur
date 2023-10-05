# Maintainer: Florian Wickert <FlorianWickert@gmail.com>
pkgname=minmon
pkgver=0.6.0
pkgrel=1
pkgdesc="An opinionated minimal monitoring and alarming tool."
arch=('any')
url="https://github.com/flo-at/minmon"
license=('APACHE' 'MIT')
depends=('openssl' 'lm_sensors')
optdepends=('ca-certificates: HTTPS requests')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e3361bbfed039851a7648ce53aa6e3a8617c394b320c1bbbaa651b175573e393e8a4ad8781009c38da255fb05d4acc98b012c56089ef0e5d93cab9472d5bdee1')

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
