pkgname=mingw-w64-vulkan-icd-loader
_pkgname=Vulkan-Loader
pkgver=1.2.158
pkgrel=1
pkgdesc="Vulkan Installable Client Driver (ICD) Loader (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake mingw-w64-vulkan-headers python-lxml)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=("https://github.com/KhronosGroup/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/KhronosGroup/Vulkan-Loader/pull/496.patch"
        "https://github.com/KhronosGroup/Vulkan-Loader/pull/498.patch")
sha256sums=('dc9e6a0b5296edb962d3dc168a257cbc1759e1d28afb8b4061a1bc5cb0fa7ede' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}"/496.patch
  patch -p1 -i "${srcdir}"/498.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    MINGW_CPPFLAGS="-D_WIN32_WINNT=0x0600" ${_arch}-cmake -DBUILD_TESTS=OFF \
      -DCMAKE_ASM_MASM_COMPILER=0 -DCMAKE_ASM_MASM_COMPILER_WORKS=0 \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${_pkgname}-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
