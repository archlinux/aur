# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scribus-svn
pkgver=22789
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=('hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick'
	 'poppler' 'libcdr' 'libvisio' 'libpagemaker' 'harfbuzz-icu'
	 'qt5-declarative' 'libmspub' 'openscenegraph' 'libwmf'
	 'desktop-file-utils')
makedepends=('subversion' 'cmake' 'qt5-tools')
optdepends=('lib2geom: for mesh distortion')
conflicts=('scribus')
provides=('scribus')
source=('scribus::svn://scribus.net/' python2.patch)
sha256sums=('SKIP'
            'c28a5dd091d8185454166eebbdf0a230dca7ad214742dcf35d7ffaed7a586516')
_svnmod='scribus'

pkgver() {
  cd ${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $_svnmod
  patch -Np1 < "$srcdir"/python2.patch || true
}

build() {
  cd $_svnmod/Scribus
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
	-DCMAKE_SKIP_RPATH:BOOL=YES \
	-DWANT_GRAPHICSMAGICK:BOOL=YES \
	-DCMAKE_LIBRARY_PATH:PATH=/usr/lib \
	-DCMAKE_INCLUDE_PATH:PATH=/usr/include/python2.7 \
	-DCMAKE_EXE_LINKER_FLAGS:STRING="-lQt5Quick -lQt5PrintSupport" \
	-DCMAKE_APPDATA_DIR:PATH=/usr/share/appdata \
	-DQT_PREFIX:PATH="/usr" -DWANT_SVNVERSION:BOOL=YES \
	
  make
}

package () {
  cd "$srcdir"/$_svnmod/Scribus
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 scribus.desktop $pkgdir/usr/share/applications/scribus.desktop
  install -d "${pkgdir}"/usr/share/pixmaps
  ln -s /usr/share/scribus/icons/1_5_0/scribus.png "${pkgdir}"/usr/share/pixmaps/scribus.png
  # move around some picture files
  for _i in AppIcon.png AllCaps.png Kapital.xpm Strike.xpm \
		       outlined.png shadow.png shade.png Revers.png zeichen.png
  do install "$pkgdir"/usr/share/scribus/icons/1_5_0/$_i "$pkgdir"/usr/share/scribus/icons/1_5_1/$_i
     rm "$pkgdir"/usr/share/scribus/icons/1_5_0/$_i
  done
}
