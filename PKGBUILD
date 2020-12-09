# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.8.5
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz yoda-pyroot.patch)
md5sums=('420abe730380f7e0c3221b1357ee0ae4'
         '1c0789c6e701dde0c1b28a9b30a21120')

package() {
  cd "$srcdir/YODA-$pkgver"

  ## patch for apparent building problems with new ROOT structure?
  patch -p1 < $srcdir/yoda-pyroot.patch

  # ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
  # ## will eventually be fixed upstream (1.9.x)
  touch pyext/yoda/*.pyx

  ./configure --prefix=/usr
  make DESTDIR="$pkgdir/" install

  mkdir -p $pkgdir/etc/bash_completion.d
  mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}
