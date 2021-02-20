# $Id$
# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Øyvind 'Mr.Elendig' Heggstad <mrelendig@har-ikkje.net>
# Contributor: Fabrizio Antonangeli <fabrizio.antonangeli@gmail.com>

pkgname=dfu-util-git
pkgver=20210210
pkgrel=1
pkgdesc='Tool intended to download and upload firmware using DFU protocol to devices connected over USB'
url='http://dfu-util.gnumonks.org'
license=(GPL2)
arch=('i686' 'x86_64')
makedepends=('git')
depends=('libusb')
conflicts=('dfu-util')
provides=('dfu-util')
install=dfu-util.install
#_gitroot=git://git.code.sf.net/p/dfu-util/dfu-util
_gitroot=https://gitlab.com/dfu-util/dfu-util
_gitname=dfu-util
source=("stm32dfu.udev.rules"
        "$_gitname::git+$_gitroot")
sha256sums=('64d4314f354d965e3dc0fd439dc497d5d0a41bf649da1869df40f93718e5a6fe'
            'SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd $_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/stm32dfu.udev.rules "$pkgdir"/usr/lib/udev/rules.d/48-stm32dfu.rules
}
