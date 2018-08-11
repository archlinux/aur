# Maintainer: 
_pkgname=simutron-code
pkgname=simutron-svn
pkgver=292M
pkgrel=1
pkgdesc="AVR simulator IDE based on simavr"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/simutron/"
license=('GPL3')
depends=('simavr' 'qt5-base' 'libelf')
makedepends=('svn' 'cmake')
source=("${_pkgname}::svn+https://svn.code.sf.net/p/simutron/code/trunk/"
        "firmware.patch")
md5sums=('SKIP'
         '2305b55755a023ce33fdc2d35e77e050')

pkgver() {
  cd "$srcdir/$_pkgname/"
  echo $(svnversion)
}

prepare() {
  tmpdir="$srcdir/$_pkgname/src/components/integrated/avrmcu/"
  cp firmware.patch "$tmpdir"
  cd "$tmpdir"
  patch -p0 < firmware.patch
  rm firmware.patch
}

build() {
  cd "$srcdir/$_pkgname/build"
  PREFIX=/usr/
  #qmake -set prefix /usr/
  qmake PREFIX=/usr/
  make -j $(nproc)
  cd "$srcdir/$_pkgname/build"
}

package() {
  cd "$srcdir/$_pkgname/build"
  make INSTALL_ROOT="$pkgdir/" install
} 
