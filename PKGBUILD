# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=flashbrowser
_appname=FlashBrowser
pkgver=0.81
pkgrel=1
pkgdesc="A browser capable of viewing/displaying pages with embedded flash content"
url="https://flash.pm/"
arch=('any')
license=('unknown')
depends=('npm')
makedepends=('imagemagick')
provides=('flashbrowser')
conflicts=('flashbrowser')
source=("${_appname}-${pkgver}.tar.gz::https://github.com/radubirsan/FlashBrowser/archive/refs/tags/v${pkgver}.tar.gz"
	"FlashBrowser.desktop")
sha256sums=('062e59a50e30a7cdd618328d9582b58d805dfe50990a9f93df2dddc8c6e4b4ae'
            'c4cf51979c204268bc70533a319e3fdfb913dec0aa8edaea0a7f7a7cb8ca3b78')

prepare() {
# Create executable /usr/bin file
cat > FlashBrowser.sh <<EOF
#!/bin/sh
cd /usr/lib/node_modules/FlashBrowser
npm run start &
EOF
}

build() {
	cd "$srcdir"/$_appname-$pkgver
	npm i --legacy-peer-deps --cache "$srcdir"/npm-cache

	#Cleanup npm folder
	cd ..
	find "$srcdir"/$_appname-$pkgver -type f -name ".*" -delete
	find "$srcdir"/$_appname-$pkgver -type d \( -name "_*" -o -name ".git*" \) -prune -exec rm -rf {} \;
	[ $CARCH = "x86_64" ] && find "$srcdir"/$_appname-$pkgver -type d \( -name "arm" -o -name "arm64" \) -prune -exec rm -rf {} \;
	[ $CARCH = "aarch64" ] && find "$srcdir"/$_appname-$pkgver -type d \( -name "ia32" -o -name "x64" \) -prune -exec rm -rf {} \;
	[ $CARCH = "armv7h" ] && find "$srcdir"/$_appname-$pkgver -type d \( -name "ia32" -o -name "x64" \) -prune -exec rm -rf {} \;

	# Create npm tgz package
	bsdtar -a -cf $_appname-$pkgver.tgz $_appname-$pkgver
}

package() {
	# Install npm package
	npm i -g --prefix "$pkgdir"/usr "$srcdir"/$_appname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	chmod -R u=rwX,go=rX "$pkgdir"

	# npm installs package.json owned by build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"

	# Install /usr/bin executable
	install -Dm755 "$srcdir"/$_appname.sh "$pkgdir"/usr/bin/$_appname

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

	# Install desktop entry file
	install -Dm644 ../$_appname.desktop "$pkgdir"/usr/share/applications/$_appname.desktop
}
