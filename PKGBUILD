# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=opencl-clhpp-git
pkgver=2022.05.18.0.g0af4767
pkgrel=1
pkgdesc='OpenCLTM API C++ bindings. (GIT Version)'
arch=('any')
url='http://khronosgroup.github.io/OpenCL-CLHPP'
license=('apache')
makedepends=('git'
             'python'
             'cmake'
             'ruby'
             'doxygen'
             )
provides=('opencl-clhpp')
conflicts=('opencl-clhpp')
source=(
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'git+https://github.com/ThrowTheSwitch/CMock.git'
        'git+https://github.com/ThrowTheSwitch/Unity.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            )

pkgver() {
  cd OpenCL-CLHPP
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  # fix .cmake path
  sed 's|cmake/OpenCLHeadersCpp|OpenCLHeadersCpp/cmake|g' -i OpenCL-CLHPP/CMakeLists.txt

  # fix output docs
  sed -e "s|OUTPUT_DIRECTORY       =|& \"${pkgdir}/usr/share/doc/OpenCL-CLHPP\"|g" \
      -e "s|/include|${srcdir}/OpenCL-CLHPP/include|g" \
    -i OpenCL-CLHPP/docs/Doxyfile.in

  cd OpenCL-CLHPP
  git config submodule.external/CMock.url "${srcdir}/CMock"
  git config submodule.external/Unity.url "${srcdir}/Unity"
  git -c protocol.file.allow=always submodule update --init external/CMock external/Unity

  cd external/CMock
  git config submodule.vendor/unity.url "${srcdir}/Unity"
  git -c protocol.file.allow=always submodule update --init vendor/unity

}

build() {
  cmake -S OpenCL-CLHPP -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DOPENCL_CLHPP_BUILD_TESTING=ON \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  (cd build; ctest --output-on-failure)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -d "${pkgdir}/usr/share/doc/OpenCL-CLHPP"
  (cd build/docs; doxygen -u)
  cmake --build build --target docs
  install -Dm644 OpenCL-CLHPP/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
