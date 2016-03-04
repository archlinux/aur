# Maintainer: Marco Pompili < marcs (dot) pompili (at) gmail (dot) com >
# Contributor: Giorgio Gilestro crocowhile@gmail.com

pkgname=sphinxbase
pkgver=5prealpha
pkgrel=4
pkgdesc='Common library for sphinx speech recognition.'
url='http://cmusphinx.sourceforge.net/'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('bison' 'swig')
depends=('lapack' 'libpulse' 'libsamplerate') #not sure if libsamplerate is needed
source=("http://downloads.sourceforge.net/project/cmusphinx/${pkgname}/${pkgver}/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cmusphinx/sphinxbase/master/LICENSE")
md5sums=('ea27ea80bc14b96ad0a55fd5c94025d5'
         '469fd92fa8cd1d4ca7ee0fe7435af689')
options=('!libtool')

prepare() {
  cd "$pkgname-$pkgver"

  msg2 "Reconfiguring project for Automake v1.15"
  autoreconf -ivf > /dev/null

  cd ..

  cp -R "$pkgname-$pkgver" "$pkgname-$pkgver-py2"
  cp -R "$pkgname-$pkgver" "$pkgname-$pkgver-py3"
}

build() {
  cd "$pkgname-$pkgver-py2"

  msg2 "Building Sphinxbase with Python 2 bindings..."
  ./configure --prefix=/usr
  make

  cd "../$pkgname-$pkgver-py3"
  msg2 "Building Sphinxbase with Python 3 bindings..."
  export PYTHON=/usr/bin/python2
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver-py2"

  msg2 "Installing Sphinxbase with Python 2 bindings"
  make DESTDIR="$pkgdir/" install

  msg2 "Installing Python 3 bindings"
  cd "../$pkgname-$pkgver-py3/swig"
  make DESTDIR="$pkgdir/" install

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "${srcdir}/LICENSE" \
                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  libtool --finish "$pkgdir/usr/lib"
  libtool --finish "$pkgdir/usr/lib/python2.7/site-packages/sphinxbase"
  libtool --finish "$pkgdir/usr/lib/python3.5/site-packages/sphinxbase"
}
