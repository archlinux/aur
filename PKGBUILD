# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy
pkgver=0.9.62
pkgrel=2
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('imagemagick')
optdepends=('plog: library for debug logging'
            'qt5ct: recommended on DE without Qt integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('4e0b8cc841fca66fe185c8e55f83dd5f924407c01d04c73f49227b3dac1250a9'
            '6c67db210bd45f51d80119d25ffcaff9861aea926427ccf186d4530cf35ecf5d')

build() {
	cd "$pkgname-$pkgver"
	qmake Gammy.pro PREFIX=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install

	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 32 64 128; do
		convert icons/${icon_size}x${icon_size}ball.ico \
			"$srcdir/${icon_size}x${icon_size}ball.png"
	done

	for icon_size in 16 32 64 128; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d "$pkgdir/$icons_dir"
		install -m644 "$srcdir/${icon_size}x${icon_size}ball.png" \
			"$pkgdir$icons_dir/$pkgname.png"
	done
}
