# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gotty-git
pkgver=v2.0.0.alpha.3.r0.ga080c85
pkgrel=3
pkgdesc='Share your terminal as a web application'
url=https://github.com/yudai/gotty
arch=('any')
license=('MIT')
makedepends=('git' 'go' 'godep')
conflicts=('gotty' 'gotty-bin')
provides=('gotty' 'gotty-bin')
source=("${pkgname}::git+https://github.com/yudai/gotty.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/yudai/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/yudai/gotty"

	cd "${srcdir}/go/src/github.com/yudai/gotty"

	export GOPATH="${srcdir}/go"
	go get -v -d ./...
}

build() {
	cd "${srcdir}/go/src/github.com/yudai/gotty"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/yudai/gotty"

	install -Dm755 gotty "${pkgdir}/usr/bin/gotty"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
