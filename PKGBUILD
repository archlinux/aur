pkgname=mingw-w64-waffle
pkgver=1.7.2
pkgrel=1
pkgdesc='a library for choosing window system and OpenGL API at runtime (mingw-w64)'
arch=('any')
url='https://waffle.freedesktop.org'
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-meson' 'cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(https://waffle.freedesktop.org/files/release/waffle-${pkgver}/waffle-${pkgver}.tar.xz{,.asc})
sha256sums=('f676195cfea58cc75ef2441c5616b2f1d5565a7d371a6aa655aff3cc67c7c2c9'
            'SKIP')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "waffle-$pkgver"

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
  cd "waffle-$pkgver"

  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"

    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    # To be fixed upstream with a later release
    mv "$pkgdir"/usr/${_arch}/bin/{lib,}waffle-1.dll
  done
}
