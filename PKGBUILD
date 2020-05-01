# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis
_pkgname=python-treecorr
pkgbase=python-treecorr-git
pkgname=('python-treecorr-git' 'python2-treecorr-git')
pkgver=v4.0.10.r0.825dc0a
pkgrel=1
pkgdesc="A package for efficiently computing 2-point and 3-point correlation functions "
arch=('i686' 'x86_64')
url="https://github.com/rmjarvis/TreeCorr.git"
license=('BSD')
makedepends=('git' 'python-numpy' 'python2-numpy' 'python-future' 'python-pandas' 'python-yaml' 'python-cffi' 'python2-future' 'python2-pandas' 'python2-yaml' 'python2-cffi' 'python-fitsio-git' 'python2-fitsio-git')
checkdepends=('python-nose' 'python2-nose')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $_pkgname{,-py2}
}

build() {
	export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/lib/libffi-3.2.1/include
    	export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib
	export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib

	cd "$srcdir"/$_pkgname
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$_pkgname/tests
	#python setup.py test || warning 'Tests failed'
	nosetests -v || warning 'Tests failed'
	
	cd "$srcdir"/$_pkgname-py2/tests
	#python2 setup.py test || warning 'Tests2 failed'
	nosetests2 -v || warning 'Tests2 failed'
}

package_python-treecorr-git() {
			      depends=('python-numpy' 'python-future' 'python-pandas' 'python-yaml' 'python-cffi' 'python-fitsio-git')
	  		      cd "${_pkgname}"
	  		      python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		      install -Dm644 TreeCorr_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-treecorr-git() {
			       depends=('python2-numpy' 'python2-future' 'python-pandas' 'python2-yaml' 'python2-cffi' 'python2-fitsio-git')
			       cd "${_pkgname}"
	  		       python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			       mv ${pkgdir}/usr/bin/corr2 ${pkgdir}/usr/bin/corr2_py2
			       mv ${pkgdir}/usr/bin/corr3 ${pkgdir}/usr/bin/corr3_py2
	  		       install -Dm644 TreeCorr_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}