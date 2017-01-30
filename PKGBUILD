# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: kachelaqa <kachelaqa at gmail dot com>

pkgbase='python-pyside2-tools-git'
pkgname=('python2-pyside2-tools-git' 'python-pyside2-tools-git' 'pyside2-tools-common-git')
pkgver=2.0.0.r106.a3f2949
_upver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
url='https://qt-project.org/wiki/PySide'
makedepends=('cmake' 'python' 'python2' 'qt5.6' 'shiboken2-git' python{,2}-pyside2-git)
source=("$pkgbase::git+https://code.qt.io/pyside/pyside-tools.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "%s.r%s.%s" "$_upver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    local qt5_src="/opt/qt5.6"
    local qt5_rpath="$qt5_src/lib"

    # Build for python2.
    cd "$srcdir/$pkgbase"
    mkdir -p build-py2 && cd build-py2
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DPYTHON_EXTENSION_SUFFIX=-python2.7 \
        -DPYTHON_BASENAME=-python2.7 \
        -DUSE_PYTHON_VERSION=2 \
        "-DCMAKE_PREFIX_PATH=$qt5_src" \
        "-DQT_SRC_DIR=$qt5_src" \
        "-DCMAKE_INSTALL_RPATH=$qt5_rpath"
    make

    # Build for python3.
    cd "$srcdir/$pkgbase"
    mkdir -p build-py3 && cd build-py3
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        "-DCMAKE_PREFIX_PATH=$qt5_src" \
        "-DQT_SRC_DIR=$qt5_src" \
        -DUSE_PYTHON_VERSION=3 \
        "-DCMAKE_INSTALL_RPATH=$qt5_rpath"
    make
}

package_pyside2-tools-common-git() {
    depends=('qt5.6')
    pkgdesc='PySide lupdate, rcc, and uic development tools (Common Files)'

    cd "$srcdir/$pkgbase/build-py3"
    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/lib
    rm -f "${pkgdir}"/usr/bin/pyside2-uic
    rm -f "${pkgdir}"/usr/share/man/man1/pyside2-uic*
}


package_python2-pyside2-tools-git() {
    depends=('python2-pyside2-git' 'pyside2-tools-common-git')
    pkgdesc='PySide lupdate, rcc, and uic development tools (for Python 2)'

    cd "$srcdir/$pkgbase/build-py2"
    make DESTDIR="${pkgdir}" install

    find "${pkgdir}" -type f -exec \
    sed -i -e '1 s|^#! */usr/bin/python[0-9.]*|#!/usr/bin/python2|' \
           -e '1 s|^#! */usr/bin/env python[0-9.]*|#!/usr/bin/env python2|' {} +

    mv "${pkgdir}"/usr/bin/{,python2-}pyside2-uic
    mv "${pkgdir}"/usr/share/man/man1/{,python2-}pyside2-uic.1

    rm -rf "${pkgdir}"/usr/lib/python2*/site-packages/pyside2uic/{port_v3,pyside2-uic.1}
    rm -f "${pkgdir}"/usr/bin/pyside2-{lupdate,rcc}
    rm -f "${pkgdir}"/usr/share/man/man1/pyside2-{lupdate,rcc}*
}

package_python-pyside2-tools-git() {
    depends=('python-pyside2-git' 'pyside2-tools-common-git')
    pkgdesc='PySide lupdate, rcc, and uic development tools (for Python 3)'

    cd "$srcdir/$pkgbase/build-py3"
    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/lib/python3*/site-packages/pyside2uic/{port_v2,pyside2-uic.1}
    rm -f "${pkgdir}"/usr/bin/pyside2-{lupdate,rcc}
    rm -f "${pkgdir}"/usr/share/man/man1/pyside2-{lupdate,rcc}*
}
