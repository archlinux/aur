# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=flashbrowser
_appname=FlashBrowser
pkgver=0.8.1
_pkgver=0.81
pkgrel=3
pkgdesc="A browser capable of viewing/displaying pages with embedded flash content"
url="https://flash.pm/"
arch=(x86_64)
license=(unknown)
makedepends=(
	nodejs-lts-iron
	npm
	imagemagick
)
provides=(flashbrowser)
conflicts=(flashbrowser)
source=("${_appname}-${_pkgver}.tar.gz::https://github.com/radubirsan/FlashBrowser/archive/refs/tags/v${_pkgver}.tar.gz"
	"https://github.com/darktohka/clean-flash-builds/releases/download/v1.7/flash_player_patched_ppapi_linux.x86_64.tar.gz"
	"FlashBrowser.desktop")
sha256sums=('062e59a50e30a7cdd618328d9582b58d805dfe50990a9f93df2dddc8c6e4b4ae'
            'fca4fd08f40639fc495c3f58a1877e7ea023ccb19f0a6466a396e418dee5a186'
            'd7cb1e280719ec12d61d69ce757cfe27d7aeb2fdd207e4a6ab068c9fb7b182c2')
noextract=('flash_player_patched_ppapi_linux.x86_64.tar.gz')

prepare() {
	cd $_appname-$_pkgver
	# Extract FlashPlugin (PPAPI)
	mkdir -p ../flash_plugin
	bsdtar -xf ../flash_player_patched_ppapi_linux.x86_64.tar.gz -C ../flash_plugin
}

build() {
	cd $_appname-$_pkgver
	# Install all dependencies
	npm ci --cache ../npm-cache --legacy-peer-deps
	# Build
	npm exec electron-packager -- ./ FlashBrowser --platform=linux --overwrite --icon=icon.ico -p always --prune-license nm-prune --force
}

package() {
	install -d "$pkgdir"/opt/$pkgname "$pkgdir"/usr/bin
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
		install -d "$pkgdir"/usr/share/icons/hicolor/${d}x${d}/apps
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
	# Remove macOS FlashPlugin
	rm -rf "$pkgdir"/opt/$pkgname/resources/app/flashver/PepperFlashPlayer.plugin
	# Remove empty folders and dotfiles
	find "$pkgdir"/opt/flashbrowser/resources/app -name '.git*' | xargs rm -rf
	find "$pkgdir"/opt/flashbrowser/resources/app -empty -delete
}
