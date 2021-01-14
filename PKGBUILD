# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy-git
pkgver=0.9.62.r0.gc9fd421
pkgrel=1
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'imagemagick')
optdepends=('plog: library for debug logging'
            'qt5ct: recommended on DE without Qt integration')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Fushko/gammy.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '6c67db210bd45f51d80119d25ffcaff9861aea926427ccf186d4530cf35ecf5d')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake Gammy.pro PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir" install

	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 32 64 128; do
		convert icons/${icon_size}x${icon_size}ball.ico \
			"$srcdir"/${icon_size}x${icon_size}ball.png
	done

	for icon_size in 16 32 64 128; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d "$pkgdir/$icons_dir"
		install -m644 "$srcdir/${icon_size}x${icon_size}ball.png" \
			"$pkgdir$icons_dir/${pkgname%-git}.png"
	done
}
