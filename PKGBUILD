# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet-git
pkgver=3.0.1.r207.g2818879d1
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators -- latest build from git repo"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
conflicts=('rivet')
provides=('rivet')
replaces=('rivet-hg')
depends=('python' 'yoda' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=('git+https://gitlab.com/hepcedar/rivet.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/rivet"
        autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/rivet"
	make DESTDIR="$pkgdir/" install

        # If python2 is present, also build a library for it
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr
          make DESTDIR="$pkgdir/" install
        fi
        
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}

pkgver() {
	cd "$srcdir/rivet"
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/rivet\.//g'
}
