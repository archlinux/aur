# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=khronos-ocl-icd
pkgver=2022.01.04
pkgrel=1
pkgdesc='Khronos Group OpenCL installable client driver (ICD) loader'
arch=('x86_64')
url='https://www.khronos.org/registry/OpenCL/'
license=('Apache')
depends=('glibc')  # Arch doesn't package the headers properly in [extra]
makedepends=('cmake'
             'opencl-headers-git>=2022.01.04')
provides=('ocl-icd'
          'opencl-icd-loader')
conflicts=('ocl-icd')
# _pkgver_or_commit="v${pkgver}"
_pkgver_or_commit='c8490f9d2eb52dd12a1e9652c4e5369ff5af18d8'
_reponame='OpenCL-ICD-Loader'
source=("${pkgname}-${_pkgver_or_commit}.tar.gz::https://github.com/KhronosGroup/${_reponame}/archive/${_pkgver_or_commit}.tar.gz")
sha256sums=('9f65a8c27dcd2979a835e6de17ba87ddecf23ea4d26d1c3348a1648cff30e41f')
options=('debug')

prepare() {
  # set cmake pkg info dirs for opencl-headers-git
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i "${_reponame}-${_pkgver_or_commit}/CMakeLists.txt"
}

build() {
  cmake -S "${_reponame}-${_pkgver_or_commit}" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  (cd build; OCL_ICD_FILENAMES="$(pwd)/libOpenCLDriverStub.so" ctest)
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}
