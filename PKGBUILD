pkgname=opencl-headers-git
pkgver=v2020.03.13.0.g9824efd
pkgrel=1
pkgdesc='OpenCL (Open Computing Language) header files'
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
        '47.diff'
#         'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-Headers/pull/47.diff'
        )
sha256sums=('SKIP'
            'SKIP'
            'f95005c505669a4cd0a89fbefdfe1364f8f758d3779d8b11b709f4e63a11d01c'
#             '2c30d8d34ae8f7583bca45cb829dc45f31a73c9d8ef9a4755d4e9c316250324b'
            )

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd OpenCL-Headers
  patch -p1 -i "${srcdir}/47.diff"
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

  # remove useless headers
  rm "${pkgdir}/usr/include/CL/"{cl_d3d,cl_dx9}*.h

  cd "${srcdir}/OpenCL-CLHPP"

  python gen_cl_hpp.py -i input_cl.hpp -o "${pkgdir}/usr/include/CL/cl.hpp"
  install -Dm644 include/CL/cl2.hpp "${pkgdir}/usr/include/CL/cl2.hpp"
}
