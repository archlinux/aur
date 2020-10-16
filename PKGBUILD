# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=3.1.2
pkgrel=2
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=1.8.0' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz)
md5sums=('856079204e36e1c5e4077cf509c8490f')

package() {
	cd "$srcdir/Rivet-$pkgver"

        # If python2 is present, also build a library for it
        # Have to do this first, such that files like rivet-config get overwritten with the "proper" Python3 version
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr --with-hepmc3=/usr
          make DESTDIR="$pkgdir/" install
          make clean
        fi
        
	./configure --prefix=/usr --with-hepmc3=/usr
	make
        make DESTDIR="$pkgdir/" install

        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
