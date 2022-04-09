# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=zelda-classic
pkgver=2.50.2.29
pkgrel=2
pkgdesc="A tribute to Nintendo's The Legend of Zelda (NES)"
arch=('i686' 'x86_64')
url="http://zeldaclassic.com"
license=('GPL3' 'custom')
depends_i686=('libxxf86vm' 'libxcursor' 'alsa-lib' 'bash')
depends_x86_64=('lib32-libxxf86vm' 'lib32-libxcursor' 'lib32-alsa-lib' 'bash')
optdepends_i686=('gtk-engine-murrine: needed for the gtk2-launcher')
optdepends_x86_64=('lib32-gtk-engine-murrine: needed for the gtk2-launcher')
install=$pkgname.install
source=("$pkgname-2-50-2-linux.tar.gz::https://www.zeldaclassic.com/download/100/"
        "$pkgname.png"
        "$pkgname-zlaunch.png"
        "$pkgname-zquest.png"
        "$pkgname.desktop"
        "$pkgname-zlaunch.desktop"
        "$pkgname-zquest.desktop"
        "$pkgname.sh")
sha256sums=('44e105415b1b1d5ca5c625907cf6fc2ce835ddaf9b70a6ace4cd0febe1ae4ed0'
            'bb4331ce9940c81edb95d3388f3e3cb459c1559df159d727b0302dd7dbbd82e1'
            'bfc007209c30f8b752ad102e2f9e6a4cd4fc447dc306c2712db4f34a8ffb3b7e'
            'e436cfa2303703037a800b298ad52f50af8e9e2d3e410e9298a6218761c9d088'
            '23c4158bea70740a3685217dcb0e8cc1225425af437cfccf6d12c83de4743c8c'
            '44e1c4f0a0bed46ce40cb7659863c797b47d1afcef99c86cc329d10898511c2f'
            '72bc054a698e36b9a23e3907ac9112aab78b0424c71ba0c9a657cbe78886572c'
            '7188389790cdc030316231103a76b0e692e4a546fed748d86f15f977907be684')
options=('!strip')

package() {
  cd "Zelda Classic"

  # create folders
  install -d "$pkgdir"/{opt/$pkgname/samplesoundset,usr/{bin,share/doc/$pkgname}}

  # install binaries + libraries
  install -m755 {romview,zelda,zlaunch,zquest}-l "$pkgdir"/opt/$pkgname
  install -m644 *.so "$pkgdir"/opt/$pkgname

  # install data files
  install -m644 samplesoundset/patches.dat "$pkgdir"/opt/$pkgname/samplesoundset
  install -m644 *.{qst,dat,nsf} "$pkgdir"/opt/$pkgname

  # install doc files
  install -m644 *.{txt,zh} "$pkgdir"/usr/share/doc/$pkgname

  # install launchers
  install -m755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  ln -s $pkgname "$pkgdir"/usr/bin/$pkgname-zlaunch
  ln -s $pkgname "$pkgdir"/usr/bin/$pkgname-zquest

  # install icon and desktop files
  for i in zelda-classic{,-zlaunch,-zquest}; do
    install -Dm644 ../$i.png "$pkgdir"/usr/share/pixmaps/$i.png
    install -Dm644 ../$i.desktop "$pkgdir"/usr/share/applications/$i.desktop
  done

  # install soundset licence
  install -Dm644 samplesoundset/COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-soundset
}
