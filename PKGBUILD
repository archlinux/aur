# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=khronos-ocl-icd-git
pkgname=(
  'khronos-ocl-icd-git'
  'lib32-khronos-ocl-icd-git'
)
pkgver=2023.04.17.5.g229410f
pkgrel=1
arch=('x86_64')
url="http://www.khronos.org/registry/cl"
license=('apache')
makedepends=(
  'git'
  'cmake'
  'glibc'
  'lib32-glibc'
)
source=('git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd OpenCL-ICD-Loader
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  # fix .cmake path
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i OpenCL-ICD-Loader/CMakeLists.txt
}

build() {
  cmake -S OpenCL-ICD-Loader -B build64 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build64

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -S OpenCL-ICD-Loader -B build32 \
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
  depends=(
    'glibc' # libc.so
    'opencl-headers-git'
  )
  provides=(
    'khronos-ocl-icd'
    'opencl-icd-loader'
    'ocl-icd'
    'libOpenCL.so'
  )
  conflicts=(
    'khronos-ocl-icd'
    'opencl-icd-loader'
    'ocl-icd'
  )
  DESTDIR="${pkgdir}" cmake --install build64

  install -Dm644 OpenCL-ICD-Loader/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_lib32-khronos-ocl-icd-git() {
  pkgdesc="Khronos Group OpenCL installable client driver (ICD) loader. (GIT Version) (32-bits)"
  depends=(
    'lib32-glibc' # libc.so
    'opencl-headers-git'
  )
  provides=(
    'lib32-lib32-khronos-ocl-icd'
    'lib32-opencl-icd-loader'
    'lib32-ocl-icd'
    'libOpenCL.so'
  )
  conflicts=(
    'lib32-khronos-ocl-icd'
    'lib32-opencl-icd-loader'
    'lib32-ocl-icd'
  )
  DESTDIR="${pkgdir}" cmake --install build32
  (cd "${pkgdir}/usr/bin/" ; mv cllayerinfo{,32})

  install -Dm644 OpenCL-ICD-Loader/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
