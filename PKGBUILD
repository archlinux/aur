# Maintainer: Cosku Bas <cosku.bas@gmail.com>

pkgname=wxgtk-trenchbroom
pkgver=3.1.1
pkgrel=6
pkgdesc="GTK+2 implementation of wxWidgets API for GUI with TrenchBroom patches."
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
destdir=/opt/${pkgname}

depends=('gtk2' 'gst-plugins-base-libs' 'libsm' 'libxxf86vm' 'libnotify')
makedepends=('gst-plugins-base' 'gconf' 'glu' 'webkit2gtk' 'libnotify' 'gtk2')
options=('!emptydirs')

source=(https://github.com/wxWidgets/wxWidgets/releases/download/v${pkgver}/wxWidgets-${pkgver}.tar.bz2
	make-abicheck-non-fatal.patch)
sha1sums=('f999c3cf1887c0a60e519214c14b15cb9bb5ea6e'
	'dfe38650c655395b90bf082b5734c4093508bfa3'
	)

prepare() {
	cd wxWidgets-${pkgver}

	# C++ ABI check is too strict and breaks with GCC 5.1
	# https://bugzilla.redhat.com/show_bug.cgi?id=1200611
	patch -Np1 -i ../make-abicheck-non-fatal.patch
}

build() {
	cd wxWidgets-${pkgver}
	./autogen.sh
	./configure --prefix=${destdir} --libdir=/usr/lib --with-gtk=2 --with-opengl --enable-unicode \
	--enable-graphics_ctx --enable-mediactrl --with-regex=builtin \
	--with-libpng=sys --with-libxpm=sys --with-libjpeg=sys --with-libtiff=sys \
	--disable-precomp-headers
	make
	make -C locale allmo
}

package() {
	cd wxWidgets-${pkgver}
	make DESTDIR=${pkgdir} install
	install -D -m644 "docs/licence.txt" "${pkgdir}${destdir}/share/licenses/${pkgname}/LICENSE"
	ln -s ${destdir}/include/wx-3.1/wx ${pkgdir}${destdir}/include/wx
}

