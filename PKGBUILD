# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.21.1
_mover=1
_pkgtag="${_pkgver}-mo${_mover}"
pkgname="${_pkgname/xmrig/xmrig-mo}"
pkgver="${_pkgver}mo${_mover}"
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.17.0' 'cuda>=11.8')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl')
license=('GPL')
source=("${url}/archive/v${_pkgtag}.tar.gz"
        "fix-cryptonight.patch")
sha256sums=('c7094401010146565650e4a76c3b89aeee47f73cf918ec4dedf5598b0c7396ab'
            '668a954c1c127652cf693c96d05b928bd0e3c1126afcff26e1168d59b19543d2')

prepare () {
  cd "${_pkgname}-${_pkgtag}"

  patch -p1 < ${srcdir}/fix-cryptonight.patch

  cmake \
    -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc \
    -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++ \
    -S . -B build
}

build() {
  cd "${_pkgname}-${_pkgtag}"

  cmake --build build
}

package() {
  cd "${_pkgname}-${_pkgtag}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
