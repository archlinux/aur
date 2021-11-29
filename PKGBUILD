# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-git
pkgver=v6.0.0.rc1.r238.g7a0bdccadf
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('x86_64')
url='https://www.qt.io'
license=(LGPL)
depends=(clang clazy qt5-quickcontrols qt5-quickcontrols2 qt5-script qt5-tools qt5-webengine)
makedepends=(git llvm mesa python)
options=(docs)
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
provides=(qtcreator qbs)
conflicts=(qtcreator qbs)
source=('git+https://code.qt.io/qt-creator/qt-creator.git'
        'git+https://code.qt.io/qbs/qbs.git'
        'org.qt-project.qtcreator.desktop')
sha256sums=('SKIP'
            'SKIP'
            '90addb552923db0897f7096d166c2d1bf1c3390ae9c79687fc4ce7c4e57ee810')

pkgver() {
    cd qt-creator

    git describe --long --match v* | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build

    cd qt-creator

    # fix hardcoded libexec path
    sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri

    # Do *NOT* use system Qbs: qt creator master is *NOT* compatible with any released Qbs!
    ( cd src/shared && rm -rf qbs && ln -s ../../../qbs qbs )
}

build() {
    cd build

    qmake LLVM_INSTALL_DIR=/usr CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
        "${srcdir}/qt-creator/qtcreator.pro"

    make
    make docs
}

package() {
    cd build

    make INSTALL_ROOT="${pkgdir}/usr/" install
    make INSTALL_ROOT="${pkgdir}/usr/" install_docs

    install -Dm644 "${srcdir}/qt-creator/LICENSE.GPL3-EXCEPT" \
        "${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT"
        
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp "${srcdir}/org.qt-project.qtcreator.desktop" "${pkgdir}/usr/share/applications/"
}
