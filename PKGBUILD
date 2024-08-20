# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.22.0
_mover=1
_pkgtag="${_pkgver}-mo${_mover}"
pkgname="xmrig-mo-cuda"
pkgver="${_pkgver}mo${_mover}"
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.17.0' 'cuda>=11.8' 'nvidia-utils')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl')
license=('GPL')
source=("${url}/archive/v${_pkgtag}.tar.gz"
        "fix-cryptonight.patch")
sha256sums=('42f064c20758e58cc0bdc3ebbd0f32a739ebfd8594d7ffc7753be9091453b3ea'
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
