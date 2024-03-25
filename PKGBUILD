# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.21.1
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
sha256sums=('985ad8ce33df1f2572d0a5a62e48cc0f03457614db8d563dc42613119ebb32d7'
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
