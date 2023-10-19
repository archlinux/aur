# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=flashbrowser
_appname=FlashBrowser
pkgver=0.81
pkgrel=2
pkgdesc="A browser capable of viewing/displaying pages with embedded flash content"
url="https://flash.pm/"
arch=('any')
license=('unknown')
makedepends=('npm' 'wine' 'wine-mono' 'imagemagick')
provides=('flashbrowser')
conflicts=('flashbrowser')
source=("${_appname}-${pkgver}.tar.gz::https://github.com/radubirsan/FlashBrowser/archive/refs/tags/v${pkgver}.tar.gz"
	"FlashBrowser.desktop")
sha256sums=('062e59a50e30a7cdd618328d9582b58d805dfe50990a9f93df2dddc8c6e4b4ae'
            'c4cf51979c204268bc70533a319e3fdfb913dec0aa8edaea0a7f7a7cb8ca3b78')

prepare() {
	cd "$srcdir"/$_appname-$pkgver
	npm i --legacy-peer-deps --cache "$srcdir"/npm-cache
}

build() {
	cd "$srcdir"/$_appname-$pkgver
	# build3: 'electron-packager . FlashBrowser --all --overwrite --icon=icon.ico'
	npm run build3 --target dir
}

package() {
	mkdir -p "$pkgdir"/opt/$pkgname "$pkgdir"/usr/bin

	# Install 'any' supported 'arch'
	[ $CARCH = "i686" ] 	&& cp -av "$srcdir"/$_appname-$pkgver/$_appname-linux-ia32/* "$pkgdir"/opt/$pkgname
	[ $CARCH = "x86_64" ] 	&& cp -av "$srcdir"/$_appname-$pkgver/$_appname-linux-x64/* "$pkgdir"/opt/$pkgname
	[ $CARCH = "armv7h" ] 	&& cp -av "$srcdir"/$_appname-$pkgver/$_appname-linux-armv7l/* "$pkgdir"/opt/$pkgname
	[ $CARCH = "aarch64" ] 	&& cp -av "$srcdir"/$_appname-$pkgver/$_appname-linux-arm64/* "$pkgdir"/opt/$pkgname

	# Install /usr/bin executable
	ln -s /opt/$pkgname/$_appname "${pkgdir}"/usr/bin/$_appname

	# Install desktop entry file
	install -Dm644 "$srcdir"/$_appname.desktop "$pkgdir"/usr/share/applications/$_appname.desktop

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

	convert "$srcdir"/$_appname-$pkgver/icon.ico[${layer}] -define icon:auto-resize=${i} \
		"$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/${_appname}.png
	done
}
