# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-unstable
_pkgname=scribus
pkgver=1.7.4
pkgrel=1
pkgdesc="A desktop publishing program - Unstable branch 1.7.x"
arch=('x86_64')
license=('GPL-2.0-or-later')
url="https://www.scribus.net"
depends=(
	cairo
	fontconfig
	freetype2
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
	libglvnd
	libjpeg.so
	libjxl
	libmspub
	libpagemaker
	libpng
	librevenge
	libtiff
	libvisio
	libqxp
	libxcb
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
makedepends=(cmake boost qt6-tools)
optdepends=(
	'hyphen-lang: hyphenation dictionaries for your language'
	'ghostscript: PostScript and EPS support'
	'tk: scripts using tkinter'
	'python-pillow: image support in bundled scripts'
)
conflicts=('scribus')
provides=("scribus=${pkgver}")
source=("https://sourceforge.net/projects/scribus/files/scribus-devel/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
        system-qtads.patch)
sha256sums=('1f9e0b62e38a2ba89cc71d6764b1ec3114f24125b717e45cce7ea7d99ab3fe6b'
            'SKIP'
            'eb38c4a94787588be0bbd9b33386041994134089c20a2364d8d0b1a2b85c3330')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -Np1 -i "${srcdir}/system-qtads.patch"
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
		-DWITH_PODOFO=ON
	cmake --build build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -d "${pkgdir}/usr/share/pixmaps"
	ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}/usr/share/pixmaps/scribus.svg"
	rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
	ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
