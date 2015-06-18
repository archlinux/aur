pkgname=openturns
pkgver=1.6rc1
pkgrel=1
pkgdesc="Uncertainty treatment library in C++/Python"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'muparser' 'intel-tbb' 'hmat-oss' 'python')
optdepends=('r: plotting, linear model, truncated normal distribution estimation and statistical tests'
            'python-matplotlib: nicer plotting')
makedepends=('python' 'python-sphinx' 'r' 'cmake' 'gcc-fortran' 'swig' 'boost')
backup=('etc/openturns/openturns.conf')
source=("http://downloads.sourceforge.net/sourceforge/openturns/openturns/openturns-$pkgver.tar.bz2")
sha1sums=('e424323b8c32e638cee0b3630fc3d531334bf419')

build() {
  cd openturns-$pkgver
  R CMD INSTALL --library=$PWD utils/rot_1.4.6.tar.gz
  export R_LIBS=$PWD
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DUSE_SPHINX=OFF . # latest sphinx has a bug
  make
}

package() {
  cd openturns-$pkgver
  install -d "$pkgdir"/usr/lib/R/library/
  cp -r rot "$pkgdir"/usr/lib/R/library/
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/openturns-$pkgver/COPYING* $pkgdir/usr/share/licenses/$pkgname
}

