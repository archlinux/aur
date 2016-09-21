# Contributor: Adam Dariusz Szkoda <adaszko at gmail dot com>
# Contributor: Egon Geerardyn <egon.geerardyn@gmail.com>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

# some parts taken from PKGBUILD official ArchLinux

pkgname=texmacs-qt
pkgver=1.99.5
pkgrel=1
pkgdesc="WYSIWYG Qt4 editor and graphical frontend to various CASes"
arch=('i686' 'x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt4' 'guile1.8' 'cairo' 'freetype2' 'imlib2'
         'perl' 'python2' 'libxext' 'sqlite'
         'desktop-file-utils' 'shared-mime-info' 'gtk-update-icon-cache')
optdepends=('texlive-core: TeX-fonts'
            'gawk: conversion of some files'
            'transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking')
makedepends=('ghostscript')
options=('!emptydirs')
conflicts=('texmacs')
install=${pkgname}.install
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
md5sums=('c9d6ddbd2c528f6b263f316df0a55ff1'
         '48c15c09000cc38728d847c3a8ffabc0'
         'a1856736b4defd6f3a46cf608b108ef1')

prepare() {
	cd ${srcdir}/TeXmacs-${pkgver}-src

	sed -i 's/env python/env python2/' \
		plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
		TeXmacs/misc/inkscape_extension/texmacs_reedit.py
	sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
	sed -i '/^LDPATH/d' src/makefile.in

	autoreconf -vi
	sed -i -e 's/guile18-config/guile-config1.8/g' configure
	sed -i -e 's/guile18/guile1.8/g' configure
	sed -i -e 's|#include <libguile18.h>|#include <guile/gh.h>|g' src/Scheme/Guile/guile_tm.hpp

	sed -i '/update-mime-database/d' Makefile.in
	sed -i '/gtk-update-icon-cache/d' Makefile.in
	sed -i '\/icons\/gnome 2>\/dev\/null/d' Makefile.in

	find -name '.*.d' -o -name '.*.cpp' -exec rm {} \;
}

build() {
	cd ${srcdir}/TeXmacs-${pkgver}-src

	export LDFLAGS="$LDFLAGS -lz"
	QMAKE=/usr/bin/qmake-qt4 \
	MOC=/usr/bin/moc-qt4 \
	UIC=/usr/bin/uic-qt4 \
	RCC=/usr/lib/qt4/bin/rcc \
	./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \
		--libexecdir=/usr/lib \
		--enable-pdf-renderer \
		--enable-optimize \
		--with-imlib2 \
		--enable-guile2=no \
		--with-qt
	make || return 1

#		--with-freetype \
#		--with-sqlite3=yes \
}

package() {
	cd ${srcdir}/TeXmacs-${pkgver}-src
	make DESTDIR=${pkgdir} install
	sed -i 's|${prefix}|/usr|' ${pkgdir}/usr/bin/fig2ps

	_appdir=${pkgdir}/usr/share/applications
	_pngdir=${pkgdir}/usr/share/pixmaps
	_docdir=${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
	_licdir=${pkgdir}/usr/share/licenses/${pkgname}
	install -dm 755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
	install -Dpm 0644 ${srcdir}/../texmacs.desktop ${_appdir}/
	install -Dpm 0644 ${srcdir}/../tm_gnu1b.png ${_pngdir}/texmacs.png
	install -Dpm 0644 COMPILE COPYING LICENSE TODO TeXmacs/INSTALL TeXmacs/README TeXmacs/TEX_FONTS ${_docdir}/
	cd ${_licdir} ; ln -s ../../TeXmacs/LICENSE .
}

