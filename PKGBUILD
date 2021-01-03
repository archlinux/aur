# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy
pkgver=0.9.61
pkgrel=1
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
makedepends=('imagemagick')
optdepends=('plog: library for debug logging'
            'qt5ct: recommended on DE without Qt integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('5a3f5af9d78c8f290163a8848f991efc5ea18023a3ed8adfa3e7878050dd1901'
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
