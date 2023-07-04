# Maintainer: Hans-Nikolai Viessmann <hand AT viess DOT mn>

pkgname='xmrig-proxy'
pkgver=6.20.0
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
sha256sums=('7e1d18b058eb272ec08f1e67cd5ec84a0c6d4a66be3e8c7c6e1115ef3b759832')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  echo "==> Resetting donation level to zero"
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
