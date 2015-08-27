# Maintainer: Keith Hughitt <khughitt@umd.edu>
pkgname=dafs-git
_gitname=dafs
pkgver=0.0.2.6.g8b19266
pkgrel=1
pkgdesc="DAFS: simultaneous aligning and folding of RNA sequences by dual
decomposition"
arch=('i686' 'x86_64')
url="https://github.com/satoken/dafs"
license=('GPL')
makedepends=('git')
depends=('boost' 'glpk' 'viennarna2')
md5sums=("SKIP")

source=("git://github.com/satoken/dafs.git")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  env CXXFLAGS='-fopenmp' ./configure --prefix=/usr --with-vienna-rna=/usr/include/ViennaRNA --with-glpk
 
  # https://github.com/SIPp/sipp/issues/61
  touch configure.ac aclocal.m4 configure Makefile.am Makefile.in

  make CXXFLAGS="-Wall -O2 -fpermissive -fopenmp" CFLAGS="$CFLAGS -I/usr/include/ViennaRNA" PREFIX=/usr
}

package() {
  cd "$srcdir/$_gitname"

  #make PREFIX="$pkgdir/usr" install
  make install DESTDIR="$pkgdir"

  # install license
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
}

