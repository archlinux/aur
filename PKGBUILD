# Maintainer: fantasyzhjk <fantasyzhjk@outlook.com>
pkgname=mcping-git
pkgver=latest
pkgrel=1
pkgdesc="Ping any Minecraft server."
url="https://github.com/go-mc/mcping"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"
	install -m755 -d "${srcdir}/go/src/github.com/go-mc/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/go-mc/mcping"
	cd "${srcdir}/go/src/github.com/go-mc/mcping"
	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/go-mc/mcping"
	mkdir -p build
	export GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/AutoFishingBot .
}

package() {
	cd "${srcdir}/go/src/github.com/go-mc/mcping"
	install -Dm755 "./build/mcping" "${pkgdir}/usr/bin/mcping"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
