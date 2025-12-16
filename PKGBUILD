# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-unstable
_pkgname=scribus
pkgver=1.7.1
pkgrel=1
pkgdesc="A desktop publishing program - Unstable branch 1.7.x"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=(	boost-libs
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
			libjxl
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
			qt6-5compat
			qt6-base
			qt6-declarative
			qt6-imageformats
			qt6-svg
			zlib
		)
makedepends=(cmake qt6-tools boost)
optdepends=()
conflicts=('scribus')
provides=('scribus')
source=("https://sourceforge.net/projects/scribus/files/scribus-devel/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('b5bf788989279ee7c6e7bda88ce8276ef93b00272248881ec166795b13ae41b0'
            'SKIP')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

build() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DWANT_GRAPHICSMAGICK:BOOL=YES \
	-DCMAKE_LIBRARY_PATH:PATH=/usr/lib/qt6 \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE \
	-DQT_PREFIX:PATH="/usr" \
	-DWANT_CPP20:BOOL=YES \
	-DWANT_CPP20=ON \
	-DWITH_PODOFO=ON

  make
}

package() {

  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -Dm644 scribus.desktop "${pkgdir}"/usr/share/applications/scribus.desktop
  install -d "${pkgdir}"/usr/share/pixmaps
  ln -s /usr/share/scribus/icons/1_7_1/scribus-icon.svg "${pkgdir}"/usr/share/pixmaps/scribus.svg

  rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
  ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
