# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator
# Contributor: Tobias Hunger <tobias dot hunger at gmail dot com>

pkgname=qtcreator-git
pkgver=v4.0.0.rc1.r117.g03acd1f
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='http://wiki.qt.io/Category:Tools::QtCreator'
license=('GPL')
depends=('qt5-script' 'qt5-tools' 'qt5-quickcontrols' 'qt5-svg')
makedepends=('git' 'mesa' 'clang')
options=('docs')
optdepends=('qt5-doc: for the integrated Qt documentation'
            'gdb: for the debugger'
            'cmake: for cmake project support'
            'openssh-askpass: for ssh support'
            'git: for git support'
            'mercurial: for mercurial support'
            'bzr: for bazaar support'
            'clang: Clang code model'
            'valgrind: for analyze support'
            'subversion: for subversion support'
            'cvs: for cvs support'
            'valgrind: for valgrind support')
provides=('qtcreator')
conflicts=('qtcreator')
install='qtcreator-git.install'
source=("git://code.qt.io/qt-creator/qt-creator.git"
        "git://code.qt.io/qt-labs/qbs.git"
        'qtcreator.desktop')
md5sums=('SKIP'
         'SKIP'
         '800c94165c547b64012a207d9830250a')

pkgver() {
  cd qt-creator

  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd qt-creator

  git submodule init
  git config submodule.qbs.url $srcdir/qbs
  git submodule update
}

build() {
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  LLVM_INSTALL_DIR=/usr qmake CONFIG+=journald -r ../qt-creator/qtcreator.pro
  make
  make docs -j1
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  install -Dm644 "${srcdir}/qtcreator.desktop" \
    "${pkgdir}/usr/share/applications/qtcreator.desktop"
  install -Dm644 "${srcdir}/qt-creator/LICENSE.GPL3-EXCEPT" \
    "${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT"
}
