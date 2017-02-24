pkgname=guile-reader
_gitname=guile-reader
pkgver=0.6.1.5.ga4d3e18
pkgrel=1
pkgdesc="a simple framework for building readers for GNU Guile"
url="http://www.nongnu.org/guile-reader"
arch=('i686' 'x86_64')
license=('GPL')
depends=('guile')
makedepends=('gperf' 'git')
source=("git://git.sv.gnu.org/guile-reader.git#commit=a4d3e18" reader_flag.patch)
md5sums=('SKIP'
         '577ee71c71dda2ac1fdd942dd18adc82')

pkgver() {
  cd $_gitname
  git describe | tr - . | cut -c2-
}

prepare() {
  cd $_gitname
  patch -Np1 < $srcdir/reader_flag.patch
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
  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/info/dir
}
