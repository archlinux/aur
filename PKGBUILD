# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgname="headsetcontrol-notificationd-git"
pkgver="r11.bb8a80e"
pkgrel=1
arch=("any")
pkgdesc="Logitech G933 battery notification daemon for Linux"
url="https://github.com/Manawyrm/headsetcontrol-notificationd"
depends=(
	"headsetcontrol"
	"libnotify"
	"php"
)
provides=("headsetcontrol-notificationd")
source=("git+$url")
b2sums=("SKIP")

pkgver() {
	cd "${pkgname::-4}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare()
{
	cd "${pkgname::-4}"
	sed -i "s|/usr/local/bin|/usr/bin|g" "headsetcontrol-notificationd.service"
}

package()
{
	cd "${pkgname::-4}"
	install -Dm755 "headsetcontrol-notificationd" "$pkgdir/usr/bin/headsetcontrol-notificationd"
	install -Dm644 "headsetcontrol-notificationd.service" "$pkgdir/usr/lib/systemd/system/headsetcontrol-notificationd.service"
}
