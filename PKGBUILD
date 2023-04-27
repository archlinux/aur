# Maintainer: Elara Musayelyan <elara@elara.ws>
pkgname=itd-git
pkgver=r259.25220cf
pkgrel=2
pkgdesc="Daemon that interfaces with InfiniTime firmware on the PineTime smartwatch"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=('bluez' 'dbus' 'playerctl')
provides=('itd' 'itctl')
conflicts=('itd' 'itctl')
makedepends=('go')
source=('git+https://gitea.elara.ws/Elara6331/itd.git')
md5sums=('SKIP')
backup=('etc/itd.toml')

pkgver() {
    cd "$srcdir/itd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" > version.txt
}

build() {
	cd "$srcdir/itd"
	go build
	go build ./cmd/itctl
}

package() {
	cd "$srcdir/itd"

	install -Dm755 ./itd "$pkgdir/usr/bin/itd"
	install -Dm755 ./itctl "$pkgdir/usr/bin/itctl"
	install -Dm644 ./itd.service "$pkgdir/usr/lib/systemd/user/itd.service"
	install -Dm644 ./itd.toml "$pkgdir/etc/itd.toml"
}
