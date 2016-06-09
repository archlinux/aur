# Contributor: naelstrof <naelstrof@gmail.com>
pkgname=mingw-w64-libvorbis
pkgver=1.3.5
pkgrel=1
pkgdesc="Vorbis codec library (mingw-w64)"
arch=(any)
url="http://xiph.org"
license=('custom')
depends=('mingw-w64-libogg' 'mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=(http://downloads.xiph.org/releases/vorbis/libvorbis-${pkgver}.tar.gz)
md5sums=('7220e089f3be3412a2317d6fde9e3944')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libvorbis-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure .. 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/libvorbis-${pkgver}/build-${_arch}
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share/doc
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
