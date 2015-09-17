# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=vicare-scheme-git
pkgver=20150916.9e72cdc
pkgrel=1
pkgdesc="R6RS scheme implementation, from github's master branch"
arch=('i686' 'x86_64')
url="http://marcomaggi.github.io/vicare.html"
license=('GPL3')
depends=('gmp')
makedepends=('git')
provides=('vicare-scheme')
conflicts=('vicare-scheme')
install=vicare-scheme.install
source=("vicare-scheme::git+https://github.com/marcomaggi/vicare.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="vicare-scheme"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "$srcdir"/"$_gitname"
  chmod 700 autogen.sh
  sed -i 's+@table @meta+@table @code+' doc/expander.texi
}

build() {
  cd "$srcdir"/"$_gitname"
  ./autogen.sh
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  ../configure --prefix=/usr --libexecdir=/usr/lib \
	 --enable-maintainer-mode
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
}
