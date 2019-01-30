# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gobuster-git
pkgver=v2.0.1.r15.g0e209e5
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
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/OJ/gobuster"

	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go get -v -d
}

build() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	mkdir -p build

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/gobuster
}

check() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"
	make test
}

package() {
	cd "${srcdir}/go/src/github.com/OJ/gobuster"

	install -Dm755 "./build/gobuster" "${pkgdir}/usr/bin/gobuster"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
