# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vicare-scheme-git
pkgver=20161107.bbfd37b
pkgrel=1
pkgdesc="R6RS scheme implementation, from github's master branch"
arch=('i686' 'x86_64')
url="http://marcomaggi.github.io/vicare.html"
license=('GPL3')
depends=('gmp' 'readline')
makedepends=('git')
provides=('vicare-scheme')
conflicts=('vicare-scheme')
source=("vicare-scheme::git+https://github.com/marcomaggi/vicare.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="vicare-scheme"

pkgver() {
  cd "$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "$_gitname"
  sh ./autogen.sh
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  ../configure --prefix=/usr --libexecdir=/usr/lib \
	       --enable-maintainer-mode --disable-rpath \
	       --with-libiconv --with-readline
  make
}

check() {
  cd "$_gitname"/build
  make check||true
}

package() {
  cd "$_gitname"/build
  make DESTDIR="$pkgdir" install
}
