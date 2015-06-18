# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=yoda-hg
pkgver=r1060.63c03a9d5e8f
pkgrel=1
pkgdesc="A particle physics package for data analysis (specifically histogramming) classes -- latest build from hg-repo."
arch=('x86_64' 'i686')
url="http://yoda.hepforge.org"
license=('GPL2')
conflicts=('yoda')
provides=('yoda')
depends=('python2')
makedepends=('cython2' 'boost' 'mercurial' 'autoconf' 'libtool' 'automake')
source=('hg+https://yoda.hepforge.org/hg/yoda')
md5sums=('SKIP')

prepare() {
	cd "$srcdir/yoda"
        sed -e 's/\/usr\/bin\/env python$/\/usr\/bin\/env python2/g' -i bin/* pyext/yoda/mktemplates pyext/setup.py.in
        sed -e 's/cython /cython2 /g' -i pyext/yoda/Makefile.am
}

build() {
	cd "$srcdir/yoda"
        export PYTHON=/usr/bin/python2
        autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/yoda"
	make DESTDIR="$pkgdir/" install
        mkdir -p $pkgdir/etc/bash_completion.d
        mv $pkgdir/usr/share/YODA/yoda-completion $pkgdir/etc/bash_completion.d
}

pkgver() {
	cd "$srcdir/yoda"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}
