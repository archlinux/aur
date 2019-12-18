# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gobuster-git
pkgver=v3.0.1.r11.gf7ed22d
pkgrel=1
pkgdesc="A directory/file & DNS busting tool."
arch=('x86_64')
url="https://github.com/OJ/gobuster"
license=('Apache')
makedepends=('go>=1.10' 'git')
conflicts=('gobuster')
provides=('gobuster')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/OJ/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/OJ/gobuster"

	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/gobuster
}

check() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	export GOPATH="${srcdir}/go"
	make test
}

package() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	install -Dm755 "./build/gobuster" "${pkgdir}/usr/bin/gobuster"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
