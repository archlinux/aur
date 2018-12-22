# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=ginkgo-git
pkgver=v1.7.0.r2.g505cc35
pkgrel=1
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
}

build() {
	cd "${srcdir}/go/src/github.com/onsi/ginkgo"

	export GOPATH="${srcdir}/go"
	export PATH="$GOPATH/bin:$PATH"

	go get -v github.com/hpcloud/tail
	go build -ldflags "-s -w" -o bin/ginkgo github.com/onsi/ginkgo/ginkgo
}

package() {
	cd "${srcdir}/go/src/github.com/onsi/ginkgo"

	install -m755 -D bin/ginkgo "${pkgdir}"/usr/bin/ginkgo
}
