# Maintainer: Geeko <sheepsull@gmail.com>

pkgname=betterspades
pkgver=0.1.5
pkgrel=3
pkgdesc="Opensource game client for Ace Of Spades 0.75 protocol"
arch=('i686' 'x86_64')
url='https://github.com/xtreme8000/betterspades/'
license=('GPL3')
depends=('hicolor-icon-theme' 'openal' 'glfw' 'enet' 'glew')
makedepends=('glfw' 'libdeflate' 'enet' 'cmake' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtreme8000/$pkgname/archive/v${pkgver}.tar.gz"
        "$pkgname.desktop"
        "$pkgname")
sha512sums=('743c66f620be0e15a4b9055ba0e1709fcec6e7152836f4c87ad6545cd2b03fc14691b523b196608c5a62e7774f272227b3b7bc436445e5205549b55cb5284ceb'
            '45488d7196410a1bc9461de82ac28ac5335cb99babae5f8a4465539b196a4cbe9361aa1f8d7521289537aae6fdb2a8c5c2588b20f4fd5fe7c4484f9c9c8e285b'
            '5cac9e619faa2d83a3db76753b9bbea40d3c97de579701357d6d6472feb378bb4dca1ba389b132ae6187b0a15b2bc17d42fba331e0c653682827d09af0e231aa')

build() {
	cd $srcdir/BetterSpades-${pkgver}

    	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

	cmake ..
	make
	cp -v $srcdir/bsresources.zip bin/
	cd bin
	unzip -u bsresources.zip
	rm bsresources.zip
}

package() {
	cd $srcdir/BetterSpades-${pkgver}/build/bin
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	rm icon.png
	install -d "$pkgdir/opt/$pkgname"
	cp -a "$srcdir/BetterSpades-${pkgver}-beta/build/bin/." "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	# Moving cache and config files to home dir to avoid crashes
	rm -rf "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/cache" "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/config.ini" "$pkgdir/opt/$pkgname/config.ini"
}
