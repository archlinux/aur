# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet-hg
pkgver=r6396.6af72c1a196d
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators -- latest build from hg-repo"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
conflicts=('rivet')
provides=('rivet')
depends=('python' 'yoda>=1.7.1' 'fastjet' 'gsl' 'hepmc')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=('hg+https://rivet.hepforge.org/hg/rivet')
md5sums=('SKIP')

build() {
	cd "$srcdir/rivet"
        autoreconf -i
        ## need to rebuild Python extension code with up-to-date Cython for Python 3.7
        ## will eventually be fixed upstream
        touch pyext/rivet/*.pyx
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
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
