# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=opencl-headers-git
pkgver=2022.05.18.1.g7f216e8
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files. (GIT Version)'
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('apache')
makedepends=('git'
             'python'
             'cmake'
             'ruby'
             'doxygen'
             )
provides=('opencl-headers')
conflicts=('opencl-headers')
source=('git+https://github.com/KhronosGroup/OpenCL-Headers.git')
sha256sums=('SKIP')

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  # fix .cmake path
  sed 's|cmake/OpenCLHeaders|OpenCLHeaders/cmake|g' -i OpenCL-Headers/CMakeLists.txt
}

build() {
  cmake -S OpenCL-Headers -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  (cd build; ctest --output-on-failure)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 OpenCL-Headers/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
