# Maintainer: Markus Hovorka <m.hovorka@live.de>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Matthias Maennich <arch@maennich.net>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Jan-Erik Meyer-Luetgens <nyan at meyer-luetgens dot de>

pkgbase=python-pyside2-git
pkgname=(pyside2-common-git python2-pyside2-git python-pyside2-git)
pkgver=2.0.0.r2067.ccfa8440
_upver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
url="http://qt-project.org/wiki/PySide"
makedepends=('python' 'python2' "qt5.6" "python"{,2}"-shiboken2-git"
             'cmake' 'qt5.6-webkit' 'phonon')
source=("$pkgbase::git+https://code.qt.io/pyside/pyside.git"
        "sphinx-build2.patch"
        "disable-qwebengine.patch")
md5sums=('SKIP'
         '0431767d635147c638063c71a2a138b3'
         '8ce66a738fe9f9f87f7178e507b0d774')

pkgver() {
    cd "$srcdir/$pkgbase"
    printf "%s.r%s.%s" "$_upver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgbase"
    patch -Np1 -i "$srcdir/sphinx-build2.patch"
    patch -Np1 -i "$srcdir/disable-qwebengine.patch"
}

build(){
    local qt5_src="/opt/qt5.6"
    local qt5_rpath="$qt5_src/lib"
    local phonon_inc="/usr/include/qt4/phonon"

    # Build for python2.
    cd "$srcdir/$pkgbase"
    mkdir -p build-py2 && cd build-py2
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_TESTS=OFF \
             "-DQT_PHONON_INCLUDE_DIR=$phonon_inc" \
             "-DCMAKE_PREFIX_PATH=$qt5_src" \
             "-DQT_SRC_DIR=$qt5_src" \
             "-DCMAKE_INSTALL_RPATH=$qt5_rpath"
    make

    # Build for python3.
    cd "$srcdir/$pkgbase"
    mkdir -p build-py3 && cd build-py3
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_TESTS=OFF \
             "-DQT_PHONON_INCLUDE_DIR=$phonon_inc" \
             "-DCMAKE_PREFIX_PATH=$qt5_src" \
             "-DQT_SRC_DIR=$qt5_src" \
             "-DCMAKE_INSTALL_RPATH=$qt5_rpath" \
             -DUSE_PYTHON_VERSION=3
    make
}

package_pyside2-common-git(){
    pkgdesc="Provides LGPL Qt bindings for Python and related tools for binding generation (Common Files)"

    cd "$srcdir/$pkgbase/build-py3"
    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/lib/pkgconfig
    rm -rf "$pkgdir"/usr/lib/python* "$pkgdir"/usr/lib/libpyside2.*
    rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config*python*.cmake
}

package_python-pyside2-git(){
    depends=('python' "qt5.6" "python-shiboken2-git" "pyside2-common-git")
    pkgdesc="Provides LGPL Qt bindings for Python and related tools for binding generation (Python 3 version)"
    optdepends=('qt5.6-webkit: for PySide2.QtWebKit'
                'phonon: for PySide2.phonon')

    cd "$srcdir/$pkgbase/build-py3"
    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/share
    rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config.cmake
    rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2ConfigVersion.cmake
}

package_python2-pyside2-git(){
    depends=('python2' "qt5.6" "python2-shiboken2-git" "pyside2-common-git")
    pkgdesc="Provides LGPL Qt bindings for Python and related tools for binding generation (Python 2 version)"
    optdepends=('qt5.6-webkit: for PySide2.QtWebKit'
                'phonon: for PySide2.phonon')

    cd "$srcdir/$pkgbase/build-py2"
    make DESTDIR="$pkgdir" install

    mv "$pkgdir"/usr/lib/pkgconfig/pyside2.pc \
        "$pkgdir"/usr/lib/pkgconfig/pyside2-py2.pc

    sed -i 's#^Requires: shiboken$#Requires: shiboken-py2#' \
        "$pkgdir"/usr/lib/pkgconfig/pyside2-py2.pc

    rm -rf "$pkgdir"/usr/include
    rm -rf "$pkgdir"/usr/share
    rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2Config.cmake
    rm "$pkgdir"/usr/lib/cmake/PySide2-$_upver/PySide2ConfigVersion.cmake
}

