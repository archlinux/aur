# Maintainer: Jenna Fligor <jenna at fligor dot net>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Glen Oakley <goakley123@gmail.com>

_pkgname=cool-retro-term
pkgname=$_pkgname-nvidia
pkgver=1.2.0
pkgrel=2
pkgdesc='A good looking terminal emulator which mimics the old cathode display (patched to work with proprietary nvidia drivers)'
arch=('x86_64')
url='https://github.com/Swordfish90/cool-retro-term'
license=('GPL3')
depends=('qmltermwidget' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'hicolor-icon-theme')
provides=('cool-retro-term')
conflicts=('cool-retro-term')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Swordfish90/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('68bd3137439941e6253a97c7dcd27b553ce4d76c8c38e7f8db63db4d6cc7000b')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Don't build vendored qmltermwidget as we package it separately.
  sed -i '/qmltermwidget/d' cool-retro-term.pro

  # Patch to work with proprietary nvidia drivers
  # https://github.com/Swordfish90/cool-retro-term/issues/739#issuecomment-1347784249
  sed -i 's/frameShadow = max(sqrt(frameShadow), 0.0);/frameShadow = clamp(sqrt(frameShadow), 0.0, 1.0);/' app/qml/TerminalFrame.qml
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  qmake
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install
}
