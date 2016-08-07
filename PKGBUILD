# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-libsndfile
pkgver=1.0.27
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound (mingw-w64)"
arch=(any)
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-flac' 'mingw-w64-libvorbis' 'mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=(http://www.mega-nerd.com/libsndfile/files/libsndfile-${pkgver}.tar.gz)
md5sums=('fd1d97c6077f03b5d984d7956ffedb7a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libsndfile-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS="`${_arch}-pkg-config --libs vorbis ogg`" ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libsndfile-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    rm -r $pkgdir/usr/${_arch}/share/
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

