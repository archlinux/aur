# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=rambox
pkgver=0.5.14
_relver=0.5.14  # for a release tarball containing env.js
_menupatchver=2
pkgrel=1
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=(i686 x86_64)
depends=(electron)
makedepends=(desktop-file-utils asar ruby npm sencha-cmd-6)
url='http://rambox.pro/'
license=('GPL3')
source=("https://github.com/saenzramiro/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/saenzramiro/$pkgname/releases/download/$_relver/Rambox-$_relver-x64.tar.gz"
        "context-menu-$_menupatchver.patch::https://github.com/saenzramiro/rambox/pull/1074/commits/c27f5d1771666766e983424b223e2072f839ee41.patch"
        "$pkgname.desktop" "$pkgname.js")
sha256sums=('cfc7e05fc8baa9bb9b12e8ca0987854f5750dc6a8405038327c6874bcdc5e44d'
            '595531e02d0ebed3387d39f24a041617ad461515515ad245fc704b6a8c64d489'
            '25569a4ef5569a49f8873e7e9699b116f72a66ad22719f4e486499e7629332db'
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
