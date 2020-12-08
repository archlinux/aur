pkgname=opencl-headers-git
pkgver=v2020.06.16.21.g3259391
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files. (GIT Version)'
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('apache')
makedepends=('git'
             'python'
             )
provides=('opencl-headers')
conflicts=('opencl-headers')
source=('git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'git+https://github.com/ThrowTheSwitch/CMock.git'
        'git+https://github.com/ThrowTheSwitch/Unity.git'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            )

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-ocl-headers build-ocl-hpp

  cd OpenCL-CLHPP
  git config submodule.external/CMock.url "${srcdir}/CMock"
  git config submodule.external/Unity.url "${srcdir}/Unity"

  git submodule update --init external/CMock external/Unity
}

build() {
  cd "${srcdir}/build-ocl-headers"

  cmake ../OpenCL-Headers \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make

  cd "${srcdir}/build-ocl-hpp"

  cmake ../OpenCL-CLHPP \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTS=OFF

  make
}

package() {

  make -C build-ocl-headers DESTDIR="${pkgdir}" install
  make -C build-ocl-hpp DESTDIR="${pkgdir}" install

  install -D -m644 OpenCL-Headers/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
