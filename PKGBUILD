# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>

_pkgname=qt5-webkit
pkgname=$_pkgname-git
pkgver=v5.5.1.r28.g0be0076
pkgrel=1
pkgdesc='Classes for a WebKit2 based implementation and a new QML API'
arch=('i686' 'x86_64')
url='https://code.qt.io/cgit/qt/qtwebkit.git'
license=('GPL3' 'LGPL' 'FDL')
depends=('qt5-sensors-git' 'qt5-location-git' 'qt5-webchannel-git' 'gst-plugins-base' 'libxslt' 'libxcomposite' 'libwebp')
optdepends=('gst-plugins-good: Webm codec support')
makedepends=('git' 'python2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://code.qt.io/qt/qtwebkit.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"
    mkdir -p build

    # Use python2 for Python 2.x
    find "./$_pkgname" -name '*.py' -exec sed -i \
        's|#![ ]*/usr/bin/python$|&2|;s|#![ ]*/usr/bin/env python$|&2|;1 s|#[ ].*$|#!/usr/bin/python2|' {} +
    find "./$_pkgname" -type f \( -name "*.pr?" -o -name "*.make" \) -exec sed -i -e "s|python |python2 |" {} +
}

build() {
    cd "$srcdir/build"

    qmake "$srcdir/$_pkgname"
    make
}

package() {
    cd "$srcdir/build"

    make INSTALL_ROOT="$pkgdir" install
}
