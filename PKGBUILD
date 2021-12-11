# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ginkgo-git
pkgver=v1.16.5.r2.g71572c1
pkgrel=2
pkgdesc="BDD Testing Framework for Go"
arch=('x86_64')
url="http://onsi.github.io/ginkgo/"
license=('MIT')
depends=()
makedepends=('go')
optdepends=()
conflicts=()
source=("${pkgname}::git+https://github.com/onsi/ginkgo.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/onsi"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/onsi/ginkgo"

	cd "${srcdir}/go/src/github.com/onsi/ginkgo"

	export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
	go get -v -t ./...
}

build() {
	cd "${srcdir}/go/src/github.com/onsi/ginkgo"

	export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
	go build \
        -trimpath -ldflags "-s -w" \
        -o ./bin/ginkgo ./ginkgo
}

package() {
	cd "${srcdir}/go/src/github.com/onsi/ginkgo"

	install -Dm755 "bin/ginkgo" "${pkgdir}/usr/bin/ginkgo"
}
