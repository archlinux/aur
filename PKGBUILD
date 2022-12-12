pkgname=openturns
pkgver=1.20
pkgrel=1
pkgdesc="Uncertainty treatment library"
license=('LGPL')
arch=('x86_64')
url="http://www.openturns.org/"
depends=('libxml2' 'tbb' 'hmat-oss' 'python-matplotlib' 'python-psutil' 'python-dill' 'nlopt' 'cminpack' 'ceres-solver' 'coin-or-bonmin' 'dlib' 'hdf5' 'primesieve' 'pagmo')
makedepends=('cmake' 'swig' 'boost' 'spectra')
source=("https://github.com/openturns/openturns/archive/v$pkgver.tar.gz")
sha256sums=('2be5247f0266d153619b35dfb1eeeb46736c502dad993b40aff8857d6314f293')

prepare() {
  cd openturns-$pkgver
  curl -L https://github.com/openturns/openturns/commit/a85061f89a5763061467beac516c1355fe81b9be.patch | patch -p1
  curl -L https://github.com/openturns/openturns/commit/1dbdc4daca866c983f0234325f158f6c57fef02b.patch | patch -p1
  curl -L https://github.com/openturns/openturns/commit/067a3f6785c5a9070adb81df4d598e42562201f8.patch | patch -p1
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

