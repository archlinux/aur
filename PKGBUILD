# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

pkgname=cool-retro-term-git
pkgrel=1
pkgver=0.9.r336.16768cf
pkgdesc='A good looking terminal emulator which mimics the old cathode display'
arch=('i686' 'x86_64')
url='https://github.com/Swordfish90/cool-retro-term'
license=('GPL' 'GPL3')
depends=('qt5-quickcontrols' 'qt5-graphicaleffects')
makedepends=('git')
replaces=('cool-old-term-git')
conflicts=('cool-old-term-git')
source=("git://github.com/Swordfish90/cool-retro-term.git"
        "git://github.com/Swordfish90/qmltermwidget.git")
md5sums=('SKIP'
         'SKIP')

prepare() {
  cd "$srcdir/${pkgname%-*}"

  git submodule init
  git config submodule.qmltermwidget.url "$srcdir/qmltermwidget"
  git submodule update
}

pkgver () {
  cd "$srcdir/${pkgname%-*}"

  local v_ver=$(awk -F '"' '/version:/ {print $2}' app/qml/ApplicationSettings.qml)
  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-*}"

  qmake
  make
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir/usr/lib/qt/qml/"
  cp -a qmltermwidget/QMLTermWidget "$pkgdir/usr/lib/qt/qml/"
}
