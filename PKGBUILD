# Maintainer: robertfoster

pkgname=openbazaar
pkgver=2.0.18
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
	npm install
	npm run build
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

	# Clean up
	find "${pkgdir}"${appdir} \
		-name "package.json" \
            	-exec sed -e "s|${srcdir}/${pkgname}-${pkgver}|${appdir}|" \
                -i {} \; \
	        -or -name ".*" -prune -exec rm -r '{}' \; \
        	-or -name "bin" -prune -exec rm -r '{}' \; \
	        -or -name "example" -prune -exec rm -r '{}' \; \
        	-or -name "examples" -prune -exec rm -r '{}' \; \
	        -or -name "test" -prune -exec rm -r '{}' \; \
        	-or -executable -type f -exec rm -r '{}' \;
}

md5sums=('245c699cbca72ee71c7cdc1487cb285f'
         '122a3e23d7ecfef0a82e756cb97c3e98'
         '43c9c9ef1d3ca873eea6b6343ca072e8')
