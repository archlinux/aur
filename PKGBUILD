# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
pkgver=0.3.10+6415+737b599b
pkgrel=1
pkgdesc='BitTorrent client with integrated media player (git)'
arch=(i686 x86_64)
url=https://popcorntime.sh
license=(GPL3)
depends=(alsa-lib gconf gtk2 nss ttf-font libxtst libnotify)
makedepends=(git yarn)
provides=(popcorntime)
conflicts=(popcorntime popcorntime-ce)
options=(!strip)
source=(git+https://github.com/popcorn-official/popcorn-desktop#branch=development
        popcorntime.desktop)
sha512sums=('SKIP'
            'cccfbe1722404b6eac04d1e16b71ec99668bc261d53b494e0402a5346e6337491f04eb6a5f431f92a98f959705e712d25943586baab1206efaa9a085fe4755b6')

pkgver() {
  cd popcorn-desktop
  echo $(git tag)+$(git rev-list --count HEAD)+$(git rev-parse --short HEAD)
}

build() {
  cd popcorn-desktop
  yarn config set yarn-offline-mirror ./node_modules/
  yarn install --ignore-engines
  yarn build
}

[ "$CARCH" = i686 ] && _platform=linux32
[ "$CARCH" = x86_64 ] && _platform=linux64

package() {
  install -Dm 644 popcorntime.desktop "$pkgdir"/usr/share/applications/popcorntime.desktop
  cd popcorn-desktop/build/Popcorn-Time/$_platform
  install -Dm 644 src/app/images/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/popcorntime.png
  install -d "$pkgdir"/usr/{share/popcorntime,bin}
  cp -a . "$pkgdir"/usr/share/popcorntime
  cd "$pkgdir"/usr/share/popcorntime
  find . -type f -exec chmod 644 {} +
  chmod +x Popcorn-Time
  ln -s /usr/share/popcorntime/Popcorn-Time "$pkgdir"/usr/bin/popcorntime
}
