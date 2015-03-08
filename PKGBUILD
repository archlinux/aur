# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-roth
pkgver=6.11
pkgrel=1
pkgdesc="'Zelda: Return of the Hylian' is a fan-made Zelda Game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=("imagemagick")
conflicts=("$pkgname-fr")
source=("http://www.zeldaroth.fr/us/files/ROTH/Linux/ZeldaROTH_US-src-linux.zip"
        "$pkgname-datafolders.patch"
        "$pkgname.desktop")
sha256sums=('9919a7fb0d2781f6323bfa27a7929fea68f4b0f26786ba9b6880b1f6a3e6f684'
            'db0ece6364fca7f4d6519f7e89182012889524b16be98e1953f4d05e227956f0'
            '1a22a6fdf433cc6272c5375b7e64cda1480dd559883151a2fe868ae43eaf9364')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zelda-roth
  patch -Np0 < $pkgname-datafolders.patch

  # add our $CFLAGS
  cd ZeldaROTH_US-src-linux/src
  sed 's|CFLAGS  =|CFLAGS  +=|' -i Makefile

  # create an icon
  convert data/images/logos/fond.png -thumbnail '48x48' -background transparent \
    -gravity center -extent 48x48 "$srcdir"/$pkgname.png
}

build () {
  make -C ZeldaROTH_US-src-linux/src
}

package () {
  cd ZeldaROTH_US-src-linux/src

  install -Dm755 ZeldaROTH_US "$pkgdir"/usr/bin/$pkgname
  # support for the old executable name
  ln -s $pkgname "$pkgdir"/usr/bin/zroth
  
  install -d "$pkgdir"/usr/share/$pkgname
  cp -rup data/{images,map,music,sound} "$pkgdir"/usr/share/$pkgname

  install -Dm644 "$srcdir/"$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir/"$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
