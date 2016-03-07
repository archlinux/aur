# Maintainer: josephgbr <rffontenelle@gmail.com>

pkgname=teeworlds-ddnet
pkgver=9.2
pkgrel=1
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game"
arch=('i686' 'x86_64')
url="https://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2' 'openssl098')
makedepends=('gendesk' 'unzip')
provides=('teeworlds')
conflicts=('teeworlds')
         # PNG converted from DDNet.ico from https://github.com/ddnet/ddnet
source=(teeworlds-ddnet.png)
source_i686=("$url/downloads/DDNet-$pkgver-linux_x86.tar.gz"
             "$url/downloads/GraphicsTools-linux_x86.tar.gz")
source_x86_64=("$url/downloads/DDNet-$pkgver-linux_x86_64.tar.gz"
               "$url/downloads/GraphicsTools-linux_x86_64.tar.gz")
md5sums=('41465eb3a4ecf2e7f7afe5a5f0c84386')
md5sums_i686=('360999bdcbe4a44798aef0acfb9f4238'
              '566354c3b4510b032af7d891381ee711')
md5sums_x86_64=('22f9211764e7cb4683d8a22f3cecb4a8'
                'fc32ca52ae9be02f68b6c257153dbd37')
noextract=('database.zip')

# Check hashs manually (replace $pkgver):
# curl -sL http://ddnet.tw/downloads/md5sums | grep -E DDNet-$pkgver-linux

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
  
  # Skin database. See more in https://ddnet.tw/skins/
  rm -fR database.zip database.dir
  curl -O "$url/skins/zip/database.zip"
  unzip -q database.zip
}

package() {
  cd DDNet-$pkgver-linux_*
  
    # Install DDNet client/server binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 config_store "$pkgdir"/usr/bin/ddnet-config_store
  install -Dm755 config_retrieve "$pkgdir"/usr/bin/ddnet-config_retrieve
    # Install Graphic Tools binaries
  install -Dm755 ../dilate "$pkgdir"/usr/bin/dilate
  install -Dm755 ../tileset_borderadd "$pkgdir"/usr/bin/tileset_borderadd
  install -Dm755 ../tileset_borderfix "$pkgdir"/usr/bin/tileset_borderfix
  install -Dm755 ../tileset_borderrem "$pkgdir"/usr/bin/tileset_borderrem
  install -Dm755 ../tileset_borderset "$pkgdir"/usr/bin/tileset_borderset
  
    # Install data files
  mkdir -p "$pkgdir"/usr/share/teeworlds/data
  cp -r data/* "$pkgdir"/usr/share/teeworlds/data
  
    # Install skins provided by Skins Database
  cp ../database.dir/* "$pkgdir"/usr/share/teeworlds/data/skins/
  find "$pkgdir"/usr/share/teeworlds/data/skins/ -type f -exec chmod 644 {} \;
  
    # Install desktop and icon files
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 ../$pkgname.png     "$pkgdir"/usr/share/pixmaps/$pkgname.png
  
    # Install license files
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
