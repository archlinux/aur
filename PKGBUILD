# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=dive-git
pkgver=v0.6.0.r5.gd4e9bdb
pkgrel=2
pkgdesc="A tool for exploring each layer in a docker image"
url="https://github.com/wagoodman/dive"
arch=('x86_64' 'i686')
license=('MIT')
conflicts=(dive dive-bin)
provides=(dive dive-bin)
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/wagoodman/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/wagoodman/dive"

	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	mkdir -p build

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/dive
}

package() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	install -Dm755 "./build/dive" "${pkgdir}/usr/bin/dive"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
