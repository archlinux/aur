pkgname=mingw-w64-pango
pkgver=1.40.11
pkgrel=1
_commit=6c4e0c59ace08547b891f102da1ac0364eeda72d  # tags/1.40.11^0
pkgdesc="A library for layout and rendering of text (mingw-w64)"
arch=(any)
url="http://www.pango.org"
license=("LGPL")
makedepends=(mingw-w64-configure gtk-doc git)
depends=(mingw-w64-harfbuzz mingw-w64-cairo)
options=(staticlibs !strip !buildflags !emptydirs)
source=("git+https://git.gnome.org/browse/pango#commit=$_commit"
"0001-no-unconditional-xft-please.all.patch")
sha256sums=('SKIP'
            'bebab6128258d300e677df0751177f5c30235d0a49c150d97987d0f00b309f35')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/pango"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
	cd "$srcdir/pango"
	patch -p1 -i ${srcdir}/0001-no-unconditional-xft-please.all.patch
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
