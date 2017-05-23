# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.5.8
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby yarn sencha-cmd-6)
url='http://rambox.pro/'
license=('GPL3')
source=("https://github.com/saenzramiro/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/saenzramiro/$pkgname/releases/download/$pkgver/Rambox-$pkgver-x64.tar.gz"
        "$pkgname.desktop" "$pkgname.sh")
sha256sums=('e7f0a942d8a141a25637858864f635cbe1ab4c669dd626199d5be94779b037ca'
            '6c2f257c22516988919c64fd37a5a3e9b9ef18d366907c43d3140cf91cc850c0'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '0e89fab1fb649a24ade04f5a6d2ad61cf49b789dd9b22eec0308f3a75a0cb4b0')
noextract=("Rambox-$pkgver-x64.tar.gz")

build() {
	# retrieve env.js
	cd "$srcdir"
	tar xOf "Rambox-$pkgver-x64.tar.gz" "Rambox-$pkgver/resources/app.asar" >app.asar
	cd "$pkgname-$pkgver"
	asar ef ../app.asar env.js
	
	# install packages
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
	yarn
	
	# build
	yarn run sencha:compile
	sed -i "s/require('electron-is-dev')/false/" 'build/production/Rambox/electron/main.js'
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -d "$pkgdir/opt"
	cp -r 'build/production/Rambox' "$pkgdir/opt/rambox"
	
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'resources/Icon.png' "$pkgdir/usr/share/pixmaps/$pkgname.png"
	desktop-file-install "$srcdir/$pkgname.desktop" --dir "$pkgdir/usr/share/applications/"
}
