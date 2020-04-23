# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.8.1
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('4a2f0b5562bad12e02b656dac6fd62f6')

package() {
  cd "$srcdir/YODA-$pkgver"
  # ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
  # ## will eventually be fixed upstream (1.9.x)
  touch pyext/yoda/*.pyx

  # If python2 is present, also build a library for it
  # Have to do this first, such that files like yoda-config get overwritten with the "proper" Python3 version
  if [ -x /usr/bin/python2 ]; then
    PYTHON=/usr/bin/python2 ./configure --prefix=/usr
    make DESTDIR="$pkgdir/" install
    make clean
  fi

  ./configure --prefix=/usr
  make DESTDIR="$pkgdir/" install

  mkdir -p $pkgdir/etc/bash_completion.d
  mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}
