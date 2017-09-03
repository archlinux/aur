# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=ddnet
pkgver=10.8.5
pkgrel=1
pkgdesc="DDraceNetwork, a mod of Teeworlds"
arch=('i686' 'x86_64')
url="https://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl2' 'freetype2' 'opusfile' 'curl')
makedepends=('bam' 'imagemagick' 'gendesk' 'python')
optdepends=('ddnet-skins: more skins for your tee'
            'ddnet-maps-git: mainly important for a DDNet Server')
provides=('teeworlds-ddnet')
conflicts=('teeworlds-ddnet')
replaces=('teeworlds-ddnet')
source=("$url/downloads/DDNet-$pkgver.tar.xz")
source_i686=("$url/downloads/GraphicsTools-linux_x86.tar.gz")
source_x86_64=("$url/downloads/GraphicsTools-linux_x86_64.tar.gz")
md5sums=('e53226c083105dc19069a76bda46cb0b')
md5sums_i686=('566354c3b4510b032af7d891381ee711')
md5sums_x86_64=('fc32ca52ae9be02f68b6c257153dbd37')

prepare() {
      # Client
    convert "DDNet-$pkgver/other/icons/DDNet.ico" "$srcdir/DDNet.png"
    gendesk -f -n --pkgname "DDNet" --pkgdesc "$pkgdesc" \
        --name 'DDNet' --categories 'Game;ArcadeGame'
      
      # Server
    convert "DDNet-$pkgver/other/icons/DDNet-Server.ico" "$srcdir/DDNet-Server.png"
      # This desktop file, combined with 'ddnet-maps-git' pkg will
      # run DDNet Server with all votes, maps etc. -- no score/ranking, though
    gendesk -f -n --pkgname "DDNet-Server" --pkgdesc "DDNet Server"        \
        --name 'DDNet Server' --categories 'Game;ArcadeGame' --terminal=true \
        --exec='sh -c "cd /usr/share/ddnet/data && DDNet-Server"'
}

build() {
  cd DDNet-$pkgver
  bam release
}

package() {
  cd DDNet-$pkgver
  
    # Install DDNet client/server binaries
  install -Dm755 DDNet           "$pkgdir/usr/bin/DDNet"
  install -Dm755 DDNet-Server    "$pkgdir/usr/bin/DDNet-Server"
  install -Dm755 config_store    "$pkgdir/usr/bin/ddnet-config_store"
  install -Dm755 config_retrieve "$pkgdir/usr/bin/ddnet-config_retrieve"
    # Install Graphic Tools binaries
  install -Dm755 ../dilate            "$pkgdir/usr/bin/dilate"
  install -Dm755 ../tileset_borderadd "$pkgdir/usr/bin/tileset_borderadd"
  install -Dm755 ../tileset_borderfix "$pkgdir/usr/bin/tileset_borderfix"
  install -Dm755 ../tileset_borderrem "$pkgdir/usr/bin/tileset_borderrem"
  install -Dm755 ../tileset_borderset "$pkgdir/usr/bin/tileset_borderset"
  
    # Install data files
  mkdir -p "$pkgdir/usr/share/ddnet/data"
  cp -r data/* "$pkgdir/usr/share/ddnet/data"
  
    # Install desktop and icon files
  install -Dm644 ../DDNet.desktop     "$pkgdir/usr/share/applications/ddnet.desktop"
  install -Dm644 ../DDNet-Server.desktop "$pkgdir/usr/share/applications/ddnet-server.desktop"
  install -Dm644 ../DDNet-5.png       "$pkgdir/usr/share/pixmaps/DDNet.png"
  install -Dm644 ../DDNet-Server-8.png   "$pkgdir/usr/share/pixmaps/DDNet-Server.png"
  
    # Install license files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
