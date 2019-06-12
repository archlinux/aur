# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda-hg
pkgver=r1530.5893d36df5d9
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes -- latest build from hg-repo."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
conflicts=('yoda')
provides=('yoda')
source=('yoda::hg+https://phab.hepforge.org/source/yodahg')
md5sums=('SKIP')

build() {
	cd "$srcdir/yoda"
        autoreconf -i
        ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
        ## will eventually be fixed upstream
        touch pyext/yoda/*.pyx
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/yoda"
	make DESTDIR="$pkgdir/" install

        # If python2 is present, also build a library for it
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr
          make DESTDIR="$pkgdir/" install
        fi
        
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}

pkgver() {
	cd "$srcdir/yoda"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
