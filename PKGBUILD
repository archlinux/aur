# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='xmrig-amd'
pkgver='2.8.1'
pkgrel='1'
pkgdesc='High Perf CryptoNote GPU Miner (Monero, Aeon)'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/xmrig/${pkgname}"
depends=('libuv' 'libmicrohttpd' 'ocl-icd' 'openssl')
makedepends=('cmake' 'opencl-headers')
conflicts=('xmrig-amd-git')
license=('GPL')
backup=("etc/${pkgname}/xmrig.conf")
source=("${pkgname}.service"
	"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('6b1914975f93842fd564b7b4b6ee73b93942c154aebfb5f18e3a2d100041832b'
            'c98a39ab8c05d53e186ea9c9df3f3ee2c304884889b422a3b6ce105a00d3b96e')
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
