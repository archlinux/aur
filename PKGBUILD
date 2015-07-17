# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scribus-svn
pkgver=20255
pkgrel=1
pkgdesc="A desktop publishing program - Version from SVN"
arch=('i686' 'x86_64')
license=('custom:(L)GPL')
url="http://www.scribus.net"
install=${pkgname}.install
depends=('qt5-webkit' 'hunspell' 'podofo' 'python2' 'libcups'
	 'graphicsmagick' 'shared-mime-info' 'poppler' 'libcdr' 
	 'desktop-file-utils' 'libvisio' 'libpagemaker')
makedepends=('subversion' 'cmake' 'qt5-tools')
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
}

build() {
  cd "$srcdir"/$_svnmod/Scribus
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK=1 \
    -DCMAKE_INCLUDE_PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS="-lQt5Quick -lQt5PrintSupport" \
    -DQT_PREFIX="/usr" 
  make
}

package () {
  cd "$srcdir"/$_svnmod/Scribus
  make DESTDIR="$pkgdir" install
  install -Dm644 scribus.desktop \
	  "$pkgdir"/usr/share/applications/scribus.desktop
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
