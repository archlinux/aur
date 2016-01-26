# Maintainer: Michael Straube <m.s.online gmx.de>
# Contributor: pj1031999 <pj1031999@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers (at) archlinux (dot) us>

pkgname=block-attack
pkgver=1.4.2
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="An open source clone of Tetris Attack based on SDL"
url="http://blockattack.sourceforge.net/"
license=('GPL2')
depends=('enet' 'physfs' 'sdl_mixer' 'sdl_image' 'sdl_ttf')
source=("http://downloads.sourceforge.net/blockattack/blockattack-${pkgver}.tar.bz2"
        "block-attack.patch")
sha256sums=('9b06d4c74d373f56c77cba905e6cbfafec285f4ac36692fa4bcfa00f1c49d10a'
            'caa31020ec8786feb6ce84dc5a8813df02661df06e3e2976600c681ee55565f6')

prepare() {
  cd "${srcdir}/blockattack-${pkgver}/"
  patch -p0 < "${srcdir}/block-attack.patch"
}

build() {
  cd "${srcdir}/blockattack-${pkgver}/"
  make
}

package() {
  cd "${srcdir}/blockattack-${pkgver}/"

  make DESTDIR=${pkgdir} install

  find ${pkgdir} -type f -exec chmod 644 {} \;
  find ${pkgdir} -type d -exec chmod 755 {} \;

  install -Dm644 source/misc/blockattack.desktop \
    "${pkgdir}/usr/share/applications/block-attack.desktop"

  install -Dm644 Game/gfx/icon.png \
    "${pkgdir}/usr/share/pixmaps/block-attack.png"

  install -Dm755 Game/blockattack \
    "${pkgdir}/usr/lib/block-attack/blockattack"

  rm "${pkgdir}/usr/share/games/block-attack/blockattack"

  mkdir -p "${pkgdir}/usr/bin"

  printf '%s\n%s\n%s\n' \
    "#!/bin/bash" \
    "cd /usr/share/games/block-attack" \
    "/usr/lib/block-attack/blockattack" \
    > "${pkgdir}/usr/bin/block-attack"

  chmod 755 "${pkgdir}/usr/bin/block-attack"
}
