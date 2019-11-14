# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=2.0.1.beta
_pkgver='2.0.1-beta'
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig' 'cuda>=10.1.105-6')
optdepends=('monero: wallet')
# We unfortunately need to be hard on which version of CUDA we use
makedepends=('cmake' 'openssl' 'cuda>=10.1.105-6')
license=('GPL')
changelog=CHANGELOG.md
source=("${url}/archive/v${_pkgver}.tar.gz")
sha256sums=('86d4ac08503fb9e5a40a6b54f0811f79a1915a06d3c3d249f7e1f9f95c0e39fb')

prepare() {
  cd "${pkgname}-${_pkgver}"

  # create build dir
  [ -d build ] || mkdir build
}

build() {
  cd "${pkgname}-${_pkgver}/build"

  # CUDA on ArchLinux uses GCC 8.0
  cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8 ..
  make
}

package() {
  cd "${pkgname}-${_pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
