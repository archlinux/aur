# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gambit
pkgver=15.1.1
pkgrel=7
pkgdesc="Tools for doing computation in game theory"
arch=('i686' 'x86_64')
url="http://www.gambit-project.org"
license=('GPL')
depends=('wxgtk2' 'python2')
makedepends=('git' 'cython2' 'gcc6')
source=("https://sourceforge.net/projects/$pkgname/files/gambit15/$pkgver/$pkgname-$pkgver.tar.gz" shared_ptr.diff)
sha256sums=('7ede51739dc868242886815bb875307f5e11bb3789f22c546d3c83194fe75a1c'
            'f0e2c746379c18b7643ca60565e355a8d2a95efb8823d2f4a63c3ac1f3bde076')
options=('!makeflags')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/shared_ptr.diff
}

build() {
  cd "$pkgname-$pkgver"
  aclocal
  libtoolize
  automake --add-missing
  autoconf
  CC=gcc-6 CXX=g++-6 CFLAGS=" -fstack-protector" \
    CXXFLAGS=" -fstack-protector" ./configure --prefix=/usr --disable-enumpoly
  make
  cd src/python
  python2 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  cd src/python
  python2 setup.py install --root="$pkgdir"
}
