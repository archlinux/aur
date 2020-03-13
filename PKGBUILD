
pkgname=khronos-ocl-icd-git
pkgver=v2020.03.13.0.gc7fda8b
pkgrel=1
pkgdesc="Khronos Group OpenCL 1.2 installable client driver (ICD) loader"
arch=('x86_64')
url="http://www.khronos.org/registry/cl"
license=('custom:Khronos')
makedepends=('git'
             'cmake'
             'mesa'
             'opencl-headers-git'
             )
depends=('glibc')
provides=('libcl'
          'opencl-icd-loader'
          'ocl-icd'
          )
conflicts=('libcl'
           'opencl-icd-loader'
           'ocl-icd'
           )
source=('ocl::git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git'
        '66.diff'
#         'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-ICD-Loader/pull/66.diff'
         )
sha256sums=('SKIP'
            'eeff2a8cb94d3ce7a5cc6e4440c28e6ea8359201d8fa8dcdbc1c28cea6f39045'
#             'c8001f51719e0d12d2f9c7f1c760a35d0920e81d05f119da813e0fb2be07f10a'
            )

pkgver() {
  cd ocl
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  patch -d ocl -p1 -i "${srcdir}/66.diff"
}

build() {
  cd build
  cmake ../ocl \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
