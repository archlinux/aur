# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sword-svn
pkgver=3467
pkgrel=1
pkgdesc="Libraries for Bible programs - svn-version"
arch=('i686' 'x86_64')
url="http://www.crosswire.org/sword/"
license=('GPL')
depends=('curl' 'clucene' 'xapian-core')
makedepends=('subversion')
provides=('sword')
conflicts=('sword')
source=('sword::svn+https://www.crosswire.org/svn/sword/trunk/' includes.patch)
sha256sums=('SKIP'
            '9058e7cb9383e5107efd6a52d617618d34635dbf685199f11ec5482157241b74')
options=('!makeflags')
_svnmod=sword

pkgver() {
  cd "${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${_svnmod}"
  patch -Np0 < $srcdir/includes.patch || true
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
