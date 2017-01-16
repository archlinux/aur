# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libkate
pkgver=0.4.1
pkgrel=2
pkgdesc="A karaoke and text codec for embedding in ogg (mingw-w64)"
arch=('any')
url="http://libkate.googlecode.com/"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libogg' 'mingw-w64-libpng')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://downloads.xiph.org/releases/kate/libkate-${pkgver}.tar.gz")
md5sums=('1dfdbdeb2fa5d07063cf5b8261111fca')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libkate-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libkate-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install

    rm -rf "$pkgdir"/usr/${_arch}/bin/KateDJ
    rm -rf "$pkgdir"/usr/${_arch}/share/{doc,man}
    rm -rf "$pkgdir"/usr/${_arch}/lib/python*
 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    find "$pkgdir" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;

  done
}

# vim: ts=2 sw=2 et:
