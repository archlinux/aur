# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Tim Jenness 

pkgbase=python-palpy-git
pkgname=('python-palpy-git' 'python2-palpy-git')
pkgver=pypi.1.8.1.r0.a7ad770
pkgrel=1
pkgdesc=" PALpy is a python interface to the PAL positional astronomy library  "
arch=('i686' 'x86_64')
url="https://github.com/Starlink/palpy"
license=('GPL')
checkdepends=('python' 'python2')
makedepends=('git' 'python' 'python2' 'cython' 'cython2' 'python-numpy' 'python2-numpy')
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
	git submodule init
	git submodule update
	python setup.py build

	cd "$srcdir"/$pkgbase-py2
	git submodule init
	git submodule update
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase
	PYTHONPATH="$build/lib.linux-x86_64-3.6:$PYTHONPATH"
	python test_pal.py || warning 'Tests failed'
		
	cd "$srcdir"/$pkgbase-py2
	PYTHONPATH="$build/lib.linux-x86_64-2.7:$PYTHONPATH"
	python2 test_pal.py || warning 'Tests failed'
}

package_python-palpy-git() {
			   depends=('python')
			   cd $pkgbase
			   python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			   install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-palpy-git() {
			    depends=('python2')
			    cd $pkgbase-py2
			    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		    install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

