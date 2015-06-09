pkgname=mingw-w64-pixman
pkgver=0.32.6
pkgrel=1
pkgdesc="The pixel-manipulation library for X and cairo (mingw-w64)"
arch=(any)
url="http://xorg.freedesktop.org"
license=("custom")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-libpng)
options=(staticlibs !strip !buildflags)
source=("http://xorg.freedesktop.org/releases/individual/lib/pixman-${pkgver}.tar.bz2")
sha1sums=('5b730399e1e212e5acaa69a4f1a2c7be1af1cdc4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd pixman-$pkgver
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
			--disable-gtk
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pixman-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
