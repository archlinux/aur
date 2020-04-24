
pkgname=khronos-ocl-icd-git
pkgver=v2020.03.13.4.gfe09ad1
pkgrel=1
pkgdesc="Khronos Group OpenCL 1.2 installable client driver (ICD) loader. (GIT Version)"
arch=('x86_64')
url="http://www.khronos.org/registry/cl"
license=('apache')
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
        'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-ICD-Loader/pull/95.diff'
         )
sha256sums=('SKIP'
            '41e3ad1c87e0d278853453fb4b0b13160e1d969ca945342e7f720df4c11d3dfa'
            )

pkgver() {
  cd ocl
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
  patch -d ocl -p1 -i "${srcdir}/95.diff"
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
