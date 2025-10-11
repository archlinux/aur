# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-icd-loader
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Loader
pkgver=1.4.328
pkgrel=1
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
groups=('mingw-w64-vulkan-devel')
license=('Apache-2.0')
makedepends=(mingw-w64-cmake mingw-w64-vulkan-headers python-lxml ninja)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/v${pkgver}.tar.gz")
sha256sums=('07b5bae70dabdd2ee5a0fdaea95f72dac9561ddd768b0739d4af6cb8771e9ac8')

_srcdir="${_dirname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
  -Wno-dev
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
  -DUSE_MASM=OFF )

prepare() {
  cd "${_srcdir}"

  sed -i 's|${CMAKE_CURRENT_SOURCE_DIR}/vulkan-1.def||' 'loader/CMakeLists.txt'
  sed -i 's/__attribute__((visibility("default")))/__declspec(dllexport)/' 'loader/vk_loader_platform.h'
}

build() {
  for _arch in ${_architectures}; do
    #${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_TESTS=OFF \
    #  -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
    #cmake --build "build-${_arch}-static"

    ${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTS=OFF
    cmake --build "build-${_arch}"
  done
}

package() {
  for _arch in ${_architectures}; do
    #DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
    #${_arch}-strip -g "$pkgdir/usr/${_arch}/static/lib/"*.a

    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
