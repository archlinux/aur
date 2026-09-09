# Maintainer: aarto <aarto@archlinux.org>
_pkgname=steamcontrollertool
pkgname=$_pkgname-git
pkgver=r15.b73b4dd
pkgrel=1
pkgdesc="Tool to flash firmware on the original 2015 Steam Controller"
arch=('any')
url="https://github.com/lilphil/SteamControllerTool"
license=('GPL-2.0-only')
depends=('python' 'python-hid')
makedepends=('git')
optdepends=('steam-devices: udev rules for non-root access to the controller')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/lilphil/SteamControllerTool.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	sed -i '1s|#!/usr/bin/env python3|#!/usr/bin/python|' main.py
}

package() {
	cd "$_pkgname"

	install -dm755 "$pkgdir/usr/share/$_pkgname"
	install -m644 \
		SteamController.py \
		USBHidDevice.py \
		ValveSoftwareWiredController.py \
		ValveSoftwareWiredControllerBootloader.py \
		constants.py \
		-t "$pkgdir/usr/share/$_pkgname"
	install -m755 main.py -t "$pkgdir/usr/share/$_pkgname"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/share/$_pkgname/main.py" "$pkgdir/usr/bin/$_pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
