# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-3t
pkgver=1.9
pkgrel=1
pkgdesc="'Zelda: Time to Triumph' is a fan-made Zelda Game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=("imagemagick")
conflicts=("$pkgname-fr")
source=("http://www.zeldaroth.fr/us/files/3T/Linux/Zelda3T_US-src-linux.zip"
        "$pkgname-datafolders.patch"
        "$pkgname.desktop")
sha256sums=('2c2b1c8bca4e8b1c362ef2ddfb95cebf0c5526d4aa6917340289db0a5d0096d3'
            'd473f1f872cf30578787a085babe4934421a91eaf6354a47d11bb197bed957f9'
            'ca00c7555cef168ca3f00cc8e363631b6d2c3b566cc7c07f29de234f564c0d88')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zelda-3t
  patch -Np0 < $pkgname-datafolders.patch

  # add our $CFLAGS
  cd Zelda3T_US-src-linux/src
  sed 's|CFLAGS  =|CFLAGS  +=|' -i Makefile

  # create an icon
  convert data/images/logos/fond.png -thumbnail '48x48' -background transparent \
    -gravity center -extent 48x48 "$srcdir"/$pkgname.png
}

build() {
  make -C Zelda3T_US-src-linux/src
}

package() {
  cd Zelda3T_US-src-linux/src

  install -Dm755 Zelda3T "$pkgdir"/usr/bin/$pkgname
  # support for the old executable name
  ln -s $pkgname "$pkgdir"/usr/bin/zttt
  
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup data/{images,map,music,sound} "$pkgdir"/usr/share/$pkgname

  install -Dm644 "$srcdir/"$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir/"$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
