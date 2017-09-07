# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.5.12
_relver=0.5.12  # for a release tarball containing env.js
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby yarn sencha-cmd-6)
url='http://rambox.pro/'
license=('GPL3')
source=("https://github.com/saenzramiro/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/saenzramiro/$pkgname/releases/download/$_relver/Rambox-$_relver-x64.tar.gz"
        "context-menu.patch::https://github.com/flying-sheep/$pkgname/commit/2109de0825058a3ee9c0a09a603520b8e7c09744.diff"
        "$pkgname.desktop" "$pkgname.js")
sha256sums=('8b9cfa35a7d8bb060ab0639cd942338423b6646bc89d0e5ba959a00a0ef6c70c'
            'f41049ef2082ce5e8f34463ba42ee1cc953e46cf4828fdd0bd1e9f1d5468601d'
            '953d6b589b7acee32d78da6c533e851bc90a11182b775388ddcf158decf66c8e'
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
	yarn
	
	# build
	yarn run sencha:compile
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
