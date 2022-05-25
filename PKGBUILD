# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=opentyrian2000
pkgver=2000.20200917
pkgrel=2
pkgdesc='Open Source port of the classic DOS shoot-em-up Tyrian2000'
url="https://github.com/KScl/opentyrian2000"
arch=('x86_64')
# refs for asset licensing:
# https://www.camanis.net/
# https://web.archive.org/web/20120218200015/http://www.freewebs.com/worldtreegames
# https://lostgarden.home.blog/2007/04/05/free-game-graphics-tyrian-ships-and-tiles/
# https://lostgarden.home.blog/2007/03/15/lost-garden-license/
license=('GPL2' 'custom:Freeware')
depends=('sdl2' 'sdl2_net' 'hicolor-icon-theme')
makedepends=('git')
_commit='7bf22d97a19350fbf631aecb9742ee85b65c2be4'
source=(
  "$pkgname::git+https://github.com/KScl/opentyrian2000.git#commit=$_commit"
  "$pkgname-assets.zip::https://camanis.net/tyrian/tyrian2000.zip"
  'update-paths.patch'
)
sha512sums=('SKIP'
            'b425b8524e408b128e249d2916597bd5bebd34ee418e3ddbe13306e1f86869eaba85db0ae5a5dbae4d477b7fec6e04e8fb292d516bba7aff96cf2795232dbfc1'
            'ae9567f32540ae18d345cc8070dc544b13141e7f41b002aeb12f63497ce58e0f5bdb7b017fd2719d0def5bc3533c2147bdf9cf7c5eb75809603a6b5c9cdba46b')
b2sums=('SKIP'
        '942ee68be24944e3d65612f323cd884e357341db42ee4ed5f487c7d1d650ab4bef98121dbdd321840bc3046f94c9491a6d777179821ba83ce0b4ad7573778aab'
        '2d942ae0bcb609143f3684d922e39fa39066f3c9f6ce27b28376a5cf27f294c31dbeadd2cb495135051c3a22bd11bd489dbe4a73a183bb6f93ded9de7a83eb9d')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # patch Makefile & desktop file
  patch -p1 -i ../update-paths.patch
}

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

  # desktop file & icons
  install -vDm644 linux/opentyrian.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  for _x in 22 24 32 48 128; do
    install -vDm644 "linux/icons/tyrian-$_x.png" \
      "$pkgdir/usr/share/icons/hicolor/${_x}x${_x}/apps/$pkgname.png"
  done

  # assets
  cd "$srcdir/tyrian2000"
  install -vDm644 -t "$pkgdir/usr/share/$pkgname" \
    *.dat *.lvl *.shp *.snd demo.* music.mus \
    tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
}
