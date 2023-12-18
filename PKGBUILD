# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Maintainer: Asuka Minato

pkgname=flashbrowser-bin
_dirname=FlashBrowser-linux-x64
pkgver=0.8.1
pkgrel=2
pkgdesc="A browser dedicating to supporting adobe flash."
arch=(x86_64 aarch64 i686)
url="https://flash.pm/browser/"
license=(unknown)
depends=(electron9 nodejs bash)
makedepends=(imagemagick git innoextract)
conflicts=(flashbrowser)
provides=(flashbrowser)
source=(
	#	"https://github.com/radubirsan/FlashBrowser/releases/download/v${pkgver}/FlashBrowser-linux-x64.zip"
	"https://github.com/radubirsan/FlashBrowser/releases/download/v0.81/v0.81_FlashBrowser_x64.exe"
	"git+https://github.com/Hadaward/flashplayer-plugin.git"
	$pkgname.desktop
)
sha256sums=('ce573c0b8c54161b468056ab6c62214edea12b05c1c25e1bbb6e54ace8a703ec'
	'SKIP'
	'de78027fba577b69923ef2d59598f3426a7632c7192a20d6d2fbe5dfcf26655b')

prepare() {
	innoextract *.exe
}

package() {
	install -d "$pkgdir/opt/$pkgname/"
	cp -av "$srcdir/app/resources/app" "$pkgdir/opt/$pkgname/"

	bsdtar -xf $srcdir/flashplayer-plugin/32.0.0.363/linux.zip -C $srcdir/
	cp -av $srcdir/lib* "$pkgdir/opt/$pkgname/app/flashver/"
	sed -i "/case 'x32':/,/break/{s|libpepflashplayer.so|libpepflashplayer-i386.so|}" $pkgdir/opt/$pkgname/app/index.js
	sed -i "/case 'x64':/,/break/{s|libpepflashplayer.so|libpepflashplayer-x86_64.so|}" $pkgdir/opt/$pkgname/app/index.js

	find $pkgdir -name "*.dll" -print -delete
	printf "#!/bin/sh
exec electron9 /opt/$pkgname/app
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/$pkgname
	install -Dm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
	# code from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=flashbrowser-git
	for d in 16 24 32 48 256; do
		install -d "$pkgdir/usr/share/icons/hicolor/${d}x${d}/apps"
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
		convert "$srcdir/app/resources/app/icon.ico[${layer}]" -define icon:auto-resize=${i} \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
	done
}
