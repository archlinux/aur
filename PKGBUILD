pkgbase=mingw-w64-harfbuzz
pkgname=(mingw-w64-harfbuzz mingw-w64-harfbuzz-icu)
pkgver=1.4.2
pkgrel=1
pkgdesc="OpenType text shaping engine (mingw-w64)"
arch=(any)
url="http://www.freedesktop.org/wiki/Software/HarfBuzz"
license=("MIT")
makedepends=(mingw-w64-configure mingw-w64-cairo mingw-w64-icu mingw-w64-graphite mingw-w64-freetype2)
options=(!strip !buildflags staticlibs)
source=("http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${pkgver}.tar.bz2")
sha256sums=('8f234dcfab000fdec24d43674fffa2fdbdbd654eb176afbde30e8826339cb7b3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd harfbuzz-${pkgver}
  # disable tests (thanks to chenxiaolong)
  sed -i '/SUBDIRS/s/test//' Makefile.am
  autoreconf -fi
}


build() {
	cd harfbuzz-$pkgver
	unset LDFLAGS
	for _arch in ${_architectures}; do
		# Build static and shared libs separately due to necessity of defining DGRAPHITE2_STATIC
    # manually when building static version

    # static build
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    CFLAGS=-DGRAPHITE2_STATIC CXXFLAGS=-DGRAPHITE2_STATIC ${_arch}-configure \
      --with-glib \
      --with-freetype \
      --with-cairo \
      --with-icu \
      --with-gobject \
      --with-graphite2 \
      --enable-static=yes \
      --enable-shared=no
    make
    popd
    # shared build
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-configure \
      --with-glib \
      --with-freetype \
      --with-cairo \
      --with-icu \
      --with-gobject \
      --with-graphite2 \
      --enable-static=no \
      --enable-shared=yes
    make
    popd
	done
}

package_mingw-w64-harfbuzz() {
	depends=(mingw-w64-freetype2 mingw-w64-glib2 mingw-w64-graphite)
  for _arch in ${_architectures}; do
    cd "${srcdir}/harfbuzz-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/harfbuzz-${pkgver}/build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    
    mkdir -p hb-icu/usr/${_arch}/{bin,include/harfbuzz,lib/pkgconfig}; cd hb-icu
    mv "$pkgdir"/usr/${_arch}/bin/libharfbuzz-icu* ./usr/${_arch}/bin
		mv "$pkgdir"/usr/${_arch}/lib/libharfbuzz-icu* ./usr/${_arch}/lib
		mv "$pkgdir"/usr/${_arch}/lib/pkgconfig/harfbuzz-icu.pc ./usr/${_arch}/lib/pkgconfig
		mv "$pkgdir"/usr/${_arch}/include/harfbuzz/hb-icu.h ./usr/${_arch}/include/harfbuzz
  done
}

package_mingw-w64-harfbuzz-icu() {
	pkgdesc="OpenType text shaping engine (ICU integration) (mingw-w64)"
	depends=(mingw-w64-harfbuzz mingw-w64-icu)
	for _arch in ${_architectures}; do
		cd "${srcdir}/harfbuzz-${pkgver}/build-${_arch}-shared"
		mkdir -p "$pkgdir/usr/${_arch}"
		mv hb-icu/usr/${_arch}/* "$pkgdir/usr/${_arch}"
	done
}
