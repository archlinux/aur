pkgname=guile-reader-git
_gitname=guile-reader
pkgver=v0.6.1.r15.g506a51b
pkgrel=1
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=(i686 x86_64)
license=(gpl)
depends=(guile)
provides=(guile-reader)
conflicts=(guile-reader)
makedepends=(gperf git)
source=(git://git.sv.gnu.org/guile-reader.git)
md5sums=(SKIP)

pkgver() {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  # avoid "configure.ac:109: error: required file 'build-aux/config.rpath' not found"
  mkdir -p build-aux && touch build-aux/config.rpath
  # recreate configure and make files
  autoreconf -i --force --verbose
  # configure
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_SITE=/usr/share/guile/site ./configure --prefix=/usr --with-guilemoduledir=/usr/share/guile/site
  # compile
  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install
}
