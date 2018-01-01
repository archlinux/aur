# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Tim Jenness 
_pkgname=python-palpy
pkgbase=$_pkgname-git
pkgname=("$_pkgname-git" "python2-palpy-git")
pkgver=pypi.1.8.1.r0.a7ad770
pkgrel=1
pkgdesc=" PALpy is a python interface to the PAL positional astronomy library  "
arch=('i686' 'x86_64')
url="https://github.com/Starlink/palpy"
license=('GPL')
makedepends=('git' )
provides=("${_pkgname}")
conflicts=("${_pkgname}")
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
	git submodule init
	git submodule update
	python setup.py build

	cd "$srcdir"/$_pkgname-py2
	git submodule init
	git submodule update
	python2 setup.py build
}

check() {
	cd "$srcdir"/$_pkgname
	python test_pal.py
	
	cd "$srcdir"/$_pkgname-py2
	python2 test_pal.py
}


package_python-palpy-git() {
	  depends=('python')
	  cd "${_pkgname}"	
	  python setup.py install --root=${pkgdir} --prefix=/usr
	  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-palpy-git() {
	  depends=('python2')
	  cd "${_pkgname}"	
	  python2 setup.py install --root=${pkgdir} --prefix=/usr
	  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
