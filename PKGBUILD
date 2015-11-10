# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgbase=qtcurve
pkgbase=lib32-qtcurve-git
pkgname=('lib32-qtcurve-utils-git' 'lib32-qtcurve-gtk2-git' 'lib32-qtcurve-qt4-git')
pkgver=r4139.330bfa5
pkgrel=1
pkgdesc='The QtCurve style engine ready for Plasma 5 (32-bit version)'
arch=('i686' 'x86_64')
url="https://github.com/QtCurve/${_pkgbase}"
license=('LGPL')
groups=('qtcurve')
makedepends=('cmake' 'gcc-multilib' 'automoc4' 'lib32-gtk2' 'lib32-qt4')
source=("qtcurve::git://anongit.kde.org/qtcurve.git" 'qconfig.h')
md5sums=('SKIP'
         '6b89fb32651dd73d1c02185d23b86186')

pkgver() {
    cd ${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgbase}
    [ -d b ] || mkdir b

    # export multilib parameters
    # and QT_BUILD_KEY workaround
    export CC="gcc -m32 -I$srcdir"
    export CXX="g++ -m32 -I$srcdir"
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    [ -d QtCore ] || mkdir QtCore
    ln -s ../${source[1]} QtCore
}

build() {
    cd ${_pkgbase}/b
    cmake .. -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins \
             -DQT_LIBRARY_DIR=/usr/lib32 \
             -DLIB_INSTALL_DIR=/usr/lib32 \
             -DQTC_QT4_ENABLE_KDE=false \
             -DENABLE_QT5=false
    make
}

package_lib32-qtcurve-utils-git() {
    depends=('lib32-libx11')
    conflicts=('lib32-qtcurve-utils')
    cd qtcurve/b/lib/utils
    make DESTDIR="$pkgdir" install
}

package_lib32-qtcurve-gtk2-git() {
    depends=('lib32-qtcurve-utils-git' 'lib32-gtk2' 'qtcurve-gtk2')
    conflicts=('lib32-qtcurve-gtk2')
    cd ${_pkgbase}/b/gtk2
    make DESTDIR="$pkgdir" install
    cd ../lib/cairo
    make DESTDIR="$pkgdir" install

    # strip themes
    rm -rf "$pkgdir/usr/share"
}

package_lib32-qtcurve-qt4-git() {
    depends=('lib32-qtcurve-utils-git' 'lib32-qt4')
    conflicts=('lib32-qtcurve-qt4')
    cd qtcurve/b/qt4
    make DESTDIR="$pkgdir" install
}
