# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=khronos-ocl-icd-git
pkgname=('khronos-ocl-icd-git'
         'lib32-khronos-ocl-icd-git'
        )
pkgver=2022.01.04.1.gb7a648b
pkgrel=1
arch=('x86_64')
url="http://www.khronos.org/registry/cl"
license=('apache')
makedepends=('git'
             'cmake'
             'opencl-headers-git'
             )
source=('ocl::git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git')
sha256sums=('SKIP')

pkgver() {
  cd ocl
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build{32,64}

  # fix .cmake path
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i ocl/CMakeLists.txt
}

build() {
  cd "${srcdir}/build64"
  cmake ../ocl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  make

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/build32"
  cmake ../ocl \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_TESTING=ON

  make
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
  make -C build64 DESTDIR="${pkgdir}" install

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
  make -C build32 DESTDIR="${pkgdir}" install

  install -Dm644 ocl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
