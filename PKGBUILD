# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-nvidia'
pkgver=2.5.2
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled, donation percentage is 0.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda>=9')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'cuda-toolkit')
license=('GPL')
install='xmrig-nvidia.install'
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5a8290cafdbf92ad1f16d45d6a385ef8e278f8a21cfd6a522a3074b2c2ba984d')

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
  install -Dm644 README.md "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}
