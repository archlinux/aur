# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.17.0
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.17.0' 'cuda>=11.8')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=11.8')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch'
        'fix-CUDA-12.0.patch')
sha256sums=('662979cfd99c5550024e4ed8384238f5bf971c1939968a85f829043af6225f64'
            'd702dc516dc5b57c814d9ddeffb6df72b699891b2c0c50eb690f5a9dd1a3a77f'
            '0e92587fc966a550f6aab50aeec7c9c801ff77c22dd7f2845cf3d44e794375b2')

prepare () {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/fix-compile.patch
  patch -p1 < ${srcdir}/fix-CUDA-12.0.patch
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
