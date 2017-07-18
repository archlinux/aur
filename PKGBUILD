pkgname=nlopt
pkgver=2.4.2
pkgrel=2
pkgdesc="nonlinear optimization library"
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/NLopt"
license=('LGPL')
depends=('gcc-libs')
makedepends=('python-numpy' 'octave' 'guile' 'swig')
optdepends=('octave: to use with octave',
            'python: to use with python',
            'guile: to use with guile')
options=()
source=("http://ab-initio.mit.edu/nlopt/$pkgname-$pkgver.tar.gz"
        '131148eb02b770da0e5c1049b4e82c78e4a50fa2.patch')
md5sums=('d0b8f139a4acf29b76dbae69ade8ac54'
         '91934669632c13c8dee40bc5a5dfcfb0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir"/131148eb02b770da0e5c1049b4e82c78e4a50fa2.patch
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  mkdir -p build_cxx
  cd build_cxx
  ../configure --prefix=/usr --enable-shared --with-cxx --enable-maintainer-mode --without-guile --without-matlab
  make
  cd ..
  mkdir -p build
  cd build
  ../configure --prefix=/usr --enable-shared --without-python --without-guile --without-matlab
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build_cxx"
  make DESTDIR="$pkgdir" install
  cd ../build
  make DESTDIR="$pkgdir" install
}

