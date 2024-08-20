# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=maelstrom
pkgver=3.0.7
pkgrel=1
pkgdesc='Asteroids-type game with sound and 3D objects'
arch=('x86_64' 'i686')
license=('GPL')
url="http://www.libsdl.org/projects/Maelstrom/"
depends=('sdl2_net' 'gcc-libs')
backup=('var/games/Maelstrom.scores')
install=maelstrom.install
source=("https://www.libsdl.org/projects/Maelstrom/src/Maelstrom-${pkgver}.tar.gz"
        "10-maelstrom-buttonlist-struct.patch"
        "maelstrom-scores.patch"
        "maelstrom-time.patch"
        "Maelstrom.desktop")
sha512sums=('2cc75ee25293310c7f4737583c5f1dc33f2c5dfca28fdfe76f523a94992d1ae20a96b77e79c26aee3b2c7c1a23d213128a040a245d0671339b567646b88004d1'
            '91d0dc2d1ecbacc6b666642715dcc43d8078e683fee12715c30e8a23489df1ba23d50587e8797f8c60c870be6b5081abc47f9d57006d09e0a68ee3feac2f6769'
            '124a738d8177ada6a9092e43e4c2e03f438d88442d3c14513326b5b6f3cbc0ed15542a5ea76519bdabae35ac295bfb9505803aab989d032e93ec8150cdef713d'
            '564360037f3a70c718671b0792e24ba0ee51a22cadcc44fdc848434ed8f3015928ca3a7f0cab549a3c230e60e395071cc89eafc6325c0a1c1aff8888e19be197'
            'c190b121cc2043dfb1d60b46af7b9298abdcf73584b399bd034a3a5036462eb41407f7d3f2a01c9485e2ea3a1ed09ff211774c34f1a381be99b3f4e9ae01c641')

prepare() {
  cd "Maelstrom-${pkgver}"

  patch -Np0 -i "${srcdir}/maelstrom-scores.patch"
  patch -Np1 -i "${srcdir}/maelstrom-time.patch"
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
  install -d "${pkgdir}/usr/bin"
  install -m644 "${srcdir}/Maelstrom.desktop" "${pkgdir}/usr/share/applications/Maelstrom.desktop"
  chown root:games "${pkgdir}/usr/share/Maelstrom/Maelstrom"
  ln -sf "/usr/share/Maelstrom/Maelstrom" "${pkgdir}/usr/bin/Maelstrom"
  install -dm775 "${pkgdir}/var/games"
  touch "${pkgdir}/var/games/Maelstrom.scores"
  chown root:games "${pkgdir}/var/games/Maelstrom.scores"
  chmod 664 "${pkgdir}/var/games/Maelstrom.scores"
}

