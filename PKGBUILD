# Contibutor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=librep-git
pkgver=0.92.5.7.gc0d51b4
pkgrel=1
pkgdesc='A lisp system for sawfish - git version.'
arch=('i686' 'x86_64')
url='http://sawfish.wikia.com'
license=('GPL')
depends=('gmp' 'gdbm')
makedepends=('git')
provides=("librep=$pkgver")
conflicts=('librep')
options=('!libtool' '!makeflags')
install=librep.install
source=('git://github.com/SawfishWM/librep.git')
sha256sums=('SKIP')
_gitname='librep'

pkgver() {
  cd "$_gitname"
  echo $(git describe --always |sed 's/-/./g'|cut -c8-)
}

build() {
  cd "$_gitname"
  ./autogen.sh 
  ./configure --disable-static \
              --prefix=/usr \
              --libexecdir=/usr/lib/$pkgname  \
              --with-readline \
	      --with-ffi 
  sed -i 's#makeinfo --no-split#makeinfo --force --no-split#' man/Makefile
  make 
}
package() {
  cd $_gitname
  # create some directories or make install fails
  install -d $pkgdir/usr/{share/aclocal,lib/pkgconfig}
  make DESTDIR=$pkgdir install
} 
