# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda
pkgver=1.7.4
pkgrel=2
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/yoda/YODA-$pkgver.tar.gz)
md5sums=('a832935890d95e748d626789a7e1c219')

build() {
	cd "$srcdir/YODA-$pkgver"
        ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
        ## will eventually be fixed upstream
        touch pyext/yoda/*.pyx
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/YODA-$pkgver"
	make DESTDIR="$pkgdir/" install

        # If python2 is present, also build a library for it
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr
          make DESTDIR="$pkgdir/" install
        fi
        
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}
