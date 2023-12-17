# Maintainer:  Giovanni Santini <giovannisantini93 AT yahoo.it>
# Contributor: Hans-Nikolai Viessmann <hans AT viess.mn>

_pkgname=xmrig-cuda
_pkgver=6.17.0
_mover=1
_pkgtag="${_pkgver}-mo${_mover}"
pkgname="${_pkgname/xmrig/xmrig-mo}"
pkgver="${_pkgver}mo${_mover}"
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner, MoneroOcean fork.'
arch=(x86_64)
url="https://github.com/MoneroOcean/${_pkgname}"
depends=('xmrig-mo>=6.17.0' 'cuda>=11.8')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl')
license=('GPL')
source=("${url}/archive/v${_pkgtag}.tar.gz"
        'fix-compile.patch::https://aur.archlinux.org/cgit/aur.git/plain/fix-compile.patch?h=xmrig-cuda'
        'fix-CUDA-12.0.patch::https://aur.archlinux.org/cgit/aur.git/plain/fix-CUDA-12.0.patch?h=xmrig-cuda'
        'fix-cryptonight.patch')
sha256sums=('65ad593e689a95af50ae385fbc7150cd5e69bd968e0098546a90ee447911d7c9'
            'd702dc516dc5b57c814d9ddeffb6df72b699891b2c0c50eb690f5a9dd1a3a77f'
            '0e92587fc966a550f6aab50aeec7c9c801ff77c22dd7f2845cf3d44e794375b2'
            '668a954c1c127652cf693c96d05b928bd0e3c1126afcff26e1168d59b19543d2')

prepare () {
  cd "${_pkgname}-${_pkgtag}"

  patch -p1 < ${srcdir}/fix-compile.patch
  patch -p1 < ${srcdir}/fix-CUDA-12.0.patch
  patch -p1 < ${srcdir}/fix-cryptonight.patch
}

build() {
  cd "${_pkgname}-${_pkgtag}"

  cmake -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++ -S . -B build
  cmake --build build
}

package() {
  cd "${_pkgname}-${_pkgtag}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
