# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-unstable
_pkgname=scribus
pkgver=1.7.3
pkgrel=2
pkgdesc="A desktop publishing program - Unstable branch 1.7.x"
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
	libjpeg
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
	podofo
	poppler
	python
	qt6-5compat
	qt6-base
	qt6-svg
	qt6-tools
	zlib
)
makedepends=(cmake boost)
optdepends=(
	'hyphen: for hyphenation support'
)
conflicts=('scribus')
provides=('scribus')
source=("https://sourceforge.net/projects/scribus/files/scribus-devel/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
		"https://github.com/scribusproject/scribus/commit/14a287fc1db2a44abfe1743260554447b31b4adf.patch")
sha256sums=('882ee55ca4497c02c4e05f30acc689ea1f485c2e8023c9eb293f51c2c5be06ad'
            'SKIP'
            'f1b3150a4da6fb634cded0d4fd111974324ad9af458b758c9f2eb41a1c475d88')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/14a287fc1db2a44abfe1743260554447b31b4adf.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
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
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 scribus.desktop "${pkgdir}/usr/share/applications/scribus.desktop"
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}/usr/share/pixmaps/scribus.svg"
	rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
	ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
