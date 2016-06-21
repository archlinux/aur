pkgname=mingw-w64-libxslt
pkgver=1.1.29
pkgrel=1
pkgdesc="XML stylesheet transformation library (mingw-w64)"
arch=(any)
url="http://xmlsoft.org/XSLT"
license=(custom)
depends=(mingw-w64-crt mingw-w64-libxml2 mingw-w64-libgcrypt)
makedepends=(mingw-w64-configure)
options=(!strip staticlibs !buildflags)
source=("http://xmlsoft.org/sources/libxslt-${pkgver}.tar.gz"
"libxslt-1.1.26-w64.patch"
"libxslt-1.1.28-win32-shared.patch"
"libxslt.m4-libxslt-1.1.26.patch"
"0003-fix-concurrent-directory-creation.all.patch")
md5sums=('a129d3c44c022de3b9dcf6d6f288d72e'
         'b994c0d9df0f644e219cf63561ee0d4e'
         '19646f155b518b40cb63e41270215964'
         '61b520bbd42006c16bbfc85bc5342b96'
         '6da8eb266e6be4f843cf63bd74c6388b')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd libxslt-${pkgver}
	patch -p1 -i "${srcdir}/libxslt-1.1.26-w64.patch"
  patch -p1 -i "${srcdir}/libxslt-1.1.28-win32-shared.patch"
  patch -p1 -i "${srcdir}/libxslt.m4-libxslt-1.1.26.patch"
  patch -p1 -i "${srcdir}/0003-fix-concurrent-directory-creation.all.patch"
  autoreconf -fi
}

build() {
	cd "$srcdir/libxslt-${pkgver}"
	unset LDFLAGS
	for _arch in ${_architectures}; do
		mkdir -p "build-${_arch}" && pushd "build-${_arch}"
		${_arch}-configure \
			--with-libxml-prefix=/usr/${_arch} \
			--without-python
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "$srcdir/libxslt-${pkgver}/build-${_arch}"
		make DESTDIR="$pkgdir" install
		rm -r "$pkgdir"/usr/${_arch}/share
		find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
	done
}

