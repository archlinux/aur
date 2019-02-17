# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-proxy'
pkgver=2.12.0
pkgrel=1
pkgdesc='Stratum protocol proxy for Monero, Electroneum, Sumokoin and AEON pools; HTTP API disabled, donation percentage is 0.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-proxy'
depends=('libuv')
makedepends=('cmake' 'libuv')
optdepends=('monero: wallet')
license=('GPL')
install="${pkgname}.install"
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('12499d05027ccf9081e764d85debc3153944f54a71abbb0096c1136b71b4bc53')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  msg2 "Resetting donation level to zero"
  sed -i -e 's/constexpr const int kDefaultDonateLevel = 2;/constexpr const int kDefaultDonateLevel = 0;/g' src/donate.h

  # fix build problem relating to https://github.com/xmrig/xmrig-proxy/issues/295
  msg2 "Fix CMakeLists.txt"
  sed -i -e 's/set(EXTRA_LIBS pthread uuid\.a rt dl)/set(EXTRA_LIBS pthread uuid rt dl)/' CMakeLists.txt
}

build() {
  cd "${pkgname}-${pkgver}/build"

  cmake -DWITH_HTTPD=OFF ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
