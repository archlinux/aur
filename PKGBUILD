# Mantainer: Andres Alejandro Navarro Alsina
# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>
pkgbase=python-cx_oracle-git
pkgname=('python-cx_oracle-git' 'python2-cx_oracle-git')
pkgver=6.1.r19.dbe9e45
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://github.com/oracle/python-cx_Oracle'
license=('Python')
makedepends=('python' 'python2')
checkdepends=('python-nose' 'python2-nose')
source=("${pkgbase}::git+${url}")
md5sums=('SKIP')

pkgver() {
  	 cd "${pkgbase}"
	 printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	 #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	rm -r odpi
	git clone https://github.com/oracle/python-cx_Oracle
	git submodule init
	git submodule update
	python setup.py build

	cd  "$srcdir"/$pkgbase-py2
	rm -r odpi
	git clone https://github.com/oracle/python-cx_Oracle
	git submodule init
	git submodule update
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase/test
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/test
	nosetests2 -v || warning 'Tests failed'
}


package_python-cx_oracle-git() {
				depends=('python')  
 			       	cd $pkgbase
  			       	python setup.py install --root=$pkgdir --prefix=/usr --optimize=1
				rm -rf "$pkgdir"/usr/cx_Oracle-doc
				install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-cx_oracle-git() {
	  		 	depends=('python2')
	  		  	cd $pkgbase-py2
			  	python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
				rm -rf "$pkgdir"/usr/cx_Oracle-doc
			  	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}