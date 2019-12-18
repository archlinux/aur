# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=lemonade-git
pkgver=v1.1.1.r14.gddbd6c1
pkgrel=5
pkgdesc='A remote utility tool (copy, paste and open browser) over TCP.'
url="https://github.com/lemonade-command/lemonade"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/lemonade-command/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	cd "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	go build \
		-ldflags "-s -w -X github.com/lemonade-command/lemonade/lemon.Version=${pkgver}" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/lemonade
}

package() {
	cd "${srcdir}/go/src/github.com/lemonade-command/lemonade"

	install -Dm755 "build/lemonade" "${pkgdir}/usr/bin/lemonade"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
