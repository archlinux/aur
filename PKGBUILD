# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=openloops
pkgver=1.1.1
pkgrel=1
pkgdesc="A particle physics package for the fast numerical evaluation of tree and one-loop matrix elements."
arch=('x86_64' 'i686')
url="http://openloops.hepforge.org"
license=('GPL3')
depends=('gcc-fortran' 'scons' 'python2')
source=(http://www.hepforge.org/archive/openloops/OpenLoops-$pkgver.tar.gz)
md5sums=('2edc0aabecd69aa7bbcec82615e873d0')

build() {
	cd "$srcdir/OpenLoops-$pkgver"
        echo '[OpenLoops]' > openloops.cfg
        echo 'scons_cmd = scons' >> openloops.cfg
        sed -i -e's/python/python2/g' SConstruct
        sed -i -e's/env python/env python2/g' pyol/*/*.py
        sed -i -e's/install_path = os.getcwd()/install_path = "\/usr\/lib\/openloops"/g' SConstruct
        scons
        scons auto=ppll,ppln,pptt,ppjj,ppaj
}

package() {
	cd "$srcdir/OpenLoops-$pkgver"
        mkdir -p $pkgdir/usr/lib/openloops/
	cp -rp lib proclib $pkgdir/usr/lib/openloops/

        # so far necessary for building further process libraries by the user:
	cp -rp lib_src openloops openloops.cfg pyol SConstruct $pkgdir/usr/lib/openloops/
}
