# Contributor: Aetf <aetf at unlimitedcodeworks dot xyz>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gitname=CuteMarkEd
pkgname=cutemarked-git
pkgver=0.11.3r849
pkgrel=1
pkgdesc="Qt Markdown Editor"
url="https://github.com/cloose/CuteMarkEd"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('qt5-webkit' 'hunspell' "discount>=2.1.7" 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('git' 'qt5-tools')
provides=('cutemarked')
conflicts=('cutemarked')
source=("git://github.com/cloose/CuteMarkEd.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  _mainver=$(grep ProductVersion ${_gitname}.wxs | head -1 | cut -d= -f2 | tr -d \" | tr -d \? | tr \> r)
  printf "%s%s" $(echo $_mainver) $(git rev-list --count HEAD)
}

prepare() {
  cd $_gitname
  sed -i -e '/#include <QTableWidgetItem>/a #include <QAction>' app/optionsdialog.cpp
}

build() {
  cd $_gitname
  [[ -d build ]] || mkdir build
  cd build
  qmake ..
  make
}

package() {
  cd $_gitname/build
  make INSTALL_ROOT="$pkgdir" install
}
