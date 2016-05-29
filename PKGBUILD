# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sword-svn
pkgver=3420
pkgrel=2
pkgdesc="Libraries for Bible programs - svn-version"
arch=('i686' 'x86_64')
url="http://www.crosswire.org/sword/"
license=('GPL')
depends=('curl' 'clucene' 'xapian-core')
makedepends=('subversion')
provides=('sword')
conflicts=('sword')
source=('sword::svn+https://www.crosswire.org/svn/sword/trunk/' template-depth.diff)
md5sums=('SKIP'
         '65e98f76aedd0829caed453cd50a6521')
options=('!makeflags')
_svnmod=sword

pkgver() {
  cd "${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_svnmod}"
  patch -p2 < "$srcdir"/template-depth.diff
}
  
build() {
  cd "$_svnmod"  
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --sysconfdir=/etc 
  make
}

package() {
  cd "$_svnmod"
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install_config
}
