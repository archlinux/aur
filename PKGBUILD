# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig'
pkgver='2.5.2'
pkgrel='1'
pkgdesc='High Perf CryptoNote CPU Miner (Monero, Aeon)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
depends=('libuv' 'libmicrohttpd')
makedepends=('cmake' 'libuv' 'libmicrohttpd')
conflicts=('xmrig-bin')
license=('GPL')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}.service"
	"${pkgname}.sysusers"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0559837edbe069158909c8379041c01d9e98fb2ec4a62d3fa26b95741b463275'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            '809592cd70335e7984a16738b435e9a08071bda938b251c48258a8f946f0bdb3')
prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. \
    -DCMAKE_C_COMPILER=gcc \
    -DCMAKE_CXX_COMPILER=g++ \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "src/config.json" "${pkgdir}/etc/${pkgname}/xmrig.conf"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm0644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
