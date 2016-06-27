# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sword-svn
pkgver=3424
pkgrel=1
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
         '694aab1ea03c14f89101a0b98f5d50a4')
options=('!makeflags')
_svnmod=sword

pkgver() {
  cd "${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_svnmod}"
  patch -fp2 < "$srcdir"/template-depth.diff || true
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
