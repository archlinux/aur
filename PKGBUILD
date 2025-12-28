# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.22.1
pkgrel=3
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.17.0' 'cuda>=13')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=13')
license=('GPL-3.0-or-later')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch')
sha256sums=('0fb1312f000a172fc84191bc260005a801043c61c450db20c08848bda34ce11d'
            '58be1501e03a2de3ae2f0bb158a8f49b1c7743cb6fd488391a8b73facb574635')

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
