pkgname=mingw-w64-smpeg
epoch=1
pkgver=0.4.5
pkgrel=3
pkgdesc="SDL MPEG Player Library (mingw-w64)"
arch=(any)
url="http://icculus.org/smpeg"
license=("LGPL")
makedepends=(mingw-w64-configure subversion)
depends=(mingw-w64-sdl)
options=('!buildflags' '!strip' 'staticlibs')
source=("smpeg-$pkgver::svn://svn.icculus.org/smpeg/tags/release_${pkgver//./_}")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/smpeg-$pkgver"
  sed -i "s|-version-info|-no-undefined -version-info|g" Makefile.am
  ./autogen.sh
}

build() {
  cd "${srcdir}/smpeg-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    CFLAGS+=" -Wno-error=narrowing"
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
  install -d "$pkgdir/usr/bin/"
  for _arch in ${_architectures}; do
    cd "${srcdir}/smpeg-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
    ln -s "/usr/${_arch}/bin/smpeg-config" "$pkgdir/usr/bin/${_arch}-smpeg-config"
  done
}
