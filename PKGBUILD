# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gomuks-git
pkgdesc='A terminal based Matrix client written in Go'
pkgver=r270.2fc3378
pkgrel=1
url='https://github.com/tulir/gomuks'
license=(GPL3)
arch=(x86_64 i686)
depends=(glibc)
makedepends=(go git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")

_gopkg='maunium.net/go/gomuks'

pkgver () {
	GOPATH="${srcdir}" go get -v -u -d "${_gopkg}"
	cd "src/${_gopkg}"
	( set -o pipefail
	  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	GOPATH="${srcdir}" go get -v "${_gopkg}"
}

package () {
	install -Dm755 "${srcdir}/bin/gomuks" "${pkgdir}/usr/bin/gomuks"
}
