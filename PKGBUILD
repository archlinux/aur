# Maintainer: Alfredo Palhares <alfredo@palhares.me>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.7.5
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby npm sencha-cmd-6)
url='http://rambox.pro/'
license=(GPL3)
source=("https://github.com/ramboxapp/community-edition/archive/$pkgver.tar.gz"
        "https://github.com/ramboxapp/community-edition/releases/download/$pkgver/Rambox-$pkgver-linux-x64.tar.gz"
        "$pkgname.desktop" "$pkgname.js")
sha256sums=('a9f8fd67d93b193b82e6aaf57971303297918f581dae80e5dcd907ae43e348dc'
            '12400d7c774eb360e3dd15dc356af0a72b9f5813ca829cd436f9b274aaf3e67a'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '3b5ed6f04eea66f239b5ae56ea1ff9e47de156cd38bb54ebc46541daba6091b6')
noextract=("Rambox-$pkgver-x64.tar.gz")

build() {
	# retrieve env.js
	cd "$srcdir"
	tar xOf "Rambox-$pkgver-linux-x64.tar.gz" "Rambox-$pkgver-linux-x64/resources/app.asar" >app.asar
	mv "community-edition-$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	asar ef ../app.asar env.js
	
	# install packages
	sed -Ei 's/\s+"electron": "[^"]+",//' package.json
	npm install
	
	# build
	npm run sencha:compile
	sed -i "s/require('electron-is-dev')/false/" "$srcdir/rambox-build/electron/main.js"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -d "$pkgdir/usr/lib"
	cp -r 'build/production/Rambox' "$pkgdir/usr/lib/rambox"
	
	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'resources/Icon.png' "$pkgdir/usr/share/pixmaps/$pkgname.png"
	desktop-file-install "$srcdir/$pkgname.desktop" --dir "$pkgdir/usr/share/applications/"
}
