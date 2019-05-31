# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=editorconfig-qtcreator
_pkgver=0.3.0
_qtcreatorver=4.9.1
pkgver=${_pkgver}+${_qtcreatorver}
pkgrel=1
pkgdesc="EditorConfig Plugin for QtCreator"
url="https://github.com/editorconfig/editorconfig-qtcreator"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("qtcreator=${_qtcreatorver}" "editorconfig-core-c")
source=("https://github.com/editorconfig/${pkgname}/archive/${_pkgver}.tar.gz"
        "http://download.qt.io/official_releases/qtcreator/${_qtcreatorver%.*}/${_qtcreatorver}/qt-creator-opensource-src-${_qtcreatorver}.tar.xz")
sha512sums=('28f36cd90834d5ebfd004cf708898514c1ed9f5b00f7a9bc08482cbf9b05efa2068ca97d7debc7f4aedbbd7115cd4d96795280c5e726063c0d2bcf3adf4d25f9'
            'fa116457549e9f2ae98ba76276f1018e4356670ebde0e3db18737f5eb5b98a2d2947a3aaa290580c305e7eaeca190125589311bc4d1a55e0b0f6d720f2d6525c')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  mkdir -p ../pseudo-ide-build-tree/lib
  cp -a /usr/lib/qtcreator ../pseudo-ide-build-tree/lib

  mkdir build
  cd build
  qmake QTCREATOR_SOURCES="${srcdir}/qt-creator-opensource-src-${_qtcreatorver}" IDE_BUILD_TREE="${srcdir}/pseudo-ide-build-tree" \
    KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"

  make install INSTALL_ROOT="${pkgdir}/usr"
}
