# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=opentyrian-git
pkgver=2.1.20220318+r4+g74245db
pkgrel=1
epoch=1
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
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd opentyrian
}

_make() {
  make prefix=/usr \
    OPENTYRIAN_VERSION="$pkgver-$pkgrel" VCS_IDREV=false \
    "$@"
}

build() {
  cd opentyrian
  _make all
}

package() {
  cd opentyrian
  _make DESTDIR="$pkgdir" install

  cd ../tyrian21
  install -Dt "$pkgdir/usr/share/games/tyrian" -m644 *.dat *.lvl *.shp *.snd \
    demo.* music.mus tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
}

# vim:set sw=2 et:
