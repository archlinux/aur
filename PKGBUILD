# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=caveexpress
pkgver=2.3
pkgrel=1
pkgdesc="Classic 2D platformer with physics-based gameplay and dozens of levels"
arch=('i686' 'x86_64')
url="http://www.caveproductions.org"
license=('GPL3' 'CCPL')
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_net' 'sqlite3' 'tinyxml2' 'lua')
source=($pkgname-$pkgver.tar.gz::"https://github.com/mgerhardy/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver-issue6.patch")
sha256sums=('04cb5a75f66eb63f4f09c798559da0363f01b35903651203bd07e9e1dfacb92a'
            '83315c329d0e68c2bac8738ffa09f885a629ecc7f099a1e102bc59f22513f778')

prepare() {
  cd $pkgname-$pkgver

  # set correct arch without dpkg
  sed "s|\`dpkg --print-architecture\`|${CARCH/i686/i386}|" -i configure
  # correct name for lua
  sed 's|lua5.2|lua|g' -i configure build/default.mk 
  # silence a warning
  sed 's|-D_BSD_SOURCE||' -i build/platforms/linux.mk
  # fix sound paths
  patch -Np1 < ../$pkgname-$pkgver-issue6.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure --datadir=/usr/share/$pkgname --enable-hd --enable-release
  make
}

package() {
  cd $pkgname-$pkgver

  # executable
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

  # data
  install -d "$pkgdir"/usr/share
  cp -rup base/$pkgname "$pkgdir"/usr/share

  # doc
  install -d "$pkgdir"/usr/share/doc
  cp -rup docs/$pkgname "$pkgdir"/usr/share/doc

  # icon and desktop files
  install -Dm644 contrib/caveexpresshd-icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 contrib/debian/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
