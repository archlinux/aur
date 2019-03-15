# Mantainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Michael Kapelko <kornerr@gmail.com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
# Contributor: David H. Bronke <whitelynx@gmail.com>
# Contributor: Andrea Ratto <andrearatto_liste@yahoo.it>
pkgbase=python-cx_oracle-git
pkgname=('python-cx_oracle-git' 'python2-cx_oracle-git')
pkgver=7.1.2.r0.c1e1659
pkgrel=1
pkgdesc="Python extension module that allows access to Oracle databases"
arch=('i686' 'x86_64')
url='https://github.com/oracle/python-cx_Oracle.git'
license=('Python')
makedepends=('git' 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'oracle-instantclient-basic')
checkdepends=('python-nose' 'python2-nose')
source=("${pkgbase}::git+${url}#tag=7.1.2")
md5sums=('SKIP')

msg "Warning: The package oracle-instantclient-basic must be installed manually "
plain "unofficial prebuilt Arch packages are available by adding the"
plain "following lines to /etc/pacman.conf, if you agree to the Oracle licence[1]:"
plain ""
plain "  [oracle]"
plain "  SigLevel = Optional TrustAll"
plain '  Server = http://linux.shikadi.net/arch/$repo/$arch/'
plain ""
plain "Then run 'pacman -Sys oracle' to see available packages."
plain ""
plain "[1]: http://www.oracle.com/technetwork/licenses/instant-client-lic-152016.html"
plain ""


pkgver() {
  	 cd "${pkgbase}"
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	 #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	  cp -a $pkgbase{,-py2}
}

build() {
	cd "$srcdir"/$pkgbase
	#rm -r odpi
	git clone https://github.com/oracle/odpi.git odpi
	#cd cx_Oracle
	git submodule init
	git submodule update
	python setup.py build

	cd  "$srcdir"/$pkgbase-py2
	#rm -r odpi
	git clone https://github.com/oracle/odpi.git odpi
	#cd cx_Oracle2
	git submodule init
	git submodule update
	python2 setup.py build
}

#check() {
#	cd "$srcdir"/$pkgbase
#	python setup.py test || warning 'Tests failed'

#	cd "$srcdir"/$pkgbase-py2
#	python2 setup.py test || warning 'Tests2 failed'
#}


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