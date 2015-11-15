# Maintainer: Marcus Ilgner <mail@marcusilgner.com>
pkgname=k290-fnkeyctl
pkgver=1
pkgrel=3
pkgdesc="Logitech K290 Fn-key configuration"
arch=('i686' 'x86_64')
url="https://github.com/milgner/k290-fnkeyctl"
license=('MIT')
groups=()
depends=('libusb')
source=(k290_fnkeyctl.cpp
        99-k290-config.rules
        k290-fnkeyctl.sh
        LICENSE.MIT)
sha256sums=(7a2967f1fb89961b823e86d4ad7ad98ebc2421bcd96d02a598825c216a32630a
            53889796bce94b160363b27fe330cb2104bbd85ac28d028c3878747c38bf93ae
            686d674244ffb7a503b25b21ae7dfd4603efa1a480f2f4d754a754b99c79da02
            d30cadbdab051c6447e2113634166c453f101e8d2f47286049a898bf27c884dd)

build() {
	cd "$srcdir"
	g++ -std=gnu++0x -lusb-1.0 k290_fnkeyctl.cpp -o k290_fnkeyctl
}

package() {
	cd "$srcdir"
	# main binary
	mkdir -p "$pkgdir/usr/bin"
	cp k290_fnkeyctl "$pkgdir/usr/bin"
	# udev script
	mkdir -p "$pkgdir/etc/udev/rules.d"
	sed -e s/\\/usr\\/local\\/sbin\\//\\/usr\\/bin\\// 99-k290-config.rules > "$pkgdir/etc/udev/rules.d/99-k290-config.rules"
	# systemd post-sleep script
	mkdir -p "$pkgdir/usr/lib/systemd/system-sleep"
	sed -e s/\\/usr\\/local\\/sbin\\//\\/usr\\/bin\\// k290-fnkeyctl.sh > "$pkgdir/usr/lib/systemd/system-sleep/k290-fnkeyctl.sh"
	chmod +x "$pkgdir/usr/lib/systemd/system-sleep/k290-fnkeyctl.sh"
	mkdir -p "$pkgdir/usr/share/licenses/k290-fnkeyctl"
	cp LICENSE.MIT "$pkgdir/usr/share/licenses/k290-fnkeyctl/LICENSE"
}
