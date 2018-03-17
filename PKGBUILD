# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-nvidia'
pkgver=2.5.0
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
sha256sums=('459c072f4aaf1c6eb0d35d14a2c7acdb62204bb249aba79f47853c5a3068bf17'
            '261a0ff3bf231aa7df694b9794a22defd3232df7ee1d6d5bcef29eda3a6dddf7')

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
