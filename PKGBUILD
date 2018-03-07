# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-nvidia'
pkgver=2.4.5
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda>=9')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'cuda-toolkit')
license=('GPL')
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/xmrig/xmrig-nvidia/v${pkgver}/README.md")
sha256sums=('b8865a332c5202031c56141a4b0ae4d2034c4998923749a0d68f2a2f16af9b49'
            'a202320bf2916f44813dd217d8ba0930fe062e3ec8b2492b2e6ee562039c2b8a')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  sed -i -e 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${pkgname}-${pkgver}/build"

  # the C/CXX flags are specific to CUDA 9/9.1 which has a hard dep on gcc6
  cmake -DWITH_HTTPD=OFF -DCMAKE_C_COMPILER=gcc-6 -DCMAKE_CXX_COMPILER=g++-6 ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/xmrig-nvidia/config.json.example"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}
