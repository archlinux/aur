# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>

pkgname='xmrig-nvidia'
pkgver=2.8.3
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled, donation percentage is 0.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
# We unfortunately need to be hard on which version of CUDA we use
depends=('libuv' 'cuda>=9.2.88.1-2')
optdepends=('monero: wallet')
makedepends=('cmake' 'libuv' 'cuda-toolkit')
license=('GPL')
install='xmrig-nvidia.install'
changelog=CHANGELOG.md
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('06dc0ef260feb96393441ec87f099b290ee19d7014f27ff7b416b32d2916e546')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  msg2 "Reseting donation level to zero"
  sed -i -e 's/constexpr const int kDefaultDonateLevel = 5;/constexpr const int kDefaultDonateLevel = 0;/g' \
         -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int kMinimumDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${pkgname}-${pkgver}/build"

  # the C/CXX flags are specific to CUDA 9/9.1 which has a hard dep on gcc7
  cmake -DWITH_HTTPD=OFF -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7 ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm775 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/xmrig-nvidia/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}
