# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-icd-loader
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Loader
pkgver=1.3.207
pkgrel=2
pkgdesc="Vulkan Installable Client Driver (ICD) Loader (mingw-w64)"
arch=(any)
url="https://www.khronos.org/vulkan/"
groups=("mingw-w64-vulkan-devel")
license=('APACHE')
makedepends=(mingw-w64-cmake mingw-w64-vulkan-headers python-lxml)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/${_dirname}/archive/v${pkgver}.tar.gz")
sha256sums=('f638a69ffc8afb6ff018a70ef0451b08a869081a417a23538a13a5fbc97aef97')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_dirname}-${pkgver}"
  curl -L https://github.com/KhronosGroup/Vulkan-Loader/pull/710.patch | patch -p1
  sed -i "s|NO_CMAKE_FIND_ROOT_PATH||g" cmake/FindVulkanHeaders.cmake
}

build() {
  cd "${srcdir}/${_dirname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTS=OFF -DUSE_MASM=OFF -DJWASM_FOUND=0 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${_dirname}-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
