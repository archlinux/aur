# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.21.0
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.17.0' 'cuda>=11.8')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=11.8')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch')
sha256sums=('39fc4cc9ef3dab89fb0f3681e58c970edf72a6952df371d3b959744c2a578b43'
            'd702dc516dc5b57c814d9ddeffb6df72b699891b2c0c50eb690f5a9dd1a3a77f')

prepare () {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/fix-compile.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++ -S . -B build
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
