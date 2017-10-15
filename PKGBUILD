pkgname=openturns
pkgver=1.10rc1
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'muparser' 'intel-tbb' 'hmat-oss' 'python-matplotlib' 'nlopt' 'r')
makedepends=('cmake' 'swig' 'boost')
backup=('etc/openturns/openturns.conf')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('cb2b75f5a43a7c1984797d31e3c34ebe9a0fd80a675b06a18a2657606e6c1ce3')

build() {
  cd openturns-$pkgver
  R CMD INSTALL --library=$PWD utils/rot_1.4.6.tar.gz
  export R_LIBS=$PWD
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DUSE_SPHINX=OFF \
        -DUSE_COTIRE=ON -DCOTIRE_MAXIMUM_NUMBER_OF_UNITY_INCLUDES="-j8" \
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

