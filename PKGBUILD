# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=2.7.1
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=1.7.5' 'fastjet' 'gsl' 'hepmc')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz)
md5sums=('761cfe8b6500f89131b293cf6d31a3b4')

build() {
	cd "$srcdir/Rivet-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/Rivet-$pkgver"
	make DESTDIR="$pkgdir/" install

        # If python2 is present, also build a library for it
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr
          make DESTDIR="$pkgdir/" install
        fi
        
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
