# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis 
pkgbase=python-piff-git
pkgname=('python-piff-git' 'python2-piff-git')
pkgver=v0.1.0.r527.250432f
pkgrel=1
pkgdesc=" Piff is a Python software package for modeling the
point-spread function (PSF) across multiple detectors in the full
field of view"
arch=('any')
url="https://github.com/rmjarvis/Piff"
license=('BSD')
makedepends=('git' 'python' 'libffi' 'python-cffi' 'python-numpy' 'python-scipy' 'python-pyaml' 'python-treecorr-git' 'python-fitsio-git' 'python-scikit-learn' 'python-lmfit' 'python-matplotlib' 'python2' 'python2-cffi' 'python2-numpy' 'python2-scipy' 'python2-pyaml' 'python2-treecorr-git' 'python2-fitsio-git' 'python2-scikit-learn' 'python2-lmfit' 'python2-matplotlib' )
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
	python setup.py build

	cd  "$srcdir"/$pkgbase-py2
	python2 setup.py build
}

check() {
	cd "$srcdir"/$pkgbase/tests
	nosetests -v || warning 'Tests failed'

	cd "$srcdir"/$pkgbase-py2/tests
	nosetests2 -v || warning 'Tests failed'
}

package_python-piff-git() {
	  		  depends=('python')
	  		  cd $pkgbase
	  		  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-piff-git() {
	  		  depends=('python2')
	  		  cd $pkgbase-py2
	  		  python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
			  mv ${pkgdir}/usr/bin/piffify  ${pkgdir}/usr/bin/piffify_py2
			  mv ${pkgdir}/usr/bin/plotify  ${pkgdir}/usr/bin/plotify_py2
			  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}