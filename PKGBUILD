# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig'
pkgver='5.6.0'
pkgrel='1'
pkgdesc='High Perf CryptoNote CPU and GPU (OpenCL, CUDA) miner.'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/${pkgname}/${pkgname}"
depends=('libuv' 'libmicrohttpd' 'openssl' 'hwloc')
makedepends=('cmake')
conflicts=('xmrig-bin')
license=('GPL')
backup=("etc/${pkgname}/${pkgname}.conf")
source=("${pkgname}.service"
	"${pkgname}.sysusers"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1c4fa2898b1252507e885c4bfa2d8d5b20bce2069cb5f703bb084066d560a770'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            'f81288f5183f9073f382b51e883309b89c32ea791f758a94fc4fe1600dde8001')
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
