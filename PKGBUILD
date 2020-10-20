# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=maelstrom
pkgver=3.0.6
pkgrel=7
pkgdesc='Asteroids-type game with sound and 3D objects'
arch=('x86_64' 'i686')
license=('GPL')
url="http://www.libsdl.org/projects/Maelstrom/"
depends=('sdl_net' 'gcc-libs')
backup=('var/games/Maelstrom.scores')
install=maelstrom.install
source=("https://www.libsdl.org/projects/Maelstrom/src/Maelstrom-${pkgver}.tar.gz"
        "10-maelstrom-buttonlist-struct.patch"
        "maelstrom-3.0.6-64bits.patch"
        "maelstrom-scores.patch"
        "Maelstrom.desktop")
sha512sums=('a0c8271c34c07046a702ef507f751aaa74cebcdafaec5354c9eb6083d89e74011439ffe4f3a4fcedecfe2d45ff91374f0f81d9d7e691df0ba98ba20f465e9d54'
            '91d0dc2d1ecbacc6b666642715dcc43d8078e683fee12715c30e8a23489df1ba23d50587e8797f8c60c870be6b5081abc47f9d57006d09e0a68ee3feac2f6769'
            'eac1d07c576624de1e3d732e788a4b7e8ef3215964b8dd1e5c0ce80a2ee1143d3994fa9d6cc2819b3a0ac5f9dd3f1f13a92a4d414e80e3b9c79bf41b27314448'
            '124a738d8177ada6a9092e43e4c2e03f438d88442d3c14513326b5b6f3cbc0ed15542a5ea76519bdabae35ac295bfb9505803aab989d032e93ec8150cdef713d'
            'c190b121cc2043dfb1d60b46af7b9298abdcf73584b399bd034a3a5036462eb41407f7d3f2a01c9485e2ea3a1ed09ff211774c34f1a381be99b3f4e9ae01c641')

prepare() {
  cd "Maelstrom-${pkgver}"

  if [[ "${CARCH}" == "x86_64" ]]; then
    patch -Np0 -i ../maelstrom-3.0.6-64bits.patch
  fi

  patch -Np0 -i "${srcdir}/maelstrom-scores.patch"
  patch -Np1 -i "${srcdir}/10-maelstrom-buttonlist-struct.patch"
  sed -i -e 's/games\/\$PACKAGE/share\/\$PACKAGE/g' configure
}

build() {
  cd "Maelstrom-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "Maelstrom-${pkgver}"

  make prefix="${pkgdir}/usr" install

  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}/Maelstrom.desktop" "${pkgdir}/usr/share/applications/Maelstrom.desktop"
  chown root:games "${pkgdir}/usr/bin/Maelstrom"
  install -dm775 "${pkgdir}/var/games"
  mv "${pkgdir}/usr/share/Maelstrom/Maelstrom-Scores" "${pkgdir}/var/games/Maelstrom.scores"
  chown root:games "${pkgdir}/var/games/Maelstrom.scores"
  chmod 664 "${pkgdir}/var/games/Maelstrom.scores"
}

