# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Marcin Skory <armitage at q84fh dot net>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=maelstrom
pkgver=3.0.6
pkgrel=5
pkgdesc='Asteroids-type game with sound and 3D objects'
arch=('x86_64' 'i686')
license=('GPL')
url="http://www.libsdl.org/projects/Maelstrom/"
depends=('sdl_net' 'gcc-libs')
backup=('var/games/Maelstrom.scores')
install='maelstrom.install'
source=("https://www.libsdl.org/projects/Maelstrom/src/Maelstrom-${pkgver}.tar.gz"
        "maelstrom-3.0.6-64bits.patch"
        "maelstrom-scores.patch"
        "10-maelstrom-buttonlist-struct.patch"
        "Maelstrom.desktop")
md5sums=('96aa6359538a6bd60b4198a792de578b'
         '471ef416576d1ba7dabfa12a4825e271'
         '131dc95ec8d23f510cdec2bb10dbb9b4'
         '76f9ed2719f83a90be9535d2ce6b9cd9'
         '4e9009d8c1b7afd68f54084565135d6c')

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

  make PREFIX="${pkgdir}/usr" install

  install -d "${pkgdir}/usr/share/applications"

  install -m644 "${srcdir}/Maelstrom.desktop" \
    "${pkgdir}/usr/share/applications/Maelstrom.desktop"

  chown root:games "${pkgdir}/usr/bin/Maelstrom"
  #chmod 2555 "$pkgdir/usr/bin/Maelstrom"

  install -dm775 "${pkgdir}/var/games"
  
  mv "${pkgdir}/usr/share/Maelstrom/Maelstrom-Scores" \
    "${pkgdir}/var/games/Maelstrom.scores"
  
  chown root:games "${pkgdir}/var/games/Maelstrom.scores"
  chmod 664 "${pkgdir}/var/games/Maelstrom.scores"
}

# vim:set ts=2 sw=2 et:
