# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=khronos-ocl-icd
pkgver=2022.05.18
pkgrel=1
pkgdesc='Khronos Group OpenCL installable client driver (ICD) loader'
arch=('x86_64')
url='https://www.khronos.org/registry/OpenCL/'
license=('Apache')
depends=('glibc'
        'opencl-driver')
makedepends=('cmake'
             "opencl-headers-git>=${pkgver}") # Arch/extra/opencl-headers doesn't have the cmake pkg configs yet
provides=('ocl-icd'
          'opencl-icd-loader')
conflicts=('ocl-icd')
_pkgver_or_commit="${pkgver}"
# _pkgver_or_commit='eaf36a67c0f4c496078e51097a40a01718198edc'
_reponame='OpenCL-ICD-Loader'
source=("${pkgname}-${_pkgver_or_commit}.tar.gz::https://github.com/KhronosGroup/${_reponame}/archive/v${_pkgver_or_commit}.tar.gz")
sha256sums=('71f70bba797a501b13b6b0905dc852f3fd6e264d74ce294f2df98d29914c4303')

prepare() {
  # set cmake pkg info dirs for opencl-headers-git
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i "${_reponame}-${_pkgver_or_commit}/CMakeLists.txt"

  printf 'Checking if ccache is enabled for makepkg... '

  if check_buildoption "ccache" "y"; then
    printf 'yes\n'
    printf 'Enabling C++ ccache for CMake...\n'
    export CMAKE_CXX_COMPILER_LAUNCHER='ccache'
  else
    printf 'no\n'
  fi

  printf 'Configuring build with CMake...\n\n'
  export CXXFLAGS+=" ${CPPFLAGS}" # CMake ignores CPPFLAGS

  cmake -S "${_reponame}-${_pkgver_or_commit}" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DBUILD_TESTING=ON
}

build() {
  printf 'Building with CMake...\n\n'
  cmake --build build
}

check() {
  (cd build; OCL_ICD_FILENAMES="$(pwd)/libOpenCLDriverStub.so" ctest)
}

package() {
  printf 'Installing with CMake...\n\n'
  DESTDIR="${pkgdir}" cmake --build build --target install
}
