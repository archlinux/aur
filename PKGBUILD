pkgname=mingw-w64-smpeg2
epoch=1
pkgver=2.0.0
pkgrel=3
pkgdesc="SDL MPEG Player Library (mingw-w64)"
arch=(any)
url="http://icculus.org/smpeg"
license=("LGPL")
makedepends=(mingw-w64-configure subversion)
depends=(mingw-w64-crt mingw-w64-sdl2)
provides=("mingw-w64-smpeg-svn=408")
options=(staticlibs !strip !buildflags)
source=("smpeg2-${pkgver}::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/smpeg2-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/smpeg2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-sdltest \
      --disable-gtk-player \
      --disable-gtktest \
      --disable-opengl-player \
      --with-sdl-prefix=/usr/${_arch} \
      --without-x
    make
    popd
  done
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/smpeg2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ln -s "/usr/${_arch}/bin/smpeg2-config" "$pkgdir/usr/bin/${_arch}-smpeg2-config"
  done
}
