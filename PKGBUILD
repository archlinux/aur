# Maintainer: Nils Schulte <aur@nilsschulte.de>

pkgname=waybind-git
_pkgname=waybind
pkgver=v0.1.1.r8.g86b4fb9
pkgrel=3
pkgdesc='Simple Key rebinder'
arch=('x86_64')
url='https://github.com/arnarg/waybind'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('waybind')
conflicts=('waybind')
source=("$_pkgname::git+https://github.com/arnarg/waybind")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make PREFIX=/usr VERSION="$(pkgver)"
}

package() {
	cd "$srcdir/$_pkgname"

	mkdir -p "${pkgdir}/usr/bin/"
	install -Dm755 waybind "${pkgdir}/usr/bin/waybind"

	#install systemd unit
	install -Dm644  "../../waybind.service" "${pkgdir}/usr/lib/systemd/system/$_pkgname.service"

	#install example config file
	mkdir -p "${pkgdir}/etc/waybind/"
	if [ ! -f "/etc/waybind/config.yml" ]; then
            install -Dm644 "../../default-config.yml" "${pkgdir}/etc/waybind/config.yml"
        fi
}
