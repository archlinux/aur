# Maintainer: Peter Laca <peter@laca.me>
pkgname=dotp-git
pkgrel=1
pkgver=0.0.1.20240718.01.r37.c84e4f9
pkgdesc="Command-line tool for managing Time-based One-Time Passwords (TOTPs)"
arch=('i686' 'x86_64')
url="https://github.com/petlack/dotp"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'go')
provides=("dotp")
conflicts=("dotp")
source=("dotp::git+https://github.com/petlack/dotp")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/dotp" || exit
	_pkgver=$(cat version.txt)
	echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/dotp" || exit
	CGO_ENABLED=0 \
		GOOS=linux \
		go build -a \
		-ldflags="-s -w" \
		-installsuffix cgo \
		-o build/dotp \
		.
}

package() {
	cd "${srcdir}/dotp" || exit
	install -Dm755 build/dotp "$pkgdir/usr/bin/dotp"
}
