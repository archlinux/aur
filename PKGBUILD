# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: E. Sheldon 
_pkgname=python-fitsio
pkgbase=python-fitsio-git
pkgname=("python-fitsio-git" "python2-fitsio-git")
pkgver=v0.9.12.r38.gcff2588
pkgrel=1
pkgdesc=" A python library to read from and write to FITS files. "
arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio.git"
license=('BSD')
makedepends=('git' 'python' 'python2' 'python2-setuptools' 'python-setuptools' 'python-numpy' 'python2-numpy')
checkdepends=('python-numpy' 'python2-numpy' 'python-nose' 'python2-nose' 'bzip2')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

prepare() {
	  cp -a $_pkgname{,-py2}
	  cd "$srcdir"/$_pkgname	  
}

pkgver() {
	 cd  $_pkgname
	 #printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir"/$_pkgname
	python setup.py build_py build_clib build_scripts 

	cd "$srcdir"/$_pkgname-py2
	python2 setup.py build_py build_clib build_scripts 
}

check() {
	cd "$srcdir"/$_pkgname/fitsio
	nosetests -v || warning 'Tests failed'
	python test.py || warning 'Tests failed'

	cd "$srcdir"/$_pkgname-py2/fitsio
	nosetests2 -v || warning 'Tests2 failed'
	python2 test.py || warning 'Tests2 failed'
	
	#cd "$srcdir"/$_pkgname
	#python setup.py test || warning 'Tests failed'
}

package_python-fitsio-git() {
			    depends=('python-numpy' 'curl')	    
			    cd "$srcdir"/$_pkgname
			    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			    install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

package_python2-fitsio-git() {
			     depends=('python2-numpy' 'curl')
     			     cd "$srcdir"/$_pkgname-py2
	  		     python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
	  		     install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
