# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=flashbrowser
_appname=FlashBrowser
pkgver=0.8.1
_pkgver=0.81
pkgrel=1
pkgdesc="A browser capable of viewing/displaying pages with embedded flash content"
url="https://flash.pm/"
arch=('x86_64')
license=('unknown')
makedepends=('yarn' 'imagemagick')
provides=('flashbrowser')
conflicts=('flashbrowser')
source=("${_appname}-${_pkgver}.tar.gz::https://github.com/radubirsan/FlashBrowser/archive/refs/tags/v${_pkgver}.tar.gz"
	"https://github.com/darktohka/clean-flash-builds/releases/download/v1.7/flash_player_patched_ppapi_linux.x86_64.tar.gz"
	"FlashBrowser.desktop")
sha256sums=('062e59a50e30a7cdd618328d9582b58d805dfe50990a9f93df2dddc8c6e4b4ae'
            'fca4fd08f40639fc495c3f58a1877e7ea023ccb19f0a6466a396e418dee5a186'
            'c4cf51979c204268bc70533a319e3fdfb913dec0aa8edaea0a7f7a7cb8ca3b78')
noextract=('flash_player_patched_ppapi_linux.x86_64.tar.gz')

prepare() {
	cd "$srcdir"/$_appname-$_pkgver
	# Extract FlashPlugin (PPAPI)
	mkdir -p ../flash_plugin
	bsdtar -xf ../flash_player_patched_ppapi_linux.x86_64.tar.gz -C ../flash_plugin
	# Remove lockfile for yarn build
	rm -v package-lock.json
	# Insert custom build command
	sed '16a\    \"build5\": \"electron-packager . FlashBrowser --platform=linux --arch=x64\",' -i package.json
	# Install all dependencies
	yarn install
	yarn add electron-builder@latest electron-packager@latest electron-updater@latest
}

build() {
	cd "$srcdir"/$_appname-$_pkgver
	# Custom build5: 'electron-packager . FlashBrowser --platform=linux --arch=x64'
	yarn run build5
}

package() {
	mkdir -p "$pkgdir"/opt/$pkgname "$pkgdir"/usr/bin
	# Install app
	cp -av --no-preserve=ownership "$srcdir"/$_appname-$_pkgver/$_appname-linux-x64/* "$pkgdir"/opt/$pkgname
	# Install FlashPlugin
	install -vDm755 "$srcdir"/flash_plugin/libpepflashplayer.so \
		"$pkgdir"/opt/$pkgname/resources/app/flashver/libpepflashplayer.so
	# Install /usr/bin executable
	ln -s /opt/$pkgname/$_appname "$pkgdir"/usr/bin/$_appname
	# Install desktop entry file
	install -vDm644 "$srcdir"/$_appname.desktop "$pkgdir"/usr/share/applications/$_appname.desktop
	# Install icons
	for d in 16 24 32 48 256; do
		mkdir -p "$pkgdir"/usr/share/icons/hicolor/${d}x${d}/apps
	done

	for i in 16 24 32 48 256; do
		if 	[ $i = '16' ];	then layer=0;
		elif 	[ $i = '24' ];	then layer=1;
		elif 	[ $i = '32' ];	then layer=2;
		elif 	[ $i = '48' ];	then layer=3;
		elif 	[ $i = '256' ];	then layer=4; fi

	convert "$srcdir"/$_appname-$_pkgver/icon.ico[${layer}] -define icon:auto-resize=${i} \
		"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png
	done
}
