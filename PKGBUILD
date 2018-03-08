# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.5.16
_menupatchver=2
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby npm sencha-cmd-6)
url='http://rambox.pro/'
license=(GPL3)
source=("https://github.com/saenzramiro/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/saenzramiro/$pkgname/releases/download/$pkgver/Rambox-$pkgver-x64.tar.gz"
        "context-menu-$_menupatchver.patch::https://github.com/saenzramiro/rambox/pull/1074/commits/c27f5d1771666766e983424b223e2072f839ee41.patch"
        "$pkgname.desktop" "$pkgname.js")
sha256sums=('6418d6dd95a1adc8c66cbd2b5828945b543d16c46c29393c63a03c379c024dda'
            '329d0626e4c96b5b70d1dd728a929dc63daca164c1697d3cc67921b17a3f6a62'
            '25569a4ef5569a49f8873e7e9699b116f72a66ad22719f4e486499e7629332db'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '3b5ed6f04eea66f239b5ae56ea1ff9e47de156cd38bb54ebc46541daba6091b6')
noextract=("Rambox-$pkgver-x64.tar.gz")

build() {
	# retrieve env.js
	cd "$srcdir"
	tar xOf "Rambox-$pkgver-x64.tar.gz" "Rambox-$pkgver/resources/app.asar" >app.asar
	cd "$pkgname-$pkgver"
	asar ef ../app.asar env.js
	
	# context menu patch
	patch -p1 -i "../context-menu-$_menupatchver.patch"
	
	# install packages
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
	npm install
	
	# build
	npm run sencha:compile
	sed -i "s/require('electron-is-dev')/false/" 'build/production/Rambox/electron/main.js'
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -d "$pkgdir/usr/lib"
	cp -r 'build/production/Rambox' "$pkgdir/usr/lib/rambox"
	
	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'resources/Icon.png' "$pkgdir/usr/share/pixmaps/$pkgname.png"
	desktop-file-install "$srcdir/$pkgname.desktop" --dir "$pkgdir/usr/share/applications/"
}
