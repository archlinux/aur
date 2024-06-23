pkgname=openturns
pkgver=1.23
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'onetbb' 'libcuba' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo')
makedepends=('cmake' 'swig' 'boost' 'spectra' 'nanoflann')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('4c7cfe5d2310933e3a2e91f7db9531d80e32157143157df80f6e93267c29f414')

prepare() {
  cd openturns-$pkgver
  # numpy 2.0
  curl -L https://github.com/openturns/openturns/commit/a7e812e65b5b8150cc36468da9d52a020e8a084e.patch | patch -p1
}

build() {
  cd openturns-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
        -DOPENTURNS_SYSCONFIG_PATH=/etc \
        -DUSE_SPHINX=OFF \
        -DCMAKE_UNITY_BUILD=ON -DCMAKE_UNITY_BUILD_BATCH_SIZE=32 \
        -DSWIG_COMPILE_FLAGS="-O1" \
        .
  make
}

package() {
  cd openturns-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 "$srcdir"/openturns-$pkgver/COPYING* $pkgdir/usr/share/licenses/$pkgname
}

