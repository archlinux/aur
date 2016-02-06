# Author: Ondřej Hošek <ondra.hosek@gmail.com>

pkgname=lib32-isl-git
_gitname=isl
pkgver=0.16.1.20.gee54b48
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (development version)"
arch=('i686' 'x86_64')
url="http://isl.gforge.inria.fr/"
depends=('isl-git')
makedepends=('git' 'gcc-multilib')
license=('MIT')
options=('!libtool')
provides=('lib32-isl')
conflicts=('lib32-isl')
source=('git://repo.or.cz/isl.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed -e 's|^isl-||' -e 's|-|.|g'
}

build() {
  cd "$_gitname"

  export CC="gcc -m32"
  export CXX="g++ -m32"

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

check() {
  cd "$_gitname"
  make check
}

package() {
  cd "$_gitname"
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib32/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib32/libisl.so.15.1.1-gdb.py

  rm -rf "$pkgdir/usr/include"
}
