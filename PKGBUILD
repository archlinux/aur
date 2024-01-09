# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Miguel Revilla Rodríguez <yo at miguelrevilla.com>

pkgname=scribus-svn
pkgver=25993
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=(	boost
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
makedepends=(cmake subversion qt6-tools)
optdepends=()
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
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DWANT_GRAPHICSMAGICK:BOOL=YES \
	-DCMAKE_LIBRARY_PATH:PATH=/usr/lib/qt6 \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE \
	-DQT_PREFIX:PATH="/usr" \
	-DWANT_SVNVERSION:BOOL=YES \
	-DWANT_CPP17:BOOL=YES \
	-DWANT_CPP17=ON \
	-DWITH_PODOFO=ON \
  make
}

package () {
  cd $_svnmod/Scribus
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 scribus.desktop "$pkgdir"/usr/share/applications/scribus.desktop
  install -d "$pkgdir"/usr/share/pixmaps
  ln -s /usr/share/scribus/icons/1_5_0/scribus.png "$pkgdir"/usr/share/pixmaps/scribus.png
  # move around some picture files
  for _i in AppIcon.png AllCaps.png Kapital.xpm Strike.xpm \
		       outlined.png shadow.png shade.png Revers.png zeichen.png
  do install "$pkgdir"/usr/share/scribus/icons/1_5_0/$_i "$pkgdir"/usr/share/scribus/icons/1_5_1/$_i
     rm "$pkgdir"/usr/share/scribus/icons/1_5_0/$_i
  done
}
