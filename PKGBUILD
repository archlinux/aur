# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=slit-git
pkgver=1.2.0.r11.g4d4f92b
pkgrel=1
pkgdesc='A modern PAGER for viewing logs, get more than most in less time'
arch=(x86_64)
url="https://github.com/tigrawap/slit"
license=(MIT)
makedepends=(go dep)
conflicts=(slit)
provides=(slit)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/tigrawap/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/tigrawap/slit"

	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	mkdir -p build

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/slit ./cmd/slit
}

package() {
	cd "${srcdir}/go/src/github.com/tigrawap/slit"

	install -Dm755 "./build/slit" "${pkgdir}/usr/bin/slit"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
