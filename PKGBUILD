# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
pkgbase=python-galsim-git
pkgname=('python-galsim-git' 'python2-galsim-git' 'galsim-common-git')
pkgver=v2.1.4.r3.68c8695b0
pkgrel=1
pkgdesc=" The modular galaxy image simulation toolkit "
arch=('i686' 'x86_64')
url="https://github.com/GalSim-developers/GalSim.git"
license=('BSD')
makedepends=('git' 'scons' 'boost-libs' 'fftw' 'tmv-git' 'python' 'python2' 'eigen' 'pybind11')
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
	scons PREFIX=/usr TMV_DIR=/usr PYBIND11_DIR=/usr/include EIGEN_DIR=/usr/include/eigen3 PYTHON=python

	cd  "$srcdir"/$pkgbase-py2
	scons PREFIX=/usr TMV_DIR=/usr PYBIND11_DIR=/usr/include EIGEN_DIR=/usr/include/eigen3 PYTHON=python2
}

check() {
	cd "$srcdir"/$pkgbase/tests
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/tests
	nosetests2 -v || warning 'Tests failed'
}

	
package_python-galsim-git() {
			    depends=('python' 'boost-libs' 'fftw' 'tmv-git' 'eigen' 'pybind11' 'galsim-common-git')
			    cd $pkgbase
			    scons PREFIX="${pkgdir}"/usr  FINAL_PREFIX=/usr  PYTHON=python install
			    rm -rf "${pkgdir}"/usr/share
			    rm -f "${pkgdir}"/usr/lib/libgalsim.so
			    rm -f "${pkgdir}"/usr/lib/libgalsim.so.2.1
			    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-galsim-git() {
			     depends=('python2' 'boost-libs' 'fftw' 'tmv-git' 'eigen' 'pybind11' 'galsim-common-git')
			     cd $pkgbase-py2
			     scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python2 install
			     rm -rf "${pkgdir}"/usr/share		 
			     rm -f "${pkgdir}"/usr/lib/libgalsim.so	 
			     rm -f "${pkgdir}"/usr/lib/libgalsim.so.2.1
			     for i in galsim galsim_download_cosmos; do mv "$pkgdir"/usr/bin/${i}{,2}; done
			     install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_galsim-common-git() {
			    depends=('fftw' 'tmv-git')
 			    pkgdesc='common files for python-galsim-git and python2-galsim-git'
    			    cd $pkgbase
			    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    			    mv "${srcdir}"/$pkgbase/share/ "${pkgdir}"/usr/share/galsim/
  			    install -Dm644 "${srcdir}"/$pkgbase/lib/libgalsim.so "${pkgdir}"/usr/lib/libgalsim.so
			    install -Dm644 "${srcdir}"/$pkgbase/lib/libgalsim.so.2.1 "${pkgdir}"/usr/lib/libgalsim.so.2.1
}