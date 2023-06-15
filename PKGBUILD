# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgbase=dunelegacy
pkgname=$_pkgbase-git
pkgver=0.96.4.r168.g6ea9ac9
pkgrel=1
pkgdesc="Updated clone of Westood Studios' Dune2 (development version)"
arch=('i686' 'x86_64')
url="http://dunelegacy.sourceforge.net"
license=('GPL2')
depends=('sdl2_mixer' 'sdl2_ttf')
makedepends=('git')
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$pkgname.install
source=($_pkgbase::"git+http://git.code.sf.net/p/dunelegacy/code")
md5sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --long --tags | sed 's/v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd $_pkgbase

  autoreconf -fi

  # fix compilation, if needed
  grep -q "<array>" include/FileClasses/TextManager.h ||
    sed '/^#include <string>/i #include <array>' -i include/FileClasses/TextManager.h
}

build() {
  cd $_pkgbase

  ./configure --prefix=/usr --enable-silent-rules
  make
}

package() {
  cd $_pkgbase

  make DESTDIR="$pkgdir" install

  # install icons and .desktop file
  install -Dm644 $_pkgbase.png "$pkgdir"/usr/share/pixmaps/$_pkgbase.png
  install -Dm644 $_pkgbase-128x128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$_pkgbase.png
  install -Dm644 $_pkgbase.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgbase.svg
  install -Dm644 $_pkgbase.desktop "$pkgdir"/usr/share/applications/$_pkgbase.desktop
}
