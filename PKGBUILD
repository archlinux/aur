pkgname=opencl-headers-git
pkgver=2021.06.30.6.g1fc6fc1
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
  mkdir -p build

  # fix .cmake path
  sed 's|cmake/OpenCLHeaders|OpenCLHeaders/cmake|g' -i OpenCL-Headers/CMakeLists.txt
}

build() {
  cd "${srcdir}/build"

  cmake ../OpenCL-Headers \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  make
}

check() {
  (cd build; ctest --output-on-failure)
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 OpenCL-Headers/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
