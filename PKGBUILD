# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.17.0
_mover=1
pkgname="${_pkgname/xmrig/xmrig-mo}"
pkgver="${_pkgver}mo${_mover}"
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.15.0' 'cuda>=8.0')
optdepends=('monero: wallet')
makedepends=('cmake' 'cuda>=8.0' 'git')
license=('GPL')
source=("git+${url}#tag=v${_pkgver}-mo${_mover}"
        'fix-compile.patch')
sha256sums=('SKIP'
            'd702dc516dc5b57c814d9ddeffb6df72b699891b2c0c50eb690f5a9dd1a3a77f')

prepare () {
  cd "${_pkgname}"

  patch -p1 < ${srcdir}/fix-compile.patch
}

build() {
  cd "${_pkgname}"

  cmake -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++ -S . -B build
  cmake --build build
}

package() {
  cd "${_pkgname}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
