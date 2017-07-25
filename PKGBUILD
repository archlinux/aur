# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-git
pkgver=v4.4.0.beta1.r74.g42844215ca
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='https://www.qt.io/ide/'
license=('GPL')
depends=('clang' 'qt5-declarative' 'qt5-script' 'qt5-svg' 'qt5-tools')
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
provides=('qtcreator' 'qbs')
conflicts=('qtcreator' 'qbs')
source=('git+https://code.qt.io/qt-creator/qt-creator.git'
        'git+https://code.qt.io/qt-labs/qbs.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd qt-creator
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    [[ -d build ]] && rm -r build
    mkdir build

    # fix hardcoded libexec path
    sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qt-creator/qtcreator.pri

    # Do *NOT* use system Qbs: qt creator master is *NOT* compatible with any released Qbs!
    ( cd qt-creator/src/shared && rm -rf qbs && ln -s ../../../qbs qbs )
}

build() {
    cd build

    QTC_FORCE_CLANG_LIBTOOLING=1 \
        qmake LLVM_INSTALL_DIR=/usr CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
            "$srcdir"/qt-creator/qtcreator.pro
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
