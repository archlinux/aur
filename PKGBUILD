# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-olb
pkgver=3.6
pkgrel=1
pkgdesc="'Zelda: Oni Link Begins' is a fan-made Zelda Game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=("imagemagick")
conflicts=("$pkgname-fr")
source=("http://www.zeldaroth.fr/us/files/OLB/Linux/ZeldaOLB_US-src-linux.zip"
        "$pkgname-datafolders.patch"
        "$pkgname.desktop")
sha256sums=('57b48f3e9e7432283e71a54f02106f93b859b0012c41b78b5be8e88086ae4bd6'
            '13674437bc0bc659ef28613421e3f02b7a37a606aecd9d684c8c8acbcdc49782'
            'bfeb1d7f3b42efa68ed6a89af450294332bdeb7222dd0d972a88221411829967')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zelda-olb
  patch -Np0 < $pkgname-datafolders.patch

  # add our $CFLAGS
  cd ZeldaOLB_US-src-linux/src
  sed 's|CFLAGS  =|CFLAGS  +=|' -i Makefile

  # create an icon
  convert data/images/logos/fond.png -thumbnail '48x48' -background transparent \
    -gravity center -extent 48x48 "$srcdir"/$pkgname.png
}

build() {
  make -C ZeldaOLB_US-src-linux/src
}

package() {
  cd ZeldaOLB_US-src-linux/src

  install -Dm755 ZeldaOLB "$pkgdir"/usr/bin/$pkgname
  # support for the old executable name
  ln -s $pkgname "$pkgdir"/usr/bin/zolb
  
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup data/{images,map,music,sound} "$pkgdir"/usr/share/$pkgname

  install -Dm644 "$srcdir/"$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir/"$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
