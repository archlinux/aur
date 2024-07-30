# Maintainer: fncnt <aur at vncnt dot eu>

pkgbase=rnablueprint
pkgname=('rnablueprint' 'python-rnablueprint' 'perl-rnablueprint') #'python2-rnablueprint')
pkgName=('RNAblueprint')
pkgver=1.3.3
pkgrel=2
pkgdesc="Library for uniform sampling of RNA sequences given structural and sequence constraints"
arch=('x86_64')
url="https://github.com/ViennaRNA/RNAblueprint/"
license=('GPL-3.0-only')
groups=('viennarna-package')
depends=('boost-libs')
         #'glibc' #implicitly satisfied, can't be uninstalled
         #'gcc-libs' # transitively satisvied via boost-libs
makedepends=('boost'
             'swig' 
             'perl'
             'python')
             #'python2')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/ViennaRNA/RNAblueprint/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('a469e99274266e1321694319133b52d6')
sha1sums=('c26534952f1a269d648f4b43b5f1a8a3d954f62c')
sha256sums=('92891e6da5b03fb4b200d219a3d49532cecc70cddb641e7280275fc3e9c0253b')

prepare() {
  cd "$srcdir/$pkgName-$pkgver"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgName-$pkgver"
  ./configure --prefix=/usr --disable-python2
  make
}

check() {
  cd "$srcdir/$pkgName-$pkgver"
  make -k check
}

package_rnablueprint() {
  # adding $pkgName as the provided binary
  provides=("libRNAblueprint.so=${pkgver}" "$pkgName")
  cd "$srcdir/$pkgName-$pkgver"
  cd src
  make DESTDIR="$pkgdir" install
  cd ../lib
  make DESTDIR="$pkgdir" install
}

package_python-rnablueprint() {
  pkgdesc+=" (Python bindings)"
  depends+=('python')
  cd "$srcdir/$pkgName-$pkgver"
  cd interfaces/Python3
  make DESTDIR="$pkgdir" install
}

#package_python2-rnablueprint() {
#  pkgdesc+=" (Python 2 bindings)"
#  depends+=('python2')
#  cd "$srcdir/$pkgName-$pkgver"
#  cd interfaces/Python2
#  make DESTDIR="$pkgdir" install
#}

package_perl-rnablueprint() {
  pkgdesc+=" (Perl bindings)"
  depends+=('perl>=5.23.0-3')
  cd "$srcdir/$pkgName-$pkgver"
  cd interfaces/Perl
  make DESTDIR="$pkgdir" install
}
