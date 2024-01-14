# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-mpg123
pkgver=1.32.4
pkgrel=1
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3 (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/mpg123"
license=('LGPL2.1')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${pkgver}.tar.bz2")
sha512sums=('ed84a45ad01f017fc5b60105498e3ff4d5717cbc5f20f3280d323a83611b4e1ec30da192a184cd6f2586fc7811586debf242c9d4289a22df8c42bc7c4a19121e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/mpg123-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --with-audio=dummy ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpg123-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share/man
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    find "$pkgdir" -name '*.exe' -delete
    find "$pkgdir" -name 'libout123*' -delete
    find "$pkgdir" -name 'out123.h' -delete
  done
}

# vim: ts=2 sw=2 et:
