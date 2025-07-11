# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.22.1
_mover=1
_pkgtag="${_pkgver}-mo${_mover}"
pkgname="xmrig-mo-cuda"
pkgver="${_pkgver}mo${_mover}"
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.17.0' 'cuda>=11.8' 'nvidia-utils' 'gcc13-libs')
makedepends=('cmake' 'gcc13' 'openssl')
optdepends=('monero: wallet')
license=('GPL-3.0-only')
source=("${url}/archive/v${_pkgtag}.tar.gz"
        "fix-cryptonight.patch")
sha256sums=('cb876f936dc1d10e4b84877290db6bee39dca12ab777354b01a2d5b915a63a0d'
            '668a954c1c127652cf693c96d05b928bd0e3c1126afcff26e1168d59b19543d2')

prepare () {
  cd "${_pkgname}-${_pkgtag}"

  patch -Np1 -i "${srcdir}/fix-cryptonight.patch"

  cmake \
    -DCMAKE_C_COMPILER=gcc-13 \
    -DCMAKE_CXX_COMPILER=g++-13 \
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
