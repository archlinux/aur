# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.0.17
pkgrel=3
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(npm)
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
	"$pkgname.js"
	"$pkgname.desktop"
	icons.patch
)
install=$pkgname.install
options=('!strip')

build(){
	cd $srcdir/$pkgname-desktop-$pkgver
	patch -Np1 -i ../icons.patch
	npm install
	npm run build
	rm -rf {.eslint*,.travis*}
	cp -rf prod/* js/
	npm prune --production
}

package(){
	cd $srcdir
	appdir=/usr/lib/

	msg2 "Installing Openbazaar data"
	install -d $pkgdir/$appdir
	cp -r $pkgname-desktop-$pkgver $pkgdir/$appdir$pkgname

	msg2 "Installing execution script"
	install -Dm755 $pkgname.js $pkgdir/usr/bin/$pkgname

	msg2 "Installing icons and desktop menu entry"
	install -Dm644 $pkgname-desktop-$pkgver/imgs/icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

md5sums=('3bea757fb365f59794a751598bfb2024'
         '122a3e23d7ecfef0a82e756cb97c3e98'
         '43c9c9ef1d3ca873eea6b6343ca072e8'
         'c8d61887729b1326c611aafba89e0df1')
