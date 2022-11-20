pkgname=mingw-w64-waffle
pkgver=1.7.0
pkgrel=2
pkgdesc='a library for choosing window system and OpenGL API at runtime (mingw-w64)'
arch=('any')
url='https://waffle.freedesktop.org'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-meson' 'cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gitlab.freedesktop.org/mesa/waffle/-/archive/v$pkgver/waffle-v$pkgver.tar.gz")
sha256sums=('8562abf8d4778b788787513803b16b55a7ffff0971337cdac245ff29d8b12642')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/waffle-v$pkgver"

  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} \
      -D b_lto=false \
      -D strip=false \
      -D build-manpages=false \
      -D build-htmldocs=false \
      -D build-examples=false
    meson compile -C build-${_arch}
  done
}

package() {
  cd "${srcdir}/waffle-v$pkgver"

  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"

    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    # To be fixed upstream with a later release
    mv "$pkgdir"/usr/${_arch}/bin/{lib,}waffle-1.dll
  done
}
