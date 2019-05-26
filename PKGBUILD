# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=pythonqt-svn
_srcname="${pkgname#-svn}"
pkgver=3.2.r509
pkgrel=1
pkgdesc='A dynamic Python binding for the Qt framework (SVN version)'
arch=('x86_64')
url='http://pythonqt.sourceforge.net/'
_verurl='https://sourceforge.net/projects/pythonqt/files/pythonqt/'
license=('LGPL2.1')
depends=('python' 'qt5-webkit' 'qt5-svg' 'qt5-multimedia' 'qt5-xmlpatterns')
makedepends=('subversion' 'qt5-tools')
provides=('pythonqt')
conflicts=('pythonqt')
source=("$_srcname"::'svn://svn.code.sf.net/p/pythonqt/code/trunk')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    sed -i "s/unix\:PYTHON_VERSION=.*/unix\:PYTHON_VERSION=${_pyver}/" build/python.prf
}

pkgver() {
    cd "$_srcname"
    
    # subversion
    printf '%s.%s' \
        "$(curl -s "$_verurl" | grep -o 'PythonQt-[[0-9]*\.]*[0-9]*' | sort -r | uniq | head -n1 | cut -c10-)" \
        "$(printf 'r%s' "$(svnversion | tr -d 'A-z')")"
}

build() {
    cd "$_srcname"
    qmake-qt5
    make all
}

package() {
    cd "$_srcname"
    mkdir -p "$pkgdir"/usr/include/PythonQt/{gui,extensions/PythonQt_QtAll}
    mkdir -p "$pkgdir"/usr/lib
    install -D -m644 src/*.h     "${pkgdir}/usr/include/PythonQt"
    install -D -m644 src/gui/*.h "${pkgdir}/usr/include/PythonQt/gui"
    install -D -m644 extensions/PythonQt_QtAll/*.h "${pkgdir}/usr/include/PythonQt/extensions/PythonQt_QtAll"
    cp -a lib/*.so* "${pkgdir}/usr/lib"
}
