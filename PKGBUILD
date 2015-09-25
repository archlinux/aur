# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

# Contributor: Simo Huhtiranta <simo_huhtirantaATpp_inet_fi>  
# Contributor: Tilmann Becker <tilmann.becker@web.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=scribus1.5
pkgver=20421
pkgrel=1
pkgdesc="A desktop publishing program - Version 1.5 svn"
arch=('i686' 'x86_64')
license=('custom:(L)GPL')
url="http://www.scribus.net"
install=${pkgname}.install
depends=('hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick'
	 'shared-mime-info' 'poppler' 'libcdr' 'desktop-file-utils'
	 'libvisio' 'libpagemaker' 'qt5-declarative')
makedepends=('subversion' 'cmake' 'qt5-tools')
#conflicts=('scribus')
#provides=('scribus')
source=('scribus::svn://scribus.net/trunk' 'scribus1.5.desktop')
md5sums=('SKIP' 'SKIP')
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
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/opt \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK=1 \
    -DCMAKE_INCLUDE_PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS="-lQt5Quick -lQt5PrintSupport" \
    -DQT_PREFIX="/usr" 
  make
}

package () {
  install -Dm644 $pkgname.desktop \
	  "$pkgdir"/opt/share/applications/$pkgname.desktop
  cd "$srcdir"/$_svnmod/Scribus
  make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/opt/share/licenses/$pkgname/COPYING
}