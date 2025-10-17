# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-unstable
_pkgname=scribus
pkgver=1.7.0
pkgrel=7
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
source=("https://sourceforge.net/projects/scribus/files/scribus-devel/${pkgver}/${_pkgname}-${pkgver}.tar.xz"{,.asc}
		'fix_build_with_poppler_25.02.0.patch'
		'fix_build_with_qt_6.9.0.patch'
		'fix_build_with_poppler_25.06.0.patch'
		'fix_build_with_poppler_25.07.0.patch'
		'fix_build_with_poppler_25.09.0.patch'
		'fix_build_with_poppler_25.10.0.patch'
		'0001-Fix-build-with-Qt-6.10.patch')
sha256sums=('fa59d6221ff7cffa9372357997e86570162e1e18913736b7176fd10f48c243f6'
            'SKIP'
            '2d9bf20f0653b7ff498865215fa4bc5d9f8291e92e3c6d7e385b029e47212751'
            '05f1f22a6274089f20af88fe978335490eb4ed27b71eb8355dc596b60dc66833'
            '59fc92d5ffd0da221e71fd634b6af68be2365ccb382687c795dce0f8d6355c0d'
            '167769e255f8994d86094b45e9723145028f98dd2f0fa1a1ddd3a04beb982d2a'
            '53be1392c55ea5041e8b8b17d35b422e093cb325a1d317f2ff32456a1c586e92'
            '689edf58294d1f51478b254fc7cbf93410886370148f3b3beb612386ecd446b3'
            'e12d1fdb984de38897439b40650583312c03682124fae87fc23a1fa73271f3f4')
validpgpkeys=(5086B8D68E70FDDF4C40045AEF7B95E7F60166DA  # Peter Linnell <plinnell@scribus.net>
              757F5E9B13DD648887AD50092D47C099E782504E  # The Scribus Team (www.scribus.net) <the_scribus_team@scribus.net>
              6558BE84D27273A438A151198BEA48118AEBEE64) # Craig Bradney <cbradney@zipworld.com.au>

prepare() {
  
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -Np1 -i "$srcdir/fix_build_with_poppler_25.02.0.patch"
  patch -Np1 -i "$srcdir/fix_build_with_qt_6.9.0.patch"
  patch -Np1 -i "$srcdir/fix_build_with_poppler_25.06.0.patch"
  patch -Np2 -i "$srcdir/fix_build_with_poppler_25.07.0.patch"
  patch -Np1 -i "$srcdir/0001-Fix-build-with-Qt-6.10.patch"
  cd "${srcdir}/${_pkgname}-${pkgver}/scribus/plugins/import/pdf"
  patch -Np0 -i "$srcdir/fix_build_with_poppler_25.09.0.patch"
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/fix_build_with_poppler_25.10.0.patch"
}

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
  ln -s /usr/share/scribus/icons/1_7_0/scribus-icon.svg "${pkgdir}"/usr/share/pixmaps/scribus.svg

  rm -rf "${pkgdir}/usr/share/scribus/dicts/hyph"
  ln -sf /usr/share/hyphen "${pkgdir}/usr/share/scribus/dicts/hyph"
}
