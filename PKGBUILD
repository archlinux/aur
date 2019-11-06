# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet-hg
pkgver=r7598.b0777896b24b
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators -- latest build from hg-repo"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
conflicts=('rivet')
provides=('rivet')
depends=('python' 'yoda' 'fastjet' 'gsl' 'hepmc' 'fastjet-contrib')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=('rivet::hg+https://phab.hepforge.org/source/rivethg#branch=release-3-0-x')
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
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
