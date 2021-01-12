# Maintainer: Ritwick Verma <verma1997@gmail.com>
# Contributer : Mark Wagie
# Upstream URL: https://github.com/RitwickVerma/Gesture-Manager-X

pkgname=gesture-manager-x-git
pkgver=r5.856d1fd
pkgrel=1
pkgdesc="Extended GUI for interacting with libinput-gestures"
arch=('any')
url="https://github.com/RitwickVerma/Gesture-Manager-X"
license=('GPL3')
depends=('libinput-gestures' 'xf86-input-libinput' 'gtk3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/RitwickVerma/Gesture-Manager-X.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's|/usr/bin/gesture-manager-x|gesture-manager-x|g' \
		"${pkgname%-git}.desktop.in"
	sed -i 's|/usr/share/gesture-manager-x/icon.svg|gesture-manager-x|g' \
		"${pkgname%-git}.desktop.in"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 daemonHelper.py gestureHelper.py ui.glade -t \
		"$pkgdir/usr/share/${pkgname%-git}"

	install -Dm755 main.py -t "$pkgdir/usr/share/${pkgname%-git}"
	install -dm755 "$pkgdir/usr/bin"
	echo -e "#!/bin/sh\npython3 /usr/share/${pkgname%-git}/main.py" > \
		"$pkgdir/usr/bin/${pkgname%-git}"
	chmod +x "$pkgdir/usr/bin/${pkgname%-git}"

	install -Dm644 "${pkgname%-git}.desktop.in" \
		"$pkgdir/usr/share/applications/${pkgname%-git}.desktop"

	install -Dm644 icon.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
}
