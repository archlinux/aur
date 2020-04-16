# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=3.1.0
pkgrel=3
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL3')
depends=('python' 'yoda>=1.8.0' 'fastjet' 'gsl' 'hepmc3' 'fastjet-contrib')
optdepends=('texlive-core: Plotting functionality'
            'ghostscript: PDF plot output'
            'imagemagick: PNG plot output'
            'python2: For Python2 module in addition to Python3')
makedepends=('cython')
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz
        https://gitlab.com/hepcedar/rivet/-/commit/900d209692893606e52d92ec37375b5131d5b1f0.diff
        https://gitlab.com/hepcedar/rivet/-/commit/6dc3735a2dfe4aa80e64afe0a169366f0db1016d.diff
        rivet-3-1-0-with-hepmc-3-2-1-MR85.patch)
md5sums=('d5eb0e69aa3fdf44f5925419e0d40dc9'
         'df1ee13b5566464377d9a697bf696c42'
         '33be87d5ea7f658b916e43dde3bbc3f8'
         'e10f1d04be0c091a13fb2091842c2eb3')

build() {
	cd "$srcdir/Rivet-$pkgver"
        patch -p1 < ../900d209692893606e52d92ec37375b5131d5b1f0.diff
        patch -p1 < ../6dc3735a2dfe4aa80e64afe0a169366f0db1016d.diff
        patch -p1 < ../rivet-3-1-0-with-hepmc-3-2-1-MR85.patch
	./configure --prefix=/usr --with-hepmc3=/usr
	make
}

package() {
	cd "$srcdir/Rivet-$pkgver"
	make DESTDIR="$pkgdir/" install

        # If python2 is present, also build a library for it
        if [ -x /usr/bin/python2 ]; then
          PYTHON=/usr/bin/python2 ./configure --prefix=/usr --with-hepmc3=/usr
          make DESTDIR="$pkgdir/" install
        fi
        
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}
