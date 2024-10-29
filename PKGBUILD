# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=opentyrian2000
pkgver=2000.20240218
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
sha512sums=('18de9da764c42786353190846f200f1eb720b77a1f6259f943ac5870200104f103590a8c3d230831f44bb9536771c803083d82502dd738518649cd3062766dd6'
            'b425b8524e408b128e249d2916597bd5bebd34ee418e3ddbe13306e1f86869eaba85db0ae5a5dbae4d477b7fec6e04e8fb292d516bba7aff96cf2795232dbfc1')
b2sums=('e02f998ef0abc820933526f7f453889566efa425c6a7f0be63c4b5669ecf75502e80c43e1f1ff99f214262bb89f2686297b24356b4ae21a6c0a48d66d99aa096'
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
