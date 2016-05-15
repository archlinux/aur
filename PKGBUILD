# $Id$
# Maintainer: Błażej Szczygieł <spaz16@wp.pl>
# Last maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: tobias <tobias@archlinux.org>

_pkgname=inkscape
pkgname=${_pkgname}-old
pkgver=0.48.5
pkgrel=1
pkgdesc='Vector graphics editor using the SVG file format'
url='https://inkscape.org/'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
makedepends=('boost' 'intltool')
depends=('gc' 'gsl' 'gtkmm' 'gtkspell' 'imagemagick' 'libxslt' 'poppler-glib' 'popt'
         'python2' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pstoedit: latex formulas'
            'texlive-core: latex formulas'
            'python2-numpy: some extensions'
            'python2-lxml: some extensions and filters'
            'uniconvertor: reading/writing to some proprietary formats')
source=("https://launchpad.net/${_pkgname}/0.48.x/${pkgver}/+download/${_pkgname}-${pkgver}.tar.bz2"
        'fix-build-with-poppler-0.29.0.patch'
        'ime-placement.patch'
        'fix-build-with-new-sigc++.patch'
        'fix-build-with-new-gcc.patch')
sha1sums=('83ddb0c96069638f712a869039989bfd7d79c6a8'
          '82ad02357a2405c11f29f2e516b1a7f55953e807'
          'b12b948ca5ee7e02703a13aa8b8bccdf67947f12'
          '366fd788e1fb5f9988b565d61e5775af47cd894f'
          '0e38f95a8a84383a95bbef813d71b072ee0fc0e0')
conflicts=('inkscape')
install=install

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	# https://bugs.launchpad.net/inkscape/+bug/1399811
	patch -p0 -i ../fix-build-with-poppler-0.29.0.patch
	autoreconf -vi

	patch -p1 -i ../ime-placement.patch # FS#39898
	sed -i 's|/usr/bin/python\>|/usr/bin/python2|g' cxxtest/*.py
	sed -i 's|/usr/bin/env python\>|/usr/bin/env python2|g' share/*/{test/,}*.py
	sed -i 's|"python" },|"python2" },|g' src/extension/implementation/script.cpp
	sed -i 's|python -c|python2 -c|g' configure share/extensions/uniconv*.py
	sed -i 's|"python"|"python2"|g' src/main.cpp
	sed -i '/extern unsigned GC_version;/c unsigned GC_version=GC_VERSION_MAJOR<<16+GC_VERSION_MINOR<<8+GC_VERSION_MICRO;' configure

	patch -p1 -i ../fix-build-with-new-sigc++.patch
	patch -p1 -i ../fix-build-with-new-gcc.patch
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	CXXFLAGS="$CXXFLAGS -std=gnu++11" #Don't error on GCC6 with binding (&::operator delete)
	./configure \
		--prefix=/usr \
		--with-python \
		--with-perl \
		--enable-lcms \
		--enable-poppler-cairo \
		--disable-dependency-tracking
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
