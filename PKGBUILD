# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Matias Carrasco Kind

pkgbase=python-easyaccess-git
pkgname=('python-easyaccess-git' 'python2-easyaccess-git')
pkgver=1.4.3.r15.b488638
pkgrel=1
pkgdesc=" Enhanced command line SQL interpreter client for astronomical databases"
arch=('any')
url="https://github.com/mgckind/easyaccess"
license=('GPL')
makedepends=('git' 'python' 'python2' 'python-cx_oracle-git' 'python2-cx_oracle-git' 'python-pandas' 'python-future' 'python2-pandas' 'python2-future' 'python-requests' 'python2-requests' 'python-fitsio-git'  'python2-fitsio-git')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd $pkgbase
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	python setup.py build

	cd "$srcdir"/$pkgbase-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase/tests
	nosetests -v  || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/tests
	nosetests2 -v || warning 'Tests failed'
}

package_python-easyaccess-git() {
				depends=('python' 'python-cx_oracle-git' 'python-pandas' 'python-future' 'python-requests' 'python-fitsio-git')
				cd $pkgbase
				python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
				install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-easyaccess-git() {
				 depends=('python2' 'python2-cx_oracle-git' 'python2-pandas' 'python2-future' 'python2-requests' 'python2-fitsio-git')
			    	 cd $pkgbase-py2
			    	 python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
				 mv "$pkgdir"/usr/bin/easyaccess{,2} 
	  		    	 install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

