# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=opentyrian-git
pkgver=1136
pkgrel=1
pkgdesc="Open-source port of the DOS shoot-em-up Tyrian"
url="https://github.com/opentyrian/opentyrian"
arch=(i686 x86_64)
license=(GPL2)
depends=(sdl2 sdl2_net)
makedepends=(git)
provides=(opentyrian)
conflicts=(opentyrian)
replaces=(opentyrian-svn opentyrian-hg)
source=("git+https://github.com/opentyrian/opentyrian"
        http://www.camanis.net/opentyrian/tyrian21.zip)
sha256sums=('SKIP'
            '7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277')

pkgver() {
  cd opentyrian
  git rev-list --count HEAD
}

build() {
  cd opentyrian
  make prefix=/usr all
}

package() {
  cd opentyrian
  make DESTDIR="$pkgdir" prefix=/usr install

  install -Dt "$pkgdir/usr/share/applications" -m644 linux/opentyrian.desktop
  for _x in 22 24 32 48 128; do
    install -Dm644 "linux/icons/tyrian-$_x.png" \
      "$pkgdir/usr/share/icons/hicolor/${_x}x${_x}/apps/opentyrian.png"
  done

  cd ../tyrian21
  install -Dt "$pkgdir/usr/share/games/tyrian" -m644 *.dat *.lvl *.shp *.snd \
    demo.* music.mus tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
}

# vim:set sw=2 et:
