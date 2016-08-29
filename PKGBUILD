pkgname=mingw-w64-pango
pkgver=1.40.2
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=(any)
url="http://www.pango.org"
license=("LGPL")
makedepends=(mingw-w64-configure gtk-doc)
depends=(mingw-w64-harfbuzz mingw-w64-cairo)
options=(staticlibs !strip !buildflags !emptydirs)
source=("http://ftp.gnome.org/pub/gnome/sources/pango/${pkgver:0:4}/pango-${pkgver}.tar.xz")
sha256sums=('90582a02bc89318d205814fc097f2e9dd164d26da5f27c53ea42d583b34c3cd1')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/pango-$pkgver"
	sed -i 's/have_libthai=true/have_libthai=false/' configure
}

build() {
	cd pango-$pkgver
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
		cd "${srcdir}/pango-${pkgver}/build-${_arch}"
		make -j1 DESTDIR="$pkgdir" install
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
	done
}
