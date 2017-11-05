# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig'
pkgver='2.4.2'
pkgrel='2'
pkgdesc='High Perf CPU Miner'
arch=('any')
url="https://github.com/${pkgname}/${pkgname}"
depends=('libuv')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'libmicrohttpd')
conflicts=('xmrig-bin')
license=('GPL')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}.service"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2107c5ca279a1184d0052a9e4fce4d70f0472354807adb1faa1fd6ff3925cdac'
            '72ecbf76cde84bad7af3ed0af20d82223fb6ccb2de37f8a4ea90959200b1e605')
prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "src/config.json" "${pkgdir}/etc/${pkgname}/xmrig.conf"
  install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}
