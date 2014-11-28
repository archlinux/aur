# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=lotr
pkgver=0.6.5
pkgrel=2
pkgdesc='A free game engine for Interplays RPG "The Lord of the Rings"'
arch=('i686' 'x86_64')
url="http://www.wonderland.cz/lotr/"
license=('LGPL')
depends=('sdl_mixer' 'libxml2')
optdepends=('timidity++: for playing sound')
install=$pkgname.install
source=(http://download.wonderland.cz/$pkgname-$pkgver.tgz)
md5sums=('762f7e6954f99612124ae2fbc74841de')

build() {
  cd $pkgname-$pkgver

  sed 's|games/||g' -i lotr.h

  export CFLAGS+=" -DFULLSCREEN"

# compile floppy version
  make clean
  make PREFIX=/usr CFLAGS="${CFLAGS}"
  mv -f lotr lotr-floppy

# compile cd version
  make clean
  make PREFIX=/usr CFLAGS="${CFLAGS} -DCD_VERSION"
  mv -f lotr lotr-cd

# compile demo version
  make clean
  make PREFIX=/usr CFLAGS="${CFLAGS} -DDEMO=1"
  mv -f lotr lotr-demo

# install files
  install -Dm755 lotr-floppy ${pkgdir}/usr/bin/lotr
  install -m755 lotr-{cd,demo} ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/{doc,lotr/cd}
  cp -rf doc/ ${pkgdir}/usr/share/doc/lotr/
}
