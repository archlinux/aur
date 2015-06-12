# Maintainer: Michael Schubert <mschu.dev at gmail>
# patched according to http://mail.python.org/pipermail/pythondotnet/2011-May/001132.html

pkgname=pythonnet-svn
pkgver=r159
pkgrel=1
pkgdesc="Call .NET Common Language Runtime (CLR) from Python"
arch=('i686' 'x86_64')
url="http://pythonnet.sourceforge.net/"
license=('LGPL')
depends=('python2' 'mono')
makedepends=('svn')
source=($pkgname::svn+https://pythonnet.svn.sourceforge.net/svnroot/pythonnet/trunk/pythonnet 'pythonnet.patch')
md5sums=('SKIP'
         'a0f99e5275dbfe8e3a37ceaae9299f5b')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p0 --strip 1 < ../pythonnet.patch
  make realclean # remove clrmodule.il
}

build() {
  cd "$srcdir/$pkgname"
  make PYTHON=python2
}

package() {
  cd "$srcdir/$pkgname"
  make PYTHON=python2 DESTDIR="$pkgdir" install
}

