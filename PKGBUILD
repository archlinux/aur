pkgname=mingw-w64-smpeg
epoch=1
pkgver=2.0.0
pkgrel=1
pkgdesc="SDL MPEG Player Library (mingw-w64)"
arch=(any)
url="http://icculus.org/smpeg"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-sdl2)
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/icculus/smpeg/archive/refs/tags/release_${pkgver//./_}.tar.gz")
sha256sums=('fdd431bd607efcf0f35789fb3105d7535d4f0e8b46e673e9c0051726e8d1e701')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd smpeg-release_${pkgver//./_}
  ./autogen.sh
}

build() {
  cd smpeg-release_${pkgver//./_}
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
    cd "${srcdir}/smpeg-release_${pkgver//./_}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
    ln -s "/usr/${_arch}/bin/smpeg-config" "$pkgdir/usr/bin/${_arch}-smpeg-config"
  done
}
