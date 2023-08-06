# Maintainer: Aron Young <tkf6fkt at gmail dot com>

pkgname=flashbrowser-bin
_dirname=FlashBrowser-linux-x64
pkgver=0.7
pkgrel=3
pkgdesc="A browser dedicating to supporting adobe flash."
arch=(x86_64 aarch64)
url="https://flash.pm/browser/"
license=(unknown)
depends=(electron9 nodejs bash)
makedepends=(imagemagick git)
provides=(flashbrowser)
conflicts=(flashbrowser-git)
source=(
	"https://github.com/radubirsan/FlashBrowser/releases/download/v${pkgver}/FlashBrowser-linux-x64.zip"
	"git+https://github.com/Hadaward/flashplayer-plugin.git"
	$pkgname.desktop
)
sha256sums=('0c649e024c64232401bfab316165d2bc8bda7fc997efdbbb03ba3d09a61054d6'
	'SKIP'
	'de78027fba577b69923ef2d59598f3426a7632c7192a20d6d2fbe5dfcf26655b')

package() {
	install -d "$pkgdir/opt/$pkgname/"
	cp -av "$srcdir/$_dirname/resources/app" "$pkgdir/opt/$pkgname/"

	bsdtar -xf $srcdir/flashplayer-plugin/32.0.0.363/linux.zip -C $srcdir/
	cp -av $srcdir/lib* "$pkgdir/opt/$pkgname/app/flashver/"
	sed -i "/case 'x32':/,/break/{s|flashver/libpepflashplayer.so|flashver/libpepflashplayer-i386.so|}" $pkgdir/opt/$pkgname/app/index.js
	sed -i "/case 'x64':/,/break/{s|flashver/libpepflashplayer.so|flashver/libpepflashplayer-x86_64.so|}" $pkgdir/opt/$pkgname/app/index.js

	echo -e "#!/bin/bash\nelectron9 /opt/$pkgname/app" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	install -Dm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
	# code from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=flashbrowser-git
	for d in 16 24 32 48 256; do
		mkdir -p "$pkgdir/usr/share/icons/hicolor/${d}x${d}/apps"
	done
	for i in 16 24 32 48 256; do
		if [ $i = '16' ]; then
			layer=0
		elif [ $i = '24' ]; then
			layer=1
		elif [ $i = '32' ]; then
			layer=2
		elif [ $i = '48' ]; then
			layer=3
		elif [ $i = '256' ]; then layer=4; fi
		convert "$srcdir/$_dirname/resources/app/icon.ico[${layer}]" -define icon:auto-resize=${i} \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
}
