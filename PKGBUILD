# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
pkgbase=python-galsim
pkgname=('python-galsim-git' 'python2-galsim-git' )
pkgver=v1.5.1.r0.9de448ef9
pkgrel=1
pkgdesc=" The modular galaxy image simulation toolkit "
arch=('i686' 'x86_64')
url="https://github.com/GalSim-developers/GalSim.git"
license=('BSD')
makedepends=('git' 'scons' 'boost' 'fftw' 'tmv-git' 'python')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd "${pkgbase}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}


build() {
	cd "$srcdir"/$pkgbase
	scons PREFIX=/usr TMV_DIR=/usr PYTHON=python

	cd  "$srcdir"/$pkgbase-py2
	scons PREFIX=/usr TMV_DIR=/usr PYTHON=python2
}

check() {
	cd "$srcdir"/$pkgbase/tests
	nosetests -v

	cd "$srcdir"/$pkgbase-py2/tests
	nosetests2 -v
}

	
package_python-galsim-git() {
			    depends=('python' 'boost-libs' 'fftw' 'tmv-git')
			    cd $pkgbase
			    scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python install
			    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-galsim-git() {
			     depends=('python2' 'boost-libs' 'fftw' 'tmv-git' )	
			     cd $pkgbase-py2
			     scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python2 install
			     install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
