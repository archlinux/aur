# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=ddnet
pkgname=$_name-git
pkgver=10.8.3.r1.ged59b0f4a
pkgrel=1
pkgdesc="DDraceNetwork, a mod of Teeworlds"
arch=('i686' 'x86_64')
url="https://ddnet.tw"
license=('custom')
depends=('alsa-lib' 'glu' 'sdl2' 'freetype2' 'opusfile' 'curl')
makedepends=('git' 'bam' 'imagemagick' 'gendesk' 'python')
optdepends=('ddnet-skins: more skins for your tee'
            'ddnet-maps-git: mainly important for a DDNet Server')
provides=('teeworlds-ddnet-git' 'ddnet')
conflicts=('teeworlds-ddnet-git' 'ddnet')
replaces=('teeworlds-ddnet-git')
source=("git+https://github.com/$_name/$_name")
source_i686=("$url/downloads/GraphicsTools-linux_x86.tar.gz")
source_x86_64=("$url/downloads/GraphicsTools-linux_x86_64.tar.gz")
md5sums=('SKIP')
md5sums_i686=('566354c3b4510b032af7d891381ee711')
md5sums_x86_64=('fc32ca52ae9be02f68b6c257153dbd37')

pkgver() {
  cd $_name
  v=$(grep GAME_RELEASE_VERSION src/game/version.h | cut -d\" -f2)
  _commit=$(git log --pretty=oneline | grep "Version $v" | cut -d' ' -f1)
  r=$(git log $_commit..HEAD --pretty=oneline | wc -l)
  h=$(git rev-parse --short HEAD)
  printf $v.r$r.g$h
}

prepare() {
      # Client
    convert "$_name/other/icons/DDNet.ico" "$srcdir/DDNet.png"
    gendesk -f -n --pkgname "DDNet" --pkgdesc "$pkgdesc" \
        --name 'DDNet' --categories 'Game;ArcadeGame'
      
      # Server
    convert "$_name/other/icons/DDNet-Server.ico" "$srcdir/DDNet-Server.png"
      # This desktop file, combined with 'ddnet-maps-git' pkg will
      # run DDNet Server with all votes, maps etc. -- no score/ranking, though
    gendesk -f -n --pkgname "DDNet-Server" --pkgdesc "DDNet Server"        \
        --name 'DDNet Server' --categories 'Game;ArcadeGame' --terminal=true \
        --exec='sh -c "cd /usr/share/ddnet/data && DDNet-Server"'
}

build() {
  cd $_name
  bam release
}

package() {
  cd $_name
  
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
