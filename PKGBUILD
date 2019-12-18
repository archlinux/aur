# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=go-rainbow-git
pkgver=v1.0.1.r0.g49778f9
pkgrel=1
pkgdesc='Tasty rainbows for your terminal! (lolcat clone)'
url="https://github.com/arsham/rainbow"
arch=('x86_64' 'i686')
license=('Apache')
makedepends=('go')
provides=('rainbow' 'rainbow-git')
conflicts=('rainbow' 'rainbow-git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/arsham/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/arsham/rainbow"

	cd "${srcdir}/go/src/github.com/arsham/rainbow"

	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/arsham/rainbow"

	mkdir -p build

	export GOPATH="${srcdir}/go"

	#go build \
	#	-ldflags "-s -w -X github.com/arsham/rainbow/lemon.Version=${pkgver}" \
	#	-gcflags="all=-trimpath=${GOPATH}/src" \
	#	-asmflags="all=-trimpath=${GOPATH}/src" \
	#	-o build/rainbow

	go build \
		-ldflags "-s -w " \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/rainbow
}

package() {
	cd "${srcdir}/go/src/github.com/arsham/rainbow"

	install -Dm755 "build/rainbow" "${pkgdir}/usr/bin/rainbow"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
