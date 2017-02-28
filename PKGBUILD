pkgname=mingw-w64-pango
pkgver=1.40.4
pkgrel=1
_commit=43b9668ba688b01553abb7b453aeb206d7fd56fa
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=(any)
url="http://www.pango.org"
license=("LGPL")
makedepends=(mingw-w64-configure gtk-doc git)
depends=(mingw-w64-harfbuzz mingw-w64-cairo)
options=(staticlibs !strip !buildflags !emptydirs)
source=("git+https://git.gnome.org/browse/pango#commit=$_commit")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/pango"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "$srcdir/pango"
	NOCONFIGURE=1 ./autogen.sh
	sed -i 's/have_libthai=true/have_libthai=false/' configure
}

build() {
	cd "$srcdir/pango"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--disable-introspection \
			--disable-debug
		make
		popd
	done
}



package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/pango/build-${_arch}"
		make -j1 DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}
