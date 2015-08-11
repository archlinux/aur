pkgname=guile-reader-git
_gitname=guile-reader
pkgver=64a32bc
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
install=guile-reader.install

pkgver() {
  cd $_gitname
  git log -n 1 --pretty=format:"%h"
}

build() {
  cd $_gitname
  # avoid autoreconf failure
  mkdir -p build-aux
  touch build-aux/config.rpath
  # recreate configure and make files
  autoreconf -i --force --verbose
  # configure
  CFLAGS= CPPFLAGS= LDFLAGS= GUILE_SITE=/usr/share/guile/site ./configure --prefix=/usr --with-guilemoduledir=/usr/share/guile/site
  # compile
  make || return 1
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install || return 1
  rm $pkgdir/usr/share/info/dir
}
