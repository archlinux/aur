pkgname=opencl-headers-git
pkgver=v2020.03.13.2.g9dde5da
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files. (GIT Version)'
arch=('any')
url='https://www.khronos.org/registry/cl/'
license=('custom:Khronos')
makedepends=('git'
             'python'
             )
provides=('opencl-headers')
conflicts=('opencl-headers')
source=('git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-Headers/pull/78.diff'
        )
sha256sums=('SKIP'
            'SKIP'
            'd999515f411313ac5b60fa1521f79ea61dea3c43c022046f21dedcfe07350575'
            )

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  patch -d OpenCL-Headers -p1 -i "${srcdir}/78.diff"
}

build() {
  cd build

  cmake ../OpenCL-Headers \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {

  make -C build DESTDIR="${pkgdir}" install

  install -D -m644 OpenCL-Headers/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"


  cd "${srcdir}/OpenCL-CLHPP"

  python gen_cl_hpp.py -i input_cl.hpp -o "${pkgdir}/usr/include/CL/cl.hpp"
  install -Dm644 include/CL/cl2.hpp "${pkgdir}/usr/include/CL/cl2.hpp"
}
