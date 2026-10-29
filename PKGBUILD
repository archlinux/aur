# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-svn
pkgver=27926
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://www.scribus.net"
depends=(
	cairo
	fontconfig
	freetype2
	glibc
	graphicsmagick
	harfbuzz
	harfbuzz-icu
	hicolor-icon-theme
	hunspell
	icu
	lcms2
	libcdr
	libcups
	libfreehand
	libgcc
	libjpeg.so
	libjxl
	libmspub
	libpagemaker
	libpng
	librevenge
	libstdc++
	libtiff
	libvisio
	libqxp
	libxml2
	libzmf
	openscenegraph
	podofo
	poppler
	python
	'qt-advanced-docking-system>=5.1.1'
	qt6-5compat
	qt6-base
	qt6-svg
	zlib
)
makedepends=(cmake subversion boost qt6-tools openssl)
optdepends=(
	'hyphen-lang: hyphenation dictionaries for your language'
	'ghostscript: PostScript and EPS support'
	'tk: scripts using tkinter'
	'python-pillow: image support in bundled scripts'
	'qt6-imageformats: additional Qt image formats'
)
conflicts=('scribus')
provides=('scribus')
source=('scribus::svn://scribus.net/trunk' 'system-qtads.patch')
sha256sums=('SKIP'
            'eb38c4a94787588be0bbd9b33386041994134089c20a2364d8d0b1a2b85c3330')
_svnmod='scribus'

pkgver() {
  svn info --show-item revision "$srcdir/$_svnmod"
}

prepare() {
  cd "$srcdir/$_svnmod/Scribus"
  patch -Np1 -i "$srcdir/system-qtads.patch"
}

build() {
	cd "$srcdir/$_svnmod/Scribus"
	cmake . -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWANT_DISTROBUILD=ON \
		-DWANT_CPP20=ON \
		-DWANT_GRAPHICSMAGICK=ON \
		-DWANT_PCH=ON \
		-DWITH_PODOFO=ON
	cmake --build build
}

package() {
	cd "$srcdir/$_svnmod/Scribus"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}/usr/share/pixmaps/scribus.svg"
	rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
	ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
