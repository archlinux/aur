pkgname=mingw-w64-grvk
pkgver=0.3.0
pkgrel=1
pkgdesc="Mantle to Vulkan translation layer (mingw-w64)"
arch=('any')
url="https://github.com/libcg/grvk"
license=("zlib")
makedepends=('mingw-w64-meson')
depends=('mingw-w64-vulkan-icd-loader')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/libcg/grvk/archive/${pkgver}.tar.gz")
sha256sums=('05072fdd49beed46a099c831d98f20f9d5f86416b288d5ee348b4004c5f020ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/grvk-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch}
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/grvk-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
    install -d "$pkgdir"/usr/${_arch}/include/mantle
    install include/mantle/*.h "$pkgdir"/usr/${_arch}/include/mantle
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
