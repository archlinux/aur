# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet
pkgver=9.0.2
pkgrel=2
pkgdesc="A customized version by DDRaceNetwork of this 2D shooting game"
arch=('i686' 'x86_64')
url="http://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl' 'freetype2' 'openssl098')
optdepends=('teeworlds-ddnet-skins: extra skins')
makedepends=('gendesk' 'unzip')
provides=('teeworlds' 'teeworlds-ddnet-skins')
conflicts=('teeworlds')
         # PNG converted from DDNet.ico from https://github.com/def-/ddnet
source=(teeworlds-ddnet.png)
source_i686=("$url/downloads/DDNet-$pkgver-linux_x86.tar.gz")
source_x86_64=("$url/downloads/DDNet-$pkgver-linux_x86_64.tar.gz")
md5sums=('41465eb3a4ecf2e7f7afe5a5f0c84386')
md5sums_i686=('2c1d4934d9f8dbf56370a090ad291f95')
md5sums_x86_64=('c07dda0f99bd57bc6b1f6683143b18b4')

# Check hashs manually (replace $pkgver):
# curl -sL http://ddnet.tw/downloads/md5sums | grep -E DDNet-$pkgver-linux

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Teeworlds' --categories 'Game;ArcadeGame'
  
  # Download latest collection of the Skin Database from DDNet site (~ 1.5 MB)
  # See: http://ddnet.tw/skins/
  rm -fR database.dir database.zip
  curl -O http://ddnet.tw/skins/zip/database.zip 
  unzip -q database.zip
}

package() {
  cd DDNet-$pkgver-linux_*
  
    # Install binaries
  install -Dm755 DDNet "$pkgdir"/usr/bin/teeworlds-ddnet
  install -Dm755 DDNet-Server "$pkgdir"/usr/bin/teeworlds-ddnet_srv
  install -Dm755 dilate "$pkgdir"/usr/bin/dilate

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
