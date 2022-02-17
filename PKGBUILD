# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=khronos-ocl-icd-git
pkgname=('khronos-ocl-icd-git'
         'lib32-khronos-ocl-icd-git'
        )
pkgver=2022.01.04.2.gcd7d07c
pkgrel=1
arch=('x86_64')
url="http://www.khronos.org/registry/cl"
license=('apache')
makedepends=('git'
             'cmake'
             'opencl-headers-git'
             'lib32-gcc-libs'
             )
source=('ocl::git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd ocl
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  # fix .cmake path
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i ocl/CMakeLists.txt
}

build() {
  cmake -S ocl -B build64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build64

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -S ocl -B build32 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_TESTING=ON

  cmake --build build32
}

check() {
  (cd build64; OCL_ICD_FILENAMES="$(pwd)/libOpenCLDriverStub.so" ctest)
  (cd build32; OCL_ICD_FILENAMES="$(pwd)/libOpenCLDriverStub.so" ctest)
}

package_khronos-ocl-icd-git() {
pkgdesc="Khronos Group OpenCL installable client driver (ICD) loader. (GIT Version)"
depends=('glibc')
provides=('khronos-ocl-icd'
          'opencl-icd-loader'
          'ocl-icd'
          )
conflicts=('khronos-ocl-icd'
           'opencl-icd-loader'
           'ocl-icd'
           )
  DESTDIR="${pkgdir}" cmake --build build64 --target install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-khronos-ocl-icd-git() {
pkgdesc="Khronos Group OpenCL installable client driver (ICD) loader. (GIT Version) (32-bits)"
depends=('lib32-glibc')
provides=('lib32-lib32-khronos-ocl-icd'
          'lib32-opencl-icd-loader'
          'lib32-ocl-icd'
          )
conflicts=('lib32-khronos-ocl-icd'
           'lib32-opencl-icd-loader'
           'lib32-ocl-icd'
           )
   DESTDIR="${pkgdir}" cmake --build build32 --target install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
