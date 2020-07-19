# Maintainer: Hans-Nikolai Viessmann <hand AT viess.mn>

pkgname='xmrig-proxy'
pkgver=6.3.0
pkgrel=1
pkgdesc='Stratum protocol proxy for Monero; HTTP API disabled, donation percentage is 0.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-proxy'
depends=('libuv')
makedepends=('cmake' 'libuv')
optdepends=('monero: XMR wallet'
            'xmrig: XMR CPU miner')
license=('GPL')
install="${pkgname}.install"
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('277af6bc19143b66d99e133ce86b72f2883b65dc6fc8c3408c9ec4fee5b1bdd7')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  msg2 "Resetting donation level to zero"
  sed -i -e 's/constexpr const int kDefaultDonateLevel = 2;/constexpr const int kDefaultDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${pkgname}-${pkgver}/build"

  cmake -DWITH_HTTP=OFF ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/${pkgname}/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
