pkgname=openturns
pkgver=1.7rc1
pkgrel=1
pkgdesc="Uncertainty treatment library in C++/Python"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'muparser' 'intel-tbb' 'hmat-oss' 'python' 'nlopt')
optdepends=('r: plotting, linear model and statistical tests'
            'python-matplotlib: nicer plotting')
makedepends=('python-sphinx' 'r' 'cmake' 'swig' 'boost')
backup=('etc/openturns/openturns.conf')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha1sums=('f27b586ebb2028fb2f67d57a86d0745538ecd65a')

build() {
  cd openturns-$pkgver
  R CMD INSTALL --library=$PWD utils/rot_1.4.6.tar.gz
  export R_LIBS=$PWD
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIPT_INSTALL_RPATH=ON \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        .
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

