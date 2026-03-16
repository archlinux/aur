# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-unstable
_pkgname=scribus
pkgver=1.7.2
pkgrel=5
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
		"28bd3be104c06b9d4532affe150f7b74fe5b3e59.patch"
		"9e0a29e950195ca674581362675a8d35e1f7dc51.patch")
sha256sums=('9d8e11cc6bac2cd96c5539efbd719222ff7f70e1c185972880d9fb3051e138d0'
            'SKIP'
            '2ae78ed1702ae2b04bb4b8fec645513b0c61f28ec563a0a0d0c03519931a7b51'
            '1033a512dd6f3d87fe188ee0281baff57226b8b58257f0865139ffbef454d346')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/28bd3be104c06b9d4532affe150f7b74fe5b3e59.patch"
  patch -p1 < "${srcdir}/9e0a29e950195ca674581362675a8d35e1f7dc51.patch"
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
