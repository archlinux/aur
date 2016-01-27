# Maintainer: Felix Schindler
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>
#
# This PKGBUILD is maintained at hppts://github.com/ftalbrecht/aur
# in the qtcreator28 branch

pkgname=qtcreator28
pkgver=2.8.1
_pkgver=2.8.1
pkgrel=4
pkgdesc='Lightweight, cross-platform integrated development environment (2.8.x)'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt51-quick1' 'qt51-tools')
makedepends=('git' 'mesa' 'qt51-base' 'qt51-jsbackend')
options=('docs')
optdepends=('qt51-doc: for the integrated Qt documentation'
            'gdb: for the debugger'
            'cmake: for cmake project support'
            'openssh-askpass: for ssh support'
            'git: for git support'
            'mercurial: for mercurial support'
            'bzr: for bazaar support'
            'valgrind: for analyze support')
install=${pkgname}.install
source=("git+https://github.com/qtproject/qt-creator.git#tag=v${_pkgver}"
        "git+https://github.com/qtproject/qt-labs-qbs.git"
        "${pkgname}.desktop"
        "cmake-wrapper.sh")
md5sums=('SKIP'
         'SKIP'
         '297116239167ff1b2fdbe014688bf140'
         'f80002d551c3ace26e4e6405519c96c8')
_install_root="/opt/$pkgname"

prepare() {
  source /opt/qt51.PATH

  cd qt-creator
  git submodule init
  git config submodule.qbs.url $srcdir/qt-labs-qbs
  git submodule update
}

build() {
  source /opt/qt51.PATH

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  qmake ../qt-creator/qtcreator.pro
  make
  make docs -j1
}

package() {
  source /opt/qt51.PATH

  cd build

  make INSTALL_ROOT="${pkgdir}/$_install_root/usr/" install
  make INSTALL_ROOT="${pkgdir}/$_install_root/usr/" install_docs

  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/qt-creator/LGPL_EXCEPTION.TXT ${pkgdir}/usr/share/licenses/$pkgname/LGPL_EXCEPTION.TXT

  # fix startup script
  sed -i 's;#! /bin/sh;#! /bin/sh\n\nsource /opt/qt51.PATH;g' ${pkgdir}/opt/${pkgname}/usr/bin/qtcreator.sh

  # install icons
  for ii in 256x256/apps/QtProject-qtcreator \
            48x48/apps/QtProject-qtcreator \
            16x16/apps/QtProject-qtcreator \
            24x24/apps/QtProject-qtcreator \
            32x32/apps/QtProject-qtcreator \
            128x128/apps/QtProject-qtcreator \
            64x64/apps/QtProject-qtcreator \
            512x512/apps/QtProject-qtcreator
  do
    install -Dm644 ${pkgdir}/opt/${pkgname}/usr/share/icons/hicolor/${ii}.png ${pkgdir}/usr/share/icons/hicolor/${ii}28.png
  done
  rm -r ${pkgdir}/opt/${pkgname}/usr/share/icons

  # install cmake wrapper
  install -Dm755 ${srcdir}/cmake-wrapper.sh ${pkgdir}/opt/${pkgname}/usr/bin/cmake-wrapper.sh
}
