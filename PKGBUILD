# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-bluetooth-battery-indicator-git
pkgver=r17.aead0c9
pkgrel=1
pkgdesc="Gnome-Shell extension displaying battery percentage for bluetooth devices"
arch=('any')
url="https://github.com/MichalW/gnome-bluetooth-battery-indicator"
license=('GPL3')
depends=('gnome-shell' 'python-pybluez')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/MichalW/gnome-bluetooth-battery-indicator.git'
        'git+https://github.com/TheWeirdDev/Bluetooth_Headset_Battery_Level.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.Bluetooth_Headset_Battery_Level.url \
		"$srcdir/Bluetooth_Headset_Battery_Level"
	git submodule update
}

package() {
	_uuid='bluetooth-battery@michalw.github.com'

	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	cp -r * "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

	# Remove unnecessary files
	find "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/Bluetooth_Headset_Battery_Level" \
		-type f ! -name '*.py' -delete
}
