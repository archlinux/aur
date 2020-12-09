# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet
pkgver=3.1.3
pkgrel=1
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
source=(http://www.hepforge.org/archive/rivet/Rivet-$pkgver.tar.gz
        https://gitlab.com/hepcedar/rivet/-/commit/3203bf12a4bef81f880789eb9cde7ff489ae5115.diff
        https://gitlab.com/hepcedar/rivet/-/commit/476f267c46b126fa163a92aa6cbcb7806c4624c3.diff
        )
md5sums=('4738ae56037ce7edfedc2fe59432563c'
         'f38fb653e6927c0a3103abe7015f4372'
         '4873c74c63650765c2d5270197978e05')

package() {
	cd "$srcdir/Rivet-$pkgver"

        patch -p1 < ../3203bf12a4bef81f880789eb9cde7ff489ae5115.diff
        patch -p1 < ../476f267c46b126fa163a92aa6cbcb7806c4624c3.diff

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
