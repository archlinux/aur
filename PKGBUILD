pkgname=mingw-w64-libcroco
pkgver=0.6.12+4+g9ad7287
pkgrel=2
pkgdesc="GNOME CSS2 parsing and manipulation toolkit (mingw-w64)"
arch=(any)
url="http://www.gnome.org/browse/libcroco"
license=("LGPL")
makedepends=(mingw-w64-configure intltool git gtk-doc)
depends=(mingw-w64-glib2 mingw-w64-libxml2)
options=(staticlibs !strip !buildflags)
_commit=9ad72875e9f08e4c519ef63d44cdbd94aa9504f7  # master
source=("git+https://git.gnome.org/browse/libcroco#commit=$_commit")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd libcroco
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libcroco
  NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libcroco
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
      --disable-gtk-doc-html
		make
		popd
	done
}

package() {
	mkdir -p "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/libcroco/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/bin/croco-${pkgver%.*}-config" "$pkgdir/usr/bin/${_arch}-croco-config"
  done
}
