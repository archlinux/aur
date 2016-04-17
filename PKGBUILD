pkgname=mingw-w64-fontconfig
pkgver=2.11.95
pkgrel=1
pkgdesc="A library for configuring and customizing font access (mingw-w64)"
arch=(any)
url="http://www.fontconfig.org/release"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-expat mingw-w64-freetype2)
options=(staticlibs !strip !buildflags)
source=("http://www.fontconfig.org/release/fontconfig-$pkgver.tar.bz2")
sha256sums=('7b165eee7aa22dcc1557db56f58d905b6a14b32f9701c79427452474375b4c89')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd fontconfig-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-arch=${_arch%-w64-mingw32}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fontconfig-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.def' | xargs rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/"{etc,share}
  done
}
