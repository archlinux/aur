# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet-git
_name=teeworlds-ddnet
pkgver=9.0.2.r6228.96f2a38
pkgrel=1
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game (Git)"
arch=('i686' 'x86_64')
url="http://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2'  'openssl098')
makedepends=('git' 'bam' 'gendesk' 'imagemagick')
optdepends=('teeworlds-ddnet-skins: extra skins')
provides=('teeworlds' 'teeworlds-ddnet' 'teeworlds-ddnet-skins')
conflicts=('teeworlds' 'teeworlds-ddnet-skins')
source=($pkgname::git+https://github.com/ddnet/ddnet)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  v=$(grep GAME_RELEASE_VERSION src/game/version.h | cut -d\" -f2)
  printf %s.r%s.%s $v $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  convert "$pkgname/other/icons/DDNet.ico" "$srcdir/$pkgname.png"
  gendesk -f -n --pkgname "$_name" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'

  # Download latest collection of the Skin Database from DDNet site
  # See: http://ddnet.tw/skins/
  rm -fR database.dir database.zip
  curl -O http://ddnet.tw/skins/zip/database.zip
  unzip -q database.zip
}

build() {
  cd $pkgname
  bam release
}

package() {
  cd $pkgname
  
    # install binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 dilate "$pkgdir"/usr/bin/dilate

    # Install data files
  mkdir -p "$pkgdir"/usr/share/teeworlds/data
  cp -r data/* "$pkgdir"/usr/share/teeworlds/data
  
    # Install skins provided by Skins Database
  cp "$srcdir"/database.dir/* "$pkgdir"/usr/share/teeworlds/data/skins/
  
  install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "$srcdir/$pkgname-0.png" "$pkgdir/usr/share/pixmaps/$_name.png"
  
    # Install license files
  install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
