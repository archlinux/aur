# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Tillmann Karras <tilkax@gmail.com>

pkgname=dynablaster-revenge
pkgver=1.0.2
pkgrel=2
pkgdesc='3D remake of the original Bomberman/Dynablaster game'
arch=('i686' 'x86_64')
url='https://dynablaster.titandemo.de/'
# authors contacted: no explicit license
license=('unknown')
depends=('qt4' 'sdl2')
install=$pkgname.install
source=("http://prods.j-chaos.net/dynablaster_revenge.zip"
        "$pkgname.sh"
        "$pkgname-server.sh"
        "$pkgname.desktop")
sha256sums=('616584127283f02de1d0481607393bb37771ea0df3e684420633ccbc3f5449f5'
            'ec1ee8d5852d49b6c6cd89e1d0fe92525a94910eb6c83b4796fe4dd42df31493'
            '1519bb6cd45067e52e92f2cb92d67b5ebacc4c0bc56623212907a98bc9d79623'
            '6a188580b1e22088481819c0df20981ae96ee79e7402238e7ae2570d519ef77c')

# Uncomment to keep a copy (.pacsave) of game settings on uninstall
#backup=("usr/share/$pkgname/data/game.ini"
#        "usr/share/$pkgname/data/server.ini")

prepare() {
  cd dynablaster_revenge_v1_0_2

  rm *.exe *.dll

  case $CARCH in
    i686)
      mv dynablaster_linux_x86 dynablaster
      mv server_linux_x86 server
      rm *x64
    ;;
    x86_64)
      mv dynablaster_linux_x64 dynablaster
      mv server_linux_x64 server
      rm *x86
    ;;
  esac
}

package() {
  install -d "$pkgdir"/usr/{bin,share/applications,lib/$pkgname}

  cp -r dynablaster_revenge_v1_0_2 "$pkgdir"/usr/share/$pkgname
  mv "$pkgdir"/usr/share/$pkgname/dynablaster "$pkgdir"/usr/lib/$pkgname/
  mv "$pkgdir"/usr/share/$pkgname/server "$pkgdir"/usr/lib/$pkgname/
  chown root:games "$pkgdir"/usr/share/$pkgname/data/{game.ini,server.ini}
  chmod g+w "$pkgdir"/usr/share/$pkgname/data/{game.ini,server.ini}

  install -m755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -m755 $pkgname-server.sh "$pkgdir"/usr/bin/$pkgname-server
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/
}
