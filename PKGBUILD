pkgname=opencl-headers-git
pkgver=2021.06.30.3.g835558e
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
source=('git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-Headers/pull/178.diff'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  patch -d OpenCL-Headers -p1 -i "${srcdir}/178.diff"

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
