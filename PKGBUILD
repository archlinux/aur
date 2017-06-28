# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=pythonmagick
pkgver=0.9.17
pkgrel=1
pkgdesc="Object-oriented Python bindings for the ImageMagick library"
arch=('i686' 'x86_64')
url="http://www.imagemagick.org/"
license=('custom')
depends=('boost' 'python' 'imagemagick')
makedepends=('perl' 'automake')
options=('!libtool')
source=("http://www.imagemagick.org/download/python/PythonMagick-$pkgver.tar.gz")
md5sums=('685c24cf63c7411840c743ad2d6fd74b')

build() {
  cd "$srcdir/PythonMagick-$pkgver"
  sed -i "s/-lboost_python\ /-lboost_python3\ /" Makefile.am
  perl autogen.pl

  CPPFLAGS="`python-config --includes`" \
  PYTHON_LIB="`python-config --libs`" \
  ./configure --prefix=/usr --with-boost-python=boost_python3
  # --with-boost-python=boost_python3 has no effect, therefore sed above

  make
}

package() {
  cd "$srcdir/PythonMagick-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pythonmagick/LICENSE"
}
