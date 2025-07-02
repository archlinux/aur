# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.22.1
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.17.0' 'cuda<12.9')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda<12.9')
license=('GPL-3.0-or-later')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch')
sha256sums=('0fb1312f000a172fc84191bc260005a801043c61c450db20c08848bda34ce11d'
            '0f9b42a4eaa9ced9417443dff1ac95574e807a17a2072b9d7e726fe7977997ee')

prepare () {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/fix-compile.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_POLICY_DEFAULT_CMP0146=OLD -DCMAKE_CXX_FLAGS="-ffat-lto-objects" -DCMAKE_C_COMPILER=${NVCC_CCBIN/g++/gcc} -DCMAKE_CXX_COMPILER=${NVCC_CCBIN} -S . -B build
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
