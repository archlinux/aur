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
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd OpenCL-Headers
  echo "$(git describe --long --tags | tr - .)"
}

package() {
  cd "${srcdir}/OpenCL-Headers"

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for i in $(find CL -type f); do
    install -Dm644 ${i} "${pkgdir}/usr/include/${i}"
  done

  # remove useless headers
  rm "${pkgdir}/usr/include/CL/"{cl_d3d,cl_dx9}*.h

  cd "${srcdir}/OpenCL-CLHPP"

  python gen_cl_hpp.py -i input_cl.hpp -o "${pkgdir}/usr/include/CL/cl.hpp"
  install -Dm644 include/CL/cl2.hpp "${pkgdir}/usr/include/CL/cl2.hpp"
}
