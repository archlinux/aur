# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: delor <bartekpiech@gmail com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: heinz from #qt-creator

pkgname=qtcreator-git
pkgver=v3.4.0.beta1.r95.gd65d84f
pkgrel=1
pkgdesc="Lightweight, cross-platform integrated development environment"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/Category:Tools::QtCreator"
license=('LGPL')
depends=('qt5-quick1' 'qt5-tools' 'qt5-quickcontrols')
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
            'valgrind: for analyze support')
provides=('qtcreator')
conflicts=('qtcreator')
install='qtcreator-git.install'
source=("git://code.qt.io/qt-creator/qt-creator.git"
        "git://code.qt.io/qt-labs/qbs.git"
        'qtcreator.desktop')
md5sums=('SKIP'
         'SKIP'
         '50880836fd62ccd87550940feb995f06')

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

  LLVM_INSTALL_DIR=/usr qmake -r CONFIG+=journald ../qt-creator/qtcreator.pro
  make
  make docs -j1
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  install -Dm644 "${srcdir}/qtcreator.desktop" \
    "${pkgdir}/usr/share/applications/qtcreator.desktop"
  install -Dm644 "${srcdir}/qt-creator/LGPL_EXCEPTION.TXT" \
    "${pkgdir}/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT"
}
