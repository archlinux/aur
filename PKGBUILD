# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=virusgotal-git
pkgver=1.0.2.r2.g5893d27
pkgrel=2
pkgdesc='VirusTotal zero dependency command line client.'
arch=(x86_64)
url="https://github.com/moldabekov/virusgotal"
license=(MIT)
makedepends=(go)
conflicts=(virusgotal)
provides=(virusgotal)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/moldabekov/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	mkdir -p build

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/virusgotal
}

package() {
	cd "${srcdir}/go/src/github.com/moldabekov/virusgotal"

	install -Dm755 "./build/virusgotal" "${pkgdir}/usr/bin/virusgotal"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
