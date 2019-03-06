pkgname=nlopt
pkgver=2.5.0
pkgrel=3
pkgdesc="nonlinear optimization library"
arch=('x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/NLopt"
license=('LGPL')
depends=('gcc-libs')
makedepends=('python-numpy' 'octave' 'guile' 'swig' 'cmake')
optdepends=('octave: to use with octave',
            'python: to use with python',
            'guile: to use with guile')
source=("https://github.com/stevengj/nlopt/archive/v${pkgver}.tar.gz" 209.patch 245.patch)
sha256sums=('c6dd7a5701fff8ad5ebb45a3dc8e757e61d52658de3918e38bab233e7fd3b4ae' SKIP SKIP)

prepare () {
  cd "$srcdir/$pkgname-$pkgver"

  # fix guile extension
  patch -p1 -i "$srcdir"/209.patch

  # fix octave 5.x build
  patch -p1 -i "$srcdir"/245.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build_cxx && pushd build_cxx
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNLOPT_MATLAB=OFF -DNLOPT_CXX=ON -DNLOPT_SWIG=OFF ..
  make
  popd
  mkdir -p build && pushd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DNLOPT_MATLAB=OFF -DNLOPT_LINK_PYTHON=OFF ..
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  ctest --output-on-failure
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build_cxx"
  make DESTDIR="$pkgdir" install
  cd ../build
  make DESTDIR="$pkgdir" install
}

