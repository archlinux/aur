# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis 
pkgbase=python-coord-git
pkgname=('python-coord-git' 'python2-coord-git')
pkgver=v1.0.4.r15.328e54c
pkgrel=1
pkgdesc=" Coord is a Python module that provides basic functionality related to angles and celestial coordinatesw"
arch=('i686' 'x86_64')
url="https://github.com/LSSTDESC/Coord.git"
license=('BSD')
makedepends=('git' 'python' 'python-cffi' 'python-numpy' 'python-future' 'python2' 'python2-cffi' 'python2-numpy' 'python2-future' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-astropy' 'python2-astropy')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd "${pkgbase}"
 	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	python setup.py build

	cd  "$srcdir"/$pkgbase-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2
	nosetests2 -v || warning 'Tests2 failed'
}

package_python-coord-git() {
	  		  depends=('glibc' 'python-cffi')
	  		  cd $pkgbase
	  		  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-coord-git() {
	  		  depends=('glibc' 'python2-cffi')
	  		  cd $pkgbase-py2
			  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}