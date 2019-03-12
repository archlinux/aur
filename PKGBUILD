# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Dan Foreman-Mackey
_pkgname=python-emcee-git 
pkgbase=python-emcee-git
pkgname=("python-emcee-git" "python2-emcee-git")
pkgver=v1.2.0.r415.8e73203
pkgrel=1
pkgdesc=" The Python ensemble sampling toolkit for affine-invariant MCMC  "
arch=('any')
url="https://github.com/dfm/emcee.git"
license=('MIT')
makedepends=('git' 'python' 'python-numpy' 'python2' 'python2-numpy')
checkdepends=('python-nose' 'python2-nose' 'python-pytest' 'python-scipy' 'python2-scipy' 'python-h5py' 'python2-h5py')
optdepends=('python2-pytest')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $_pkgname{,-py2}
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build
}

check() {
	#python -c 'import emcee; emcee.test()'
	cd "$srcdir"/$pkgbase/emcee
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/emcee
	nosetests2 -v || warning 'Tests2 failed'
}

package_python-emcee-git() {
		       depends=()
		       cd "${_pkgname}"
		       python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
		       install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-emcee-git() {
			depends=()			    
			cd "${_pkgname}"
			python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

}

