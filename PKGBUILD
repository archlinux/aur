# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=goverlay-git
pkgver=0.1.3.r11.g1f00701
pkgrel=1
pkgdesc="An opensource project that aims to create a Graphical UI to help manage Linux overlays."
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('gtk2')
makedepends=('git' 'lazarus' 'imagemagick')
optdepends=('mangohud')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	lazbuild \
		--lazarusdir=/usr/lib/lazarus \
		--build-all \
		goverlay.lpi

	convert goverlay.ico[0] 256x256.png
	convert goverlay.ico[1] 128x128.png
	convert goverlay.ico[2] 64x64.png
	convert goverlay.ico[3] 48x48.png
	convert goverlay.ico[4] 32x32.png
	convert goverlay.ico[5] 16x16.png
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"

	for icon_size in 16 32 48 64 128 256; do
		icons_dir=usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 ${icon_size}x${icon_size}.png $pkgdir/$icons_dir/${pkgname%-git}.png
	done
}
