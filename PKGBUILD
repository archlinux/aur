pkgname=mingw-w64-libxslt
pkgver=1.1.28
pkgrel=7
pkgdesc="XML stylesheet transformation library (mingw-w64)"
arch=(any)
url="http://xmlsoft.org/XSLT"
license=(custom)
depends=(mingw-w64-crt mingw-w64-libxml2 mingw-w64-libgcrypt)
makedepends=(mingw-w64-configure)
options=(!strip staticlibs !buildflags)
source=("http://xmlsoft.org/sources/libxslt-${pkgver}.tar.gz"
"mingw32-libxslt-use-correct-mkdir.patch"
"0005-fix-freelocales-export.all.patch"
"libxslt-1.1.26-w64.patch"
"libxslt-1.1.28-win32-shared.patch"
"CVE-2015-7995.patch")
md5sums=('9667bf6f9310b957254fdcf6596600b7'
         'd9a2f525f8f703d8e2000000dcaa943e'
         'ee6e3e375b8ea2f42c7039e13f14f0c8'
         'b994c0d9df0f644e219cf63561ee0d4e'
         '19646f155b518b40cb63e41270215964'
         'b97b695cbe4171f8cb10df41f652aba5')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd libxslt-${pkgver}
	patch -p1 -i "${srcdir}/libxslt-1.1.26-w64.patch"
  patch -p1 -i "${srcdir}/libxslt-1.1.28-win32-shared.patch"
  patch -p0 -i "${srcdir}/mingw32-libxslt-use-correct-mkdir.patch"
  patch -p1 -i "${srcdir}/0005-fix-freelocales-export.all.patch"
  patch -Np1 -i ../CVE-2015-7995.patch
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

