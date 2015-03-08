# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-nsq
pkgver=1.8
pkgrel=1
pkgdesc="'Zelda: Navi's Quest is a fan-made Zelda Game (english version)"
url="http://www.zeldaroth.fr/"
arch=('i686' 'x86_64')
license=('unknown')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image')
makedepends=("imagemagick")
conflicts=("$pkgname-fr")
source=("http://www.zeldaroth.fr/us/files/NSQ/Linux/ZeldaNSQ_US-src-linux.zip"
        "$pkgname-datafolders.patch"
        "$pkgname.desktop")
sha256sums=('e33cf28ad8f160e94e24f4273b1546f64fc8f10f5d46c7ecc9e4b3e5edb2f571'
            '3b445f73fd2be4218b446dc510551d09629932140682682eec599d3a076f84c7'
            'b0bb398ba03e2a8bc1d66d720b9ec2d962247c7ef0725b2a60ff716fa9ca8ef0')

prepare() {
  # use user's $HOME for saves and load data from /usr/share/zelda-nsq
  patch -Np0 < $pkgname-datafolders.patch

  # add our $CFLAGS
  cd ZeldaNSQ_US-src-linux
  sed 's|CFLAGS =|CFLAGS +=|' -i makefile

  # create an icon
  convert data/images/title/titre.png -thumbnail '48x48' -background transparent \
    -gravity center -extent 48x48 "$srcdir"/$pkgname.png
}

build() {
  make -C ZeldaNSQ_US-src-linux release
}

package() {
  cd ZeldaNSQ_US-src-linux

  install -Dm755 bin/Release/ZeldaNSQ "$pkgdir"/usr/bin/$pkgname
  
  install -d "$pkgdir"/usr/share
  cp -rup data "$pkgdir"/usr/share/$pkgname

  install -Dm644 "$srcdir/"$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "$srcdir/"$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
