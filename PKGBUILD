
pkgname=khronos-ocl-icd-git
pkgver=v2020.03.13.0.gc7fda8b
pkgrel=2
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
            '8bb92b19cc37f44c36f17b1a2f498e85c7fc2b7d612b1089ddefcea5104bc3dd'
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
