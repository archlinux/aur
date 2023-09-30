# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=opencl-headers-git
pkgver=2023.04.17.8.g1ebe961
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files. (GIT Version)'
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('apache')
makedepends=(
 'git'
 'python'
 'cmake'
)
provides=("opencl-headers=2:${pkgver}")
conflicts=('opencl-headers')
source=('git+https://github.com/KhronosGroup/OpenCL-Headers.git')
sha256sums=('SKIP')

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S OpenCL-Headers -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 OpenCL-Headers/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
