# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scribus-svn
pkgver=21790
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.scribus.net"
depends=('hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick'
	 'poppler' 'libcdr' 'libvisio' 'libpagemaker' 'harfbuzz-icu'
	 'qt5-declarative' 'libmspub' 'openscenegraph')
makedepends=('subversion' 'cmake' 'qt5-tools' 'dos2unix')
optdepends=('lib2geom: for mesh distortion')
conflicts=('scribus')
provides=('scribus')
source=('scribus::svn://scribus.net/trunk')
md5sums=('SKIP')
options=('!makeflags')
_svnmod='scribus'

pkgver() {
  cd "$srcdir"/${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir"/$_svnmod/Scribus/scribus/plugins/scriptplugin
  find . -type f -name "*.py" -exec sed -i '1s+python$+python2+' {} \;
  cd "$srcdir"/$_svnmod/Scribus/scribus/plugins/scriptplugin/scripts
  sed -i '1s+python+python2+' Ligatursatz.py
}

build() {
  LANG=C
  cd "$srcdir"/$_svnmod/Scribus
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK=1 \
    -DCMAKE_LIBRARY_PATH=/usr/lib \
    -DCMAKE_INCLUDE_PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS="-lQt5Quick -lQt5PrintSupport" \
    -DCMAKE_APPDATA_DIR=/usr/share/appdata \
    -DQT_PREFIX="/usr" -DWANT_SVNVERSION=1
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
  for i in AppIcon.png AllCaps.png Kapital.xpm Strike.xpm outlined.png shadow.png shade.png Revers.png
  do install "$pkgdir"/usr/share/scribus/icons/1_5_0/$i "$pkgdir"/usr/share/scribus/icons/1_5_1/$i
     rm "$pkgdir"/usr/share/scribus/icons/1_5_0/$i
  done
}
