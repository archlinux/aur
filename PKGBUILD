# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Duong Pham <dthpham@gmail.com>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=khronos-ocl-icd
pkgver=2023.12.14
pkgrel=1
pkgdesc='Khronos Group OpenCL installable client driver (ICD) loader'
arch=(x86_64)
url='https://www.khronos.org/registry/OpenCL/'
license=(Apache)
depends=(glibc opencl-driver opencl-headers-git)
makedepends=(git cmake)
provides=(ocl-icd opencl-icd-loader)
conflicts=(ocl-icd)
source=("git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  # set cmake pkg info dirs for opencl-headers-git
  sed 's|${CMAKE_INSTALL_DATADIR}/cmake|${CMAKE_INSTALL_LIBDIR}/cmake|g' -i OpenCL-ICD-Loader/CMakeLists.txt
}

build() {
  cmake -S OpenCL-ICD-Loader -B build -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="${LDFLAGS}" \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
