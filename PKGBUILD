
pkgname=khronos-ocl-icd-git
pkgver=2020.06.16.33.g34ef50a
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
        '115.diff' # reference rebased: 'https://patch-diff.githubusercontent.com/raw/KhronosGroup/OpenCL-ICD-Loader/pull/115.diff'
         )
sha256sums=('SKIP'
            '3af74c2df1a00761e842cf68364c4e5ae4ef69c810e438cd4091ce95d03251b2'
            )

pkgver() {
  cd ocl
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
  patch -d ocl -p1 -i "${srcdir}/115.diff"
}

build() {
  cd build
  cmake ../ocl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
