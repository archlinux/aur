# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=pythonqt-svn
pkgver=3.1.r445
pkgrel=2
pkgdesc='A dynamic Python binding for the Qt framework (SVN version)'
arch=('i686' 'x86_64')
url='http://pythonqt.sourceforge.net/'
_verurl='https://sourceforge.net/projects/pythonqt/files/pythonqt/'
license=('LGPL2.1')
depends=('python' 'qt5-webkit' 'qt5-svg' 'qt5-multimedia')
makedepends=('subversion' 'qt5-tools')
provides=('pythonqt')
conflicts=('pythonqt' 'qt5-python27-git')
source=("$pkgname"::'svn://svn.code.sf.net/p/pythonqt/code/trunk')
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}"
	local _pyver="$(python --version 2>&1 | sed 's/^Python //;s/\.[^.]*$//')"
	sed -i "s/unix\:PYTHON_VERSION=2\.7/unix\:PYTHON_VERSION=${_pyver}/" build/python.prf
}

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Subversion
	printf "%s.%s" \
	    "$(curl -s ${_verurl} | grep -o 'PythonQt-[[0-9]*\.]*[0-9]*' | sort -r | uniq | head -n1 | cut -c10-)" \
	    "$(printf "r%s" "$(svnversion | tr -d 'A-z')")"
}

build() {
	cd "${srcdir}/${pkgname}"
	qmake-qt5
	make all
}

package() {
	cd "${srcdir}/${pkgname}"
	mkdir -p "${pkgdir}"/usr/include/PythonQt/{gui,extensions/PythonQt_QtAll}
	mkdir -p "${pkgdir}"/usr/lib
	install -D -m644 src/*.h                       "${pkgdir}"/usr/include/PythonQt
	install -D -m644 src/gui/*.h                   "${pkgdir}"/usr/include/PythonQt/gui
	install -D -m644 extensions/PythonQt_QtAll/*.h "${pkgdir}"/usr/include/PythonQt/extensions/PythonQt_QtAll
	install -D -m644 lib/*.so*                     "${pkgdir}"/usr/lib
}
