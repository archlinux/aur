# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-svn
pkgver=27454
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=(
	boost-libs
	cairo
	fontconfig
	freetype2
	graphicsmagick
	harfbuzz-icu
	hicolor-icon-theme
	hunspell
	icu
	lcms2
	libcdr
	libcups
	libfreehand
	libjpeg-turbo
	libmspub
	libpagemaker
	libpng
	librevenge
	libtiff
	libvisio
	libqxp
	libxml2
	libzmf
	openscenegraph
	openssl
	podofo
	poppler
	python
	python-pillow
	qt6-5compat
	qt6-base
	qt6-declarative
	qt6-imageformats
	qt6-svg
	qt6-tools
	zlib
)
makedepends=(cmake subversion boost)
optdepends=(
	'hyphen: for hyphenation support'
)
conflicts=('scribus')
provides=('scribus')
source=('scribus::svn://scribus.net/trunk')
sha256sums=('SKIP')
_svnmod='scribus'

pkgver() {
  LANG=C
  cd ${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
	cd ${_svnmod}/Scribus
	cmake . -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWANT_DISTROBUILD=ON \
		-DWANT_CPP20=ON \
		-DWANT_GRAPHICSMAGICK=ON \
		-DWANT_PCH=ON \
		-DWANT_CCACHE=ON \
		-DWITH_PODOFO=ON
	cmake --build build
}

package() {
	cd ${_svnmod}/Scribus
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 scribus.desktop "${pkgdir}/usr/share/applications/scribus.desktop"
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}/usr/share/pixmaps/scribus.svg"
	rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
	ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
