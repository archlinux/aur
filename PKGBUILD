# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig'
pkgver='2.4.4'
pkgrel='2'
pkgdesc='High Perf CryptoNote CPU Miner (Monero, Aeon)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
depends=('libuv' 'libmicrohttpd')
makedepends=('cmake' 'libuv' 'libmicrohttpd')
conflicts=('xmrig-bin')
license=('GPL')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}.service"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2107c5ca279a1184d0052a9e4fce4d70f0472354807adb1faa1fd6ff3925cdac'
            '4ad514db6bbe214a9d4b9a01d1e4e5252a09554fa28c153dbdfa49a001090142')
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
}
