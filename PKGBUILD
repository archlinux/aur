# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.22.0
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.17.0' 'cuda>=12.5')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=12.5')
license=('GPL-3.0-or-later')
source=("${url}/archive/v${pkgver}.tar.gz"
        'fix-compile.patch')
sha256sums=('77c541a0e73764bd9a25f9f296ec03aa22492f79b89831d95be4c6265ba54ae6'
            '0f9b42a4eaa9ced9417443dff1ac95574e807a17a2072b9d7e726fe7977997ee')

prepare () {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ${srcdir}/fix-compile.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_POLICY_DEFAULT_CMP0146=OLD -DCMAKE_CXX_FLAGS="-ffat-lto-objects" -DCMAKE_C_COMPILER=/usr/bin/gcc-13 -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 -S . -B build
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
