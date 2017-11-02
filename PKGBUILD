# Maintainer: M0Rf30

pkgname=openbazaar
pkgver=2.0.17
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon" 
arch=(i686 x86_64)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(npm asar)
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
		"$pkgname.sh"
		"$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')

build(){
  cd $srcdir/$pkgname-desktop-$pkgver
  npm install 
  npm run build
  rm -rf {.eslint*,.travis*}
  cp -rf prod/* js/
  npm prune --production
  asar pack ../$pkgname-desktop-$pkgver ../$pkgname.asar
}

package(){
  cd $srcdir

msg2 "Installing Openbazaar data"
  install -Dm644 $pkgname.asar $pkgdir/opt/$pkgname.asar

msg2 "Installing execution script"
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $pkgname-desktop-$pkgver/imgs/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

md5sums=('3bea757fb365f59794a751598bfb2024'
         'a4eb003ad61dc2536ff5a3241b3aa19e'
         'f48876b52eee00c24abb7bbbb53d8e6c')
