# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy
pkgver=0.9.58
pkgrel=3
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
makedepends=('imagemagick')
optdepends=('plog: library for debug logging'
            'qt5ct: recommended on DE without Qt integration')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v${pkgver}a.tar.gz"
        "$pkgname.desktop")
sha256sums=('6ec915045b60a9565142f0f8ac737a2bc605afd39834930c1b7bfcd41528385f'
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
