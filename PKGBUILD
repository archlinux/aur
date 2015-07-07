# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=rivet-hg
pkgver=r4803.18d522e5cb21
pkgrel=1
pkgdesc="A particle physics package for data analysis and validation of Monte Carlo event generators -- latest build from hg-repo"
arch=('x86_64' 'i686')
url="http://rivet.hepforge.org"
license=('GPL2')
conflicts=('rivet')
provides=('rivet')
depends=('python2' 'yoda-hg' 'fastjet' 'gsl' 'hepmc')
makedepends=('cython2' 'boost' 'mercurial' 'autoconf' 'libtool' 'automake')
source=('hg+https://rivet.hepforge.org/hg/rivet')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/rivet"
        sed -e 's/\/usr\/bin\/env python$/\/usr\/bin\/env python2/g' -i bin/* doc/* pyext/setup.py.in pyext/rivet/spiresbib.py
        sed -e 's/cython /cython2 /g' -i pyext/rivet/Makefile.am
}

build() {
	cd "$srcdir/rivet"
        export PYTHON=/usr/bin/python2
        autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/rivet"
	make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/Rivet/rivet-completion $pkgdir/etc/bash_completion.d
}

pkgver() {
	cd "$srcdir/rivet"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
