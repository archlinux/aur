# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.5.13
_relver=0.5.13  # for a release tarball containing env.js
pkgrel=2
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby npm sencha-cmd-6)
url='http://rambox.pro/'
license=('GPL3')
source=("https://github.com/saenzramiro/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/saenzramiro/$pkgname/releases/download/$_relver/Rambox-$_relver-x64.tar.gz"
        "context-menu.patch::https://github.com/flying-sheep/$pkgname/commit/2109de0825058a3ee9c0a09a603520b8e7c09744.diff"
        "$pkgname.desktop" "$pkgname.js")
sha256sums=('7d14d5da8d9c13d6253ad69142ea912c496296600afd4ad6c6bec89b967941f0'
            'eb506db7e1b412dbdbf9e0ab69686cc10f60e3c7f2e338db5c477e45eb05d198'
            '3b1c0c47d5d5e46eba7c9a3f92dac18b6378c1f41386602b8f285b506b3c4906'
            '61ad70a929c402e24c79b8868208310f9b3c4d7801db2b791af38293231ee524'
            '3b5ed6f04eea66f239b5ae56ea1ff9e47de156cd38bb54ebc46541daba6091b6')
noextract=("Rambox-$_relver-x64.tar.gz")

build() {
	# retrieve env.js
	cd "$srcdir"
	tar xOf "Rambox-$_relver-x64.tar.gz" "Rambox-$_relver/resources/app.asar" >app.asar
	cd "$pkgname-$pkgver"
	asar ef ../app.asar env.js
	
	# context menu patch
	patch -p1 -i ../context-menu.patch
	
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
