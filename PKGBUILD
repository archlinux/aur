# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=wxgtk-trenchbroom
pkgver=3.1.0
pkgrel=2
pkgdesc="GTK+ implementation of wxWidgets API for GUI with TrenchBroom patches."
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')

depends=('gtk2' 'gstreamer0.10-base' 'libsm')
makedepends=('gstreamer0.10-base-plugins' 'gconf' 'webkitgtk2' 'glu')
optdepends=('webkitgtk2: for webview support')
options=('!emptydirs')
conflicts=('wxgtk')
provides=('wxgtk=${pkgver}')

source=(https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-${pkgver}.tar.bz2
		make-abicheck-non-fatal.patch
		wxGLContext_ctor_x11Direct20160316.patch)
sha1sums=('2170839cfa9d9322e8ee8368b21a15a2497b4f11'
		'dfe38650c655395b90bf082b5734c4093508bfa3'
		'6941a40b202f29f4ae36ff332fb8f1ff95244737')

prepare() {
	cd wxWidgets-${pkgver}

	# C++ ABI check is too strict and breaks with GCC 5.1
	# https://bugzilla.redhat.com/show_bug.cgi?id=1200611
	patch -Np1 -i ../make-abicheck-non-fatal.patch

	# Apply TrenchBroom patch
	patch -p0 < ../wxGLContext_ctor_x11Direct20160316.patch
}

build() {
	cd wxWidgets-${pkgver}
	./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --enable-unicode \
		--enable-graphics_ctx --enable-mediactrl --enable-webview --with-regex=builtin \
		--with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
		--disable-precomp-headers --disable-shared
	make
	make -C locale allmo
}

package() {
	cd wxWidgets-${pkgver}
	make DESTDIR="${pkgdir}" install
	install -D -m644 "docs/licence.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s /usr/include/wx-3.1/wx $pkgdir/usr/include/wx
}

