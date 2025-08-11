# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=opentyrian2000
pkgver=2000.20250408
pkgrel=1
pkgdesc='Open Source port of the classic DOS shoot-em-up Tyrian2000'
url='https://github.com/KScl/opentyrian2000'
arch=('x86_64')
# refs for asset licensing:
# https://www.camanis.net/
# https://web.archive.org/web/20120218200015/http://www.freewebs.com/worldtreegames
# https://lostgarden.home.blog/2007/04/05/free-game-graphics-tyrian-ships-and-tiles/
# https://lostgarden.home.blog/2007/03/15/lost-garden-license/
license=('GPL-2.0-only' 'LicenseRef-Freeware')
depends=('sdl2' 'sdl2_net' 'hicolor-icon-theme')
makedepends=('git')
source=(
  "$pkgname::git+https://github.com/KScl/opentyrian2000.git#tag=v$pkgver"
  "$pkgname-$pkgver-assets.zip::https://camanis.net/tyrian/tyrian2000.zip"
)
sha512sums=('b7833c76aa9c38baf8a7b7ad404a388e68e985a724cd68f072a2dea920ce4bd9e68f620a766b9afe32dc36ccbfaa754f15c5687b4d34b611f3771015572b9efd'
            'b425b8524e408b128e249d2916597bd5bebd34ee418e3ddbe13306e1f86869eaba85db0ae5a5dbae4d477b7fec6e04e8fb292d516bba7aff96cf2795232dbfc1')
b2sums=('a935e74ab7e0d0d453a3306a97216ce2b2ea4df14e6b9d52daceb6c5a1ea1a7121e55454cf7887878d6f762b597619499bdc00ca4b015d5a365201b0d05b2173'
        '942ee68be24944e3d65612f323cd884e357341db42ee4ed5f487c7d1d650ab4bef98121dbdd321840bc3046f94c9491a6d777179821ba83ce0b4ad7573778aab')

build() {
  make \
    -C "$pkgname" \
    prefix=/usr \
    gamesdir=/usr/share \
    all
}

package() {
  cd "$pkgname"

  make \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    gamesdir=/usr/share \
    install

  # assets
  pushd "$srcdir/tyrian2000"
  install -vDm644 -t "$pkgdir/usr/share/$pkgname" \
    *.dat *.lvl *.shp *.snd demo.* music.mus \
    tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
  popd

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING README
}
