# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.0.20
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(i686 x86_64)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(npm)
source=("https://github.com/OpenBazaar/openbazaar-desktop/archive/v$pkgver.tar.gz"
	"$pkgname.js"
	"$pkgname.desktop"
)
install=$pkgname.install
options=('!strip')

build(){
	cd $srcdir/$pkgname-desktop-$pkgver
	npm install --silent 
	npm run build
	npm prune --production
}

package(){
	cd $srcdir
	appdir="usr/lib/$pkgname"

	msg2 "Installing Openbazaar data"
	install -d $pkgdir/${appdir%%/$pkgname}
	cp -rf $pkgname-desktop-$pkgver $pkgdir/$appdir

	msg2 "Installing execution script"
	install -Dm755 $pkgname.js $pkgdir/usr/bin/$pkgname

	msg2 "Installing icons and desktop menu entry"
	install -Dm644 $pkgname-desktop-$pkgver/imgs/icon.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	
	# Cleanup
	cd $pkgdir/$appdir
	rm -rf .git*
	rm -rf .travis
	cp -rf prod/* js/
    	find "${pkgdir}"/${appdir} \
        	-name "bin" -prune -exec rm -r '{}' \; \
        	-or -name "example" -prune -exec rm -r '{}' \; \
       	 	-or -name "examples" -prune -exec rm -r '{}' \; \
        	-or -name "test" -prune -exec rm -r '{}' \; \
        	-or -executable -type f -exec rm -r '{}' \;
}

md5sums=('222698bf987a9bbd79bf3eae55ea8f30'
         '122a3e23d7ecfef0a82e756cb97c3e98'
         '43c9c9ef1d3ca873eea6b6343ca072e8')
