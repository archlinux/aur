# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Dan Foreman-Mackey
_pkgname=python-emcee
pkgbase=python-emcee-git
pkgname=("python-emcee-git" "python2-emcee-git")
pkgver=v2.2.1.r0.g67c8f79
pkgrel=1
pkgdesc=" The Python ensemble sampling toolkit for affine-invariant MCMC  "
arch=('any')
url="https://github.com/dfm/emcee.git"
license=('MIT')
makedepends=('git' 'python' 'python-numpy' 'python2' 'python2-numpy' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-pytest' 'python-scipy' 'python2-scipy' 'python-h5py' 'python2-h5py')
optdepends=('python2-pytest')
#source=("${_pkgname}::git+${url}#tag=v3.0rc2")
source=("${_pkgname}::git+${url}#tag=v2.2.1")
md5sums=('SKIP')

pkgver() {
	 cd "$srcdir"/$_pkgname
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
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
	cd "$srcdir"/$_pkgname/emcee
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$_pkgname-py2/emcee
	nosetests2 -v || warning 'Tests2 failed'
}

package_python-emcee-git() {
		       depends=('python-numpy')
		       cd "${_pkgname}"
		       python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
		       install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-emcee-git() {
			depends=('python2-numpy')			    
			cd "${_pkgname}"
			python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

}

