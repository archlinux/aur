pkgname=mingw-w64-harfbuzz
pkgver=1.0.1
pkgrel=1
pkgdesc="OpenType text shaping engine (mingw-w64)"
arch=(any)
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
license=("MIT")
makedepends=(mingw-w64-configure mingw-w64-cairo mingw-w64-icu mingw-w64-glib2)
depends=(mingw-w64-freetype)
options=(!strip !buildflags staticlibs)
optdepends=("mingw-w64-icu: harfbuzz-icu" mingw-w64-glib2 mingw-w64-cairo mingw-w64-freetype)
source=("http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${pkgver}.tar.bz2")
sha256sums=('32a1a7ad584a2f2cfba5c1d234d046c0521e86e7a21d403e15e89aa509ef0ea8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd harfbuzz-${pkgver}
  # disable tests (thanks to chenxiaolong)
  sed -i '/SUBDIRS/s/test//' Makefile.am
  autoreconf -vfi
}


build() {
	cd harfbuzz-$pkgver
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--with-glib \
			--with-freetype \
			--with-cairo \
			--with-icu \
			--with-gobject \
			--disable-introspection
		make
		popd
	done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/harfbuzz-${pkgver}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
