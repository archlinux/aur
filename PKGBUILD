# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vicare-scheme-git
pkgver=20180130.58409619
pkgrel=1
pkgdesc="R6RS scheme implementation, from github's master branch"
arch=('i686' 'x86_64')
url="http://marcomaggi.github.io/vicare.html"
license=('GPL3')
depends=('gmp' 'readline')
makedepends=('git')
provides=('vicare-scheme')
conflicts=('vicare-scheme')
source=("vicare-scheme::git+https://github.com/marcomaggi/vicare.git" docsfix.patch)
sha256sums=('SKIP'
            '1d410fc2e600aea54af3ce63a6f74b72ce5938610b6515582d48a5a15eb83240')
options=('!makeflags')
_gitname="vicare-scheme"

pkgver() {
  cd "$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "$_gitname"
  git apply "$srcdir"/docsfix.patch
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
