# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

pkgname=cool-retro-term-git
pkgrel=1
pkgver=1.0.0RC1.r0.g9364aa3
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

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
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
