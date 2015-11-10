# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgbase=qtcurve
pkgbase=qtcurve-git
pkgname=('qtcurve-utils-git' 'qtcurve-gtk2-git' 'qtcurve-qt4-git' 'qtcurve-qt5-git')
pkgver=r4139.330bfa5
pkgrel=1
pkgdesc="The QtCurve style engine ready for Plasma 5"
arch=('i686' 'x86_64')
url="https://github.com/QtCurve/${_pkgbase}"
license=('LGPL')
groups=('qtcurve')
makedepends=(cmake automoc4 gtk2 qt4 qt5-{svg,x11extras})
source=("${_pkgbase}::git://anongit.kde.org/${_pkgbase}.git")
md5sums=('SKIP')

pkgver() {
    cd ${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_pkgbase}
    rm -rf build
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package_qtcurve-utils-git() {
    depends=('libx11')
    conflicts=qtcurve-{utils,kde4}
    provides="qtcurve-utils"
    cd ${_pkgbase}/build/lib/utils
    make DESTDIR="$pkgdir" install
}

package_qtcurve-gtk2-git() {
    depends=('qtcurve-utils-git' 'gtk2')
    conflicts="qtcurve-gtk2"
    provides="qtcurve-gtk2"
    cd ${_pkgbase}/build/gtk2
    make DESTDIR="$pkgdir" install
    cd ../lib/cairo
    make DESTDIR="$pkgdir" install
}

package_qtcurve-qt4-git() {
    depends=('qtcurve-utils-git' 'qt4')
    conflicts="qtcurve-qt4"
    provides="qtcurve-qt4"
    cd ${_pkgbase}/build/qt4
    make DESTDIR="$pkgdir" install
}

package_qtcurve-qt5-git() {
    depends=('qtcurve-utils-git' 'qt5-svg' 'qt5-x11extras')
    conflicts="qtcurve-qt5"
    provides="qtcurve-qt5"
    cd ${_pkgbase}/build/qt5
    make DESTDIR="$pkgdir" install
}
