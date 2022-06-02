# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=dive-git
pkgver=0.10.0.r2.gc7d121b
pkgrel=1
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

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/wagoodman/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/wagoodman/dive"

	cd "${srcdir}/go/src/github.com/wagoodman/dive"

    export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
    go get -v -t ./...
}

build() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	mkdir -p build

    export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
	go build \
		-trimpath -ldflags "-s -w" \
		-o ./build/dive .
}

package() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	install -Dm755 "build/dive" "${pkgdir}/usr/bin/dive"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
