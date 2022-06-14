# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-icd-loader
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Loader
pkgver=1.3.217
pkgrel=1
pkgdesc='Vulkan Installable Client Driver (ICD) Loader (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
groups=('mingw-w64-vulkan-devel')
license=('APACHE')
makedepends=(mingw-w64-cmake mingw-w64-vulkan-headers python-lxml)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/v${pkgver}.tar.gz"
  'https://github.com/KhronosGroup/Vulkan-Loader/pull/710.patch')
sha256sums=('59c0e4934fca328366bbb50b3a8d2dfc3daeab7589fdadd7a29b8a79fe242a7f'
            '55736dff82300a74834beb9c832c8c2937158f7ada5993a01d832664f72c38a9')

_srcdir="${_dirname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
  -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG'
  -DUSE_MASM=OFF -DJWASM_FOUND=0 -DENABLE_WERROR=OFF )

prepare() {
  cd "${_srcdir}"
  patch -p1 -i '../710.patch'
  sed -i 's|NO_CMAKE_FIND_ROOT_PATH||g' 'cmake/FindVulkanHeaders.cmake'
}

build() {
  for _arch in ${_architectures}; do
    #${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_TESTS=OFF \
    #  -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
    #cmake --build "build-${_arch}-static"
    
    ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTS=OFF
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
