pkgname=openturns
pkgver=1.5
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
md5sums=('2622a0c0884014bf59cb6f34c48e7ff7')

prepare() {
  cd $pkgname-$pkgver
  2to3 --no-diffs -w python/test/t_*.py
}

build() {
  cd $pkgname-$pkgver
  R CMD INSTALL --library=$PWD utils/rot_1.4.5.tar.gz
  export R_LIBS=$PWD
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_HMAT=OFF \ # ot 1.5 cannot use latest hmat 107
        -DOPENTURNS_SYSCONFIG_PATH=/etc .
  make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/lib/R/library/
  cp -r rot "$pkgdir"/usr/lib/R/library/
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/openturns-$pkgver/COPYING* $pkgdir/usr/share/licenses/$pkgname
}

