# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Armin 'IsSuE' Praher [issue.at.gmx.dot.at]
# Contributor: [vEX] <niechift.dot.vex.at.gmail.dot.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
pkgname=teeworlds06
pkgver=0.6.5
pkgrel=1
pkgdesc='Fast-paced multiplayer 2D shooter game (0.6.X branch)'
arch=('x86_64')
url='https://www.teeworlds.com'
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2')
makedepends=('python' 'bam' 'mesa' 'imagemagick' 'gendesk')
source=("https://downloads.teeworlds.com/teeworlds-${pkgver}-src.tar.gz"
        "https://github.com/downloads/matricks/bam/bam-0.4.0.tar.gz")
sha512sums=('2c5ac08cc2a4a53c392b13200a1311866b028b69b4368712171c2f550e7394f6655f686687a495d17ec88ac12fb58c250ed8adfa882a076d016ead6659105951'
            'c599cdf3618d317a5d304febd2e59d1116fc5819cdaf49969fdc25f88ed8f3e25831861c0c7fea05059d8af7085b654a7732bd89086bc166661b932d168ee2ca')

prepare() {
  convert +set date:create +set date:modify "teeworlds-$pkgver-src/other/icons/teeworlds.ico" "$srcdir/teeworlds.png"
  gendesk -n --pkgname "teeworlds06" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds 0.6.X' --categories 'Game;ArcadeGame'

  # Change data location
  sed -i -e 's#/usr/share/teeworlds/data#/usr/share/teeworlds06/data#' "teeworlds-$pkgver-src/src/engine/shared/storage.cpp"
  # Update nethash to match Debian (allows to connect to 0.6.4 servers)
  sed -i -e 's#fc9dffd45c6d100a#e42d81cd67b8c7bc#' "teeworlds-$pkgver-src/scripts/cmd5.py"
}

build() {
  cd bam-0.4.0
  ./make_unix.sh
  cd ..

  cd "teeworlds-$pkgver-src"
  ../bam-0.4.0/bam server_release client_release
}

package() {
  cd "teeworlds-$pkgver-src"

  # Install data files
  mkdir -p ${pkgdir}/usr/share/teeworlds06/data
  cp -r data/* ${pkgdir}/usr/share/teeworlds06/data

  install -Dm755 teeworlds ${pkgdir}/usr/bin/teeworlds06
  install -Dm755 teeworlds_srv ${pkgdir}/usr/bin/teeworlds06_srv

  install -Dm644 ${srcdir}/teeworlds06.desktop ${pkgdir}/usr/share/applications/teeworlds06.desktop
  install -Dm644 ${srcdir}/teeworlds-0.png ${pkgdir}/usr/share/pixmaps/teeworlds06.png

  install -Dm644 license.txt ${pkgdir}/usr/share/licenses/teeworlds06/license.txt
}

# vim:set ts=2 sw=2 et:
