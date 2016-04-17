pkgname=mingw-w64-pango
pkgver=1.40.1
pkgrel=1
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=(any)
url="http://www.pango.org"
license=("LGPL")
makedepends=(mingw-w64-configure gtk-doc)
depends=(mingw-w64-harfbuzz mingw-w64-cairo)
options=(staticlibs !strip !buildflags)
source=("http://ftp.gnome.org/pub/gnome/sources/pango/${pkgver:0:4}/pango-${pkgver}.tar.xz"
"0001-no-unconditional-xft-please.all.patch"
"0002-msvc-is-impotent-but-not.mingw.patch")
sha256sums=('e27af54172c72b3ac6be53c9a4c67053e16c905e02addcf3a603ceb2005c1a40'
            'eccc044bbd156b252f5a13f7894c3a6cd1efc6ea80eaee57a5865895b192616d'
            '240d21474157c0deabc2660593ac0414565ddf30c304b08b74a09072c910b34d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/pango-$pkgver"
	patch -p1 -i ${srcdir}/0001-no-unconditional-xft-please.all.patch
  patch -p1 -i ${srcdir}/0002-msvc-is-impotent-but-not.mingw.patch
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
		find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}
