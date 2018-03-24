# Maintainer: nano thirteen <nano13@gmx.net>

_pkgname=('tambi')
pkgname=('tambi-git')
pkgver=736
pkgrel=1
pkgdesc='A swiss army knife for studying the bible and much more'
arch=('any')
licence=('undecided')
url='https://github.com/nano13/tambi.git'
makedepends=('git' 'python-setuptools')
depends=('pythonqt' 'python3' 'python-pyqt5' 'qt5-charts' 'python-pyqtchart' 'python-pysword' 'python-markdown' 'python-gpsd-git' 'python-geopy' 'python-srtm-git' 'python-pillow')
source=(${_pkgname}::git+https://github.com/nano13/tambi.git
    $_pkgname.sh
    $_pkgname-cpp.sh)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

package() {
    cd "$srcdir"/"$_pkgname"
    
    # initialize submodules
    git submodule update --init --recursive

    # compile tambi.cpp
    cd c++
    qmake-qt5 -o Makefile tambi.pro
    make
    make clean
    
    cd ..
    # putting the freedesktop .desktop file and the program icon to the right place
    mkdir -p "$pkgdir"/usr/share/applications
    mkdir -p "$pkgdir"/usr/share/pixmaps
    install -Dm744 assets/tambi.desktop "$pkgdir"/usr/share/applications
    install -Dm744 assets/icons/logo.ico "$pkgdir"/usr/share/pixmaps/tambi.ico
    
    mkdir -p "$pkgdir"/usr/share/$pkgname
    mv * "$pkgdir"/usr/share/$pkgname
    #install -dm577 "$pkgdir"/usr/share/$pkgname/
    
    install -Dm755 "$srcdir"/$_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
    install -Dm755 "$srcdir"/$_pkgname-cpp.sh "$pkgdir"/usr/bin/$_pkgname-cpp
}
