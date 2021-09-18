# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.15.1
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.15.0' 'cuda>=8.0')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=8.0')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch')
sha256sums=('a966b865851861089cc98f6662bc0d573f20750eb0ba48c6b76b611d73f951e1'
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
