# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=cloog-git
_origpkgname=cloog
pkgver=0.18.4
pkgrel=3
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64')
url="http://www.bastoul.net/cloog/"
license=('GPL')
source=('cloog-0.18.4::git+http://repo.or.cz/cloog.git#branch=master')
provides=('isl15' 'cloog')
conflicts=('isl15' 'isl' 'cloog')
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  git submodule init
  git submodule update --recursive
  sh autogen.sh
  ./configure --prefix=/usr --with-isl --with-osl
  make
}

check() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  # There are certain race conditions on running the tests, so we restrict
  # it to one job (one CPU core).
  make -j1 check
}

package() {
  cd "${srcdir}/${_origpkgname}-${pkgver}"
  make DESTDIR=$pkgdir/ install
}
