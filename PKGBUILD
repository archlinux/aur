# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor:  GalSim developers team on GitHub
pkgbase=python-galsim-git
pkgname=('python-galsim-git' 'python2-galsim-git' 'galsim-common-git' )
pkgver=v1.5.1.r0.9de448ef9
pkgrel=1
pkgdesc=" The modular galaxy image simulation toolkit "
arch=('i686' 'x86_64')
url="https://github.com/GalSim-developers/GalSim.git"
license=('BSD')
makedepends=('git' 'scons' 'boost-libs' 'fftw' 'tmv-git' 'python')
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
			    depends=('python' 'boost-libs' 'tmv-git' 'galsim-common-git')
			    cd $pkgbase
			    scons PREFIX="${pkgdir}"/usr  FINAL_PREFIX=/usr PYTHON=python install
			    rm -rf "${pkgdir}"/usr/share
			    rm -f "${pkgdir}"/usr/lib/libgalsim.so
			    rm -f "${pkgdir}"/usr/lib/libgalsim.so.1.5
			    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-galsim-git() {
			     depends=('python2' 'boost-libs' 'tmv-git' 'galsim-common-git')	
			     cd $pkgbase-py2
			     scons PREFIX=$pkgdir/usr  FINAL_PREFIX=/usr PYTHON=python2 install
			    
			     rm -rf "${pkgdir}"/usr/share
			     rm -f "${pkgdir}"/usr/lib/libgalsim.so
			     rm -f "${pkgdir}"/usr/lib/libgalsim.so.1.5
			     for i in galsim galsim_download_cosmos galsim_json galsim_yaml ; do mv "$pkgdir"/usr/bin/${i}{,2}; done
			     install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE				
}

package_galsim-common-git() {
			    depends=('fftw' 'tmv-git')
 			    pkgdesc='common files for python-galsim-git and python2-galsim-git'
    			    cd $pkgbase
			    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
    			    mv "${srcdir}"/$pkgbase/share/ "${pkgdir}"/usr/share/galsim/
  			    install -Dm644 "${srcdir}"/$pkgbase/lib/libgalsim.so "${pkgdir}"/usr/lib/libgalsim.so
			    install -Dm644 "${srcdir}"/$pkgbase/lib/libgalsim.so.1.5 "${pkgdir}"/usr/lib/libgalsim.so.1.5
}