# Maintainer: Peter Laca <peter@laca.me>
pkgname=dotdev-git
pkgrel=1
pkgver=0.0.1.20250224.01.r11.89cbf87
pkgdesc="Lightweight Web server for static HTML with built-in live reload written in Go."
arch=('i686' 'x86_64')
url="https://github.com/petlack/dotdev"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go')
provides=("dotdev")
conflicts=("dotdev")
source=("dotdev::git+https://github.com/petlack/dotdev")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/dotdev" || exit
	_pkgver=$(cat version.txt)
	echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/dotdev" || exit
	CGO_ENABLED=0 \
		GOOS=linux \
		go build -a \
		-ldflags="-s -w" \
		-installsuffix cgo \
		-o build/dotdev \
		.
}

package() {
	cd "${srcdir}/dotdev" || exit
	install -Dm755 build/dotdev "$pkgdir/usr/bin/dotdev"
}
