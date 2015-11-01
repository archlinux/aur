pkgname=mingw-w64-libcroco
pkgver=0.6.9
pkgrel=1
pkgdesc="A CSS parsing library (mingw-w64)"
arch=(any)
url="http://www.gnome.org"
license=("LGPL")
makedepends=(mingw-w64-configure intltool)
depends=(mingw-w64-glib2 mingw-w64-libxml2)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/gnome/sources/libcroco/${pkgver%.*}/libcroco-$pkgver.tar.xz")
sha256sums=('38b9a6aed1813e55b3ca07a68d1af845ad4d1f984602e9272fe692930c0be0ae')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd libcroco-$pkgver
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure
		make
		popd
	done
}

package() {
	mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/libcroco-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/bin/croco-${pkgver%.*}-config" "$pkgdir/usr/bin/${_arch}-croco-config"
  done
}
