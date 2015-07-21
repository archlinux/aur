# Maintainer: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-openal
pkgver=1.16.0
pkgrel=5
pkgdesc="OpenAL audio library for use with opengl (mingw-w64)"
arch=(any)
url="http://connect.creativelabs.com/openal/"
license=('GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-$pkgver.tar.bz2)
md5sums=('14db4b0d12f07252070b4fe5eb5911f6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
build() {
  unset LDFLAGS

  for _arch in ${_architectures}; do
      mkdir -p "${srcdir}/build-${_arch}" && cd "${srcdir}/build-${_arch}"
      ${_arch}-cmake -DEXAMPLES=OFF \
                     ../openal-soft-${pkgver}
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd "${srcdir}/build-${_arch}"
      make DESTDIR="${pkgdir}" install
      ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
