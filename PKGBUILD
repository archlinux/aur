# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig-amd'
pkgver='2.6.1'
pkgrel='1'
pkgdesc='High Perf CryptoNote GPU Miner (Monero, Aeon)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/xmrig/${pkgname}"
depends=('libuv' 'libmicrohttpd' 'ocl-icd')
makedepends=('cmake' 'libuv' 'libmicrohttpd' 'opencl-headers')
conflicts=('xmrig-amd-git')
license=('GPL')
backup=("etc/${pkgname}/xmrig.conf")
source=("${pkgname}.service"
	"${pkgname}.sysusers"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1760f6c025d38047d44ca38eaab2ba0e06cd99046d0786fed891d2215771298d'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6'
            'f078ac63d8eb4a2395b4962790ff78ba68d78667ce1021c50d5c6a6915368a2a')
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
