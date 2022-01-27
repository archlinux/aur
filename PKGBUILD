pkgname=mingw-w64-opencl-icd
pkgver=2022.01.04
pkgrel=1
pkgdesc="The OpenCL ICD Loader (mingw-w64)"
arch=(any)
url="https://github.com/KhronosGroup/OpenCL-ICD-Loader"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake mingw-w64-opencl-headers)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/OpenCL-ICD-Loader/archive/v${pkgver}.tar.gz")
sha256sums=('9f21d958af68c1b625a03c2befddd79da95d610614ddab6c291f26f01a947dd8')

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
