# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Schala

pkgname=mingw-w64-wxmsw
epoch=1
pkgver=3.0.2
pkgrel=1
pkgdesc="Win32 implementation of wxWidgets API for GUI (mingw-w64)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt mingw-w64-libpng mingw-w64-libjpeg-turbo mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
conflicts=(mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
provides=(mingw-w64-wxmsw2.9 mingw-w64-wxmsw-static)
replaces=(mingw-w64-wxmsw2.9)
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-${pkgver}.tar.bz2")
sha1sums=('6461eab4428c0a8b9e41781b8787510484dea800')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	# monolithic shared builds
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-shared-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-shared-${_arch}"
		"${srcdir}"/wxWidgets-$pkgver/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--with-msw \
			--with-opengl \
			--disable-mslu \
			--enable-unicode \
			--enable-shared \
			--enable-monolithic \
			--enable-stl \
			--with-regex=builtin \
			--disable-precomp-headers \
			--enable-graphics_ctx \
			--enable-webview \
			--enable-mediactrl \
			--with-libpng=sys \
			--with-libxpm=builtin \
			--with-libjpeg=sys \
			--with-libtiff=sys
		make
	done

	# static builds
	for _arch in ${_architectures}; do
		unset LDFLAGS
		mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-static-${_arch}"
		cd "${srcdir}/${pkgname}-${pkgver}-build-static-${_arch}"
		"${srcdir}"/wxWidgets-$pkgver/configure \
			--prefix=/usr/${_arch} \
			--build=$CHOST \
			--host=${_arch} \
			--with-msw \
			--with-opengl \
			--disable-mslu \
			--enable-unicode \
			--disable-shared \
			--enable-stl \
			--with-regex=builtin \
			--disable-precomp-headers \
			--enable-graphics_ctx \
			--enable-webview \
			--enable-mediactrl \
			--with-libpng=sys \
			--with-libxpm=builtin \
			--with-libjpeg=sys \
			--with-libtiff=sys
		make
	done
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	for _arch in ${_architectures}; do
		for _build in "shared" "static"; do
			cd "${srcdir}/${pkgname}-${pkgver}-build-${_build}-${_arch}"
			make DESTDIR="$pkgdir" install
		done
		mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin"
		find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
		find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
		ln -s "/usr/${_arch}/lib/wx/config/${_arch}-msw-unicode-${pkgver%.*}" "$pkgdir/usr/bin/${_arch}-wx-config"
		rm "$pkgdir/usr/${_arch}/bin/wxrc-3.0"
		rm -r "$pkgdir/usr/${_arch}/share"
	done
}
