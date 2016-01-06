# Maintainer: josephgbr <rffontenelle@gmail.com>

pkgname=teeworlds-ddnet
pkgver=9.1
pkgrel=1
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game"
arch=('i686' 'x86_64')
url="http://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2' 'openssl098')
makedepends=('gendesk' 'unzip')
provides=('teeworlds')
conflicts=('teeworlds')
         # PNG converted from DDNet.ico from https://github.com/ddnet/ddnet
source=(teeworlds-ddnet.png
        "$url/skins/zip/database.zip")
source_i686=("$url/downloads/DDNet-$pkgver-linux_x86.tar.gz")
source_x86_64=("$url/downloads/DDNet-$pkgver-linux_x86_64.tar.gz")
md5sums=('41465eb3a4ecf2e7f7afe5a5f0c84386'
         'SKIP')
md5sums_i686=('83f94cb8622ebf7c90cc58318a45fae7')
md5sums_x86_64=('01cc3930abd203d970b5abaa64c6b558')
noextract=('database.zip')

# Check hashs manually (replace $pkgver):
# curl -sL http://ddnet.tw/downloads/md5sums | grep -E DDNet-$pkgver-linux

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
  
  # Unzip latest collection of the Skin Database from DDNet site (~ 5 MB)
  # See: http://ddnet.tw/skins/
  rm -fR database.dir
  unzip -q database.zip
  rm -fR database.zip
}

package() {
  cd DDNet-$pkgver-linux_*
  
    # Install binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 dilate "$pkgdir"/usr/bin/ddnet-dilate
  install -Dm755 config_store "$pkgdir"/usr/bin/ddnet-config_store
  install -Dm755 config_retrieve "$pkgdir"/usr/bin/ddnet-config_retrieve

    # Install data files
  mkdir -p "$pkgdir"/usr/share/teeworlds/data
  cp -r data/* "$pkgdir"/usr/share/teeworlds/data
  
    # Install skins provided by Skins Database
  cp "$srcdir"/database.dir/* "$pkgdir"/usr/share/teeworlds/data/skins/
  
    # Install desktop and icon files
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png     "$pkgdir"/usr/share/pixmaps/$pkgname.png
  
    # Install license files
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
