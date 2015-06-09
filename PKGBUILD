# Contributor: Adam Dariusz Szkoda <adaszko at gmail dot com>
# Contributor: Egon Geerardyn <egon.geerardyn@gmail.com>
# Maintainer : Marcos Heredia <chelqo@gmail.com>

# some parts taken from PKGBUILD official ArchLinux

pkgname=texmacs-qt
pkgver=1.0.7.21
pkgrel=1
pkgdesc="WYSIWYG Qt4 editor and graphical frontend to various CASes"
arch=('i686' 'x86_64')
url='http://texmacs.org/'
license=('GPL3')
depends=('qt4' 'texlive-core' 'guile1.8' 'cairo' 'freetype2' 'imlib2'
         'perl' 'python2' 'libxext'
         'desktop-file-utils' 'shared-mime-info' 'gtk-update-icon-cache')
optdepends=('gawk: conversion of some files'
            'transfig: convert images using fig2ps')
conflicts=('texmacs')
install=${pkgname}.install
source=("http://www.texmacs.org/Download/ftp/tmftp/source/TeXmacs-$pkgver-src.tar.gz"
        'http://www.texmacs.org/Images/tm_gnu1b.png'
        'texmacs.desktop')
md5sums=('a56e2f14761e9003471fd26d91058ef0'
         '48c15c09000cc38728d847c3a8ffabc0'
         'a1856736b4defd6f3a46cf608b108ef1')

build() {
    cd $srcdir/TeXmacs-$pkgver-src

    sed -i 's/env python/env python2/' \
	plugins/{mathematica/bin/realpath.py,python/bin/tm_python,sage/bin/tm_sage} \
	TeXmacs/misc/inkscape_plugin/texmacs_reedit.py
	sed -i 's/"python"/"python2"/' plugins/python/progs/init-python.scm
	sed -i '/^LDPATH/d' src/makefile.in
	sed -i -e 's/guile /guile1.8 /g' \
	-e 's/guile-config/guile-config1.8/g' \
	configure

    QMAKE=/usr/bin/qmake-qt4 \
    MOC=/usr/bin/moc-qt4 \
    UIC=/usr/bin/uic-qt4 \
    RCC=/usr/lib/qt4/bin/rcc \
    ./configure \
	--prefix=/usr \
	--enable-pdf-renderer \
	--enable-optimize \
	--with-freetype \
	--with-imlib2 \
	--with-qt
    make || return 1
}

package() {
    cd $srcdir/TeXmacs-$pkgver-src
    make prefix=$pkgdir/usr install

    _appdir=$pkgdir/usr/share/applications
    _pngdir=$pkgdir/usr/share/pixmaps
    _docdir=$pkgdir/usr/share/doc/$pkgname-$pkgver
    _licdir=$pkgdir/usr/share/licenses/$pkgname
    install -dm 755 ${_appdir} ${_pngdir} ${_docdir} ${_licdir}
    install -Dpm 0644 $srcdir/../texmacs.desktop ${_appdir}/
    install -Dpm 0644 $srcdir/../tm_gnu1b.png ${_pngdir}/texmacs.png
    install -Dpm 0644 COMPILE COPYING LICENSE TODO TeXmacs/INSTALL TeXmacs/README TeXmacs/TEX_FONTS ${_docdir}/
    cd ${_licdir} ; ln -s ../../TeXmacs/LICENSE .

    # file corrections
    (cd $pkgdir/usr/share/icons/gnome ; [ -f icon-theme.cache ] && rm *.cache)
    (cd $pkgdir/usr/share/mime ; for f in *; do [ -f $f ] && rm $f; done)
    sed -i 's|${prefix}|/usr|' ${pkgdir}/usr/bin/fig2ps
}
