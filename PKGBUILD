# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-git
pkgver=v4.3.0.r274.gee17a71a1f
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='https://www.qt.io/ide/'
license=('GPL')
depends=('clang' 'qbs' 'qt5-svg' 'qt5-tools')
makedepends=('git' 'llvm' 'mesa')
options=('docs')
optdepends=('bzr: bazaar support'
            'cmake: cmake project support'
            'cvs: cvs support'
            'gdb: debugger'
            'git: git support'
            'mercurial: mercurial support'
            'qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: other languages'
            'subversion: subversion support'
            'valgrind: analyze support'
            'x11-ssh-askpass: ssh support')
provides=('qtcreator')
conflicts=('qtcreator')
source=('git+https://code.qt.io/qt-creator/qt-creator.git')
md5sums=('SKIP')

pkgver() {
    cd qt-creator

    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    [[ -d build ]] && rm -r build
    mkdir build

    # fix hardcoded libexec path
    sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qt-creator/qtcreator.pri
    # use system qbs
    rm -r qt-creator/src/shared/qbs
}

build() {
    cd build

    qmake LLVM_INSTALL_DIR=/usr QBS_INSTALL_DIR=/usr CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
        DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES "$srcdir"/qt-creator/qtcreator.pro
    make
    make docs
}

package() {
    cd build

    make INSTALL_ROOT="${pkgdir}/usr/" install
    make INSTALL_ROOT="${pkgdir}/usr/" install_docs

    install -Dm644 "${srcdir}/qt-creator/LICENSE.GPL3-EXCEPT" \
        "${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT"
}
