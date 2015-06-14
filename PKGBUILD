# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao-plugin
pkgver=0.2.6
pkgrel=3
pkgdesc="A QtCreator plugin to work with Tufão."
arch=('i686' 'x86_64')
url="https://github.com/vinipsmaker/tufao-qtcreatorplugin"
license=('LGPL3')

_qtcreatorversion='3.1.0'

depends=("qtcreator=${_qtcreatorversion}")
makedepends=(
  # For qtcreator
  'git'
  'mesa'
  'clang')
source=(#"qt-creator-opensource-src-${_qtcreatorversion}::git://gitorious.org/qt-creator/qt-creator.git#tag=v3.1.0-beta1"
        #"git://gitorious.org/qt-labs/qbs.git"
        "http://download.qt-project.org/official_releases/qtcreator/$(echo ${_qtcreatorversion} | grep -Eoe '[[:digit:]]+\.[[:digit:]]+')/${_qtcreatorversion}/qt-creator-opensource-src-${_qtcreatorversion}.tar.gz"
        "https://github.com/vinipsmaker/tufao-qtcreatorplugin/archive/${pkgver}.tar.gz")
md5sums=('ec63e30eaa72f1ae1604fc86826ddb23'
         'eff1bd9fae77ad43f62c30ea285bb3e6')

prepare() {
  cd "$srcdir"
  [ -d tufao ] || mv "tufao-qtcreatorplugin-${pkgver}" tufao

  #cd "qt-creator-opensource-src-${_qtcreatorversion}"
  #git submodule init
  #git config submodule.qbs.url $srcdir/qbs
  #git submodule update
}

build() {
  if [ -z "$QTC_BUILD" ]; then
    if [ -z "$QTC_SOURCE" ]; then
      export QTC_SOURCE="$srcdir/qt-creator-opensource-src-${_qtcreatorversion}"
    fi
    cd "$QTC_SOURCE"

    export QTC_BUILD="${QTC_SOURCE}/build"

    mkdir -p "$QTC_BUILD"
    cd "$QTC_BUILD"
    LLVM_INSTALL_DIR=/usr qmake -r "$QTC_SOURCE/qtcreator.pro"
    make
  fi

  cd "$srcdir/tufao"
  qmake
  make
}

package() {
  if [ -z "$QTC_BUILD" ]; then
    if [ -z "$QTC_SOURCE" ]; then
      export QTC_SOURCE="$srcdir/qt-creator-opensource-src-${_qtcreatorversion}"
    fi

    export QTC_BUILD="$QTC_SOURCE/build"
  fi

  cd "${QTC_BUILD}/lib/qtcreator/plugins"
  mkdir -p "$pkgdir/usr/lib/qtcreator/plugins"
  cp -r TufaoTeam "$pkgdir/usr/lib/qtcreator/plugins"
}
