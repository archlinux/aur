pkgname=mingw-w64-pango
pkgver=1.40.3
pkgrel=2
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=(any)
url="http://www.pango.org"
license=("LGPL")
makedepends=(mingw-w64-configure gtk-doc)
depends=(mingw-w64-harfbuzz mingw-w64-cairo)
options=(staticlibs !strip !buildflags !emptydirs)
source=("http://ftp.gnome.org/pub/gnome/sources/pango/${pkgver:0:4}/pango-${pkgver}.tar.xz"
"0001-no-unconditional-xft-please.all.patch")
sha256sums=('abba8b5ce728520c3a0f1535eab19eac3c14aeef7faa5aded90017ceac2711d3'
            'eccc044bbd156b252f5a13f7894c3a6cd1efc6ea80eaee57a5865895b192616d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/pango-$pkgver"
	patch -p1 -i ${srcdir}/0001-no-unconditional-xft-please.all.patch
	autoreconf -fi
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
