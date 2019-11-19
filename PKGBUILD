# Maintainer: Frank Siegert <frank.siegert@cern.ch>
pkgname=yoda-git
pkgver=1.7.7.r31.g63722a29
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes -- latest build from git repo."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL3')
depends=('python')
optdepends=('python2: For Python2 module in addition to Python3')
makedepends=('cython')
conflicts=('yoda')
provides=('yoda')
replaces=('yoda-hg')
source=('git+https://gitlab.com/hepcedar/yoda.git')
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
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/yoda\.//g'
}
