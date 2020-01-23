# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=editorconfig-qtcreator
_pkgver=0.3.1
_qtcreatorver=4.11.0
pkgver=${_pkgver}+${_qtcreatorver}
pkgrel=1
pkgdesc="EditorConfig Plugin for QtCreator"
url="https://github.com/editorconfig/editorconfig-qtcreator"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("qtcreator=${_qtcreatorver}" "editorconfig-core-c")
source=("https://github.com/editorconfig/${pkgname}/archive/${_pkgver}.tar.gz"
        "http://download.qt.io/official_releases/qtcreator/${_qtcreatorver%.*}/${_qtcreatorver}/qt-creator-opensource-src-${_qtcreatorver}.tar.xz")
sha512sums=('53d4f9a875d5aaebd4df0310a4f44a087de8c4f63f5e54387c0e7ea0b5792c455c4b6d41f993b72d23ad5317867b91db5bafc727f6bc9514460f7918ff2c3a2e'
            'a0eef2df7ad9ae171facef4ccc08652243153bb0b29b3af531ba2d0bd93a09d043b2e87d79450dedf18c01b57ad5c474a44a942a9e27553211a5722740c840af')

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
