pkgname=mingw-w64-opencl-icd
pkgver=2024.10.24
pkgrel=1
pkgdesc="The OpenCL ICD Loader (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
groups=("mingw-w64-vulkan-devel")
license=('Apache-2.0')
makedepends=(mingw-w64-cmake mingw-w64-opencl-headers)
depends=(mingw-w64-crt)
options=(!buildflags !debug staticlibs !strip)
source=("https://github.com/KhronosGroup/OpenCL-ICD-Loader/archive/v${pkgver}.tar.gz")
sha256sums=('95f2f0cda375b13d2760290df044ebea9c6ff954a7d7faa0867422442c9174dc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/OpenCL-ICD-Loader-${pkgver}"
}

build() {
  cd "${srcdir}/OpenCL-ICD-Loader-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF -DOPENCL_ICD_LOADER_DISABLE_OPENCLON12=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/OpenCL-ICD-Loader-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
