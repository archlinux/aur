# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=netcap-git
pkgver=v0.3.9.r106.g6bbb8d6
pkgrel=1
pkgdesc='A framework for secure and scalable network traffic analysis'
url="https://github.com/dreadl0ck/netcap"
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'go')
conflicts=('netcap')
provides=('netcap')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/dreadl0ck/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	for i in cmd/*; do
		msg2 "Compiling $i..."

		go build \
			-ldflags "-s -w" \
			-gcflags="all=-trimpath=${GOPATH}/src" \
			-asmflags="all=-trimpath=${GOPATH}/src" \
		-o "build/${i//\//.}" "./$i"
	done
}

package() {
	cd "${srcdir}/go/src/github.com/dreadl0ck/netcap"

	for i in build/cmd.*; do
		msg2 "Installing $i..."

		install -Dm755 "$i" "${pkgdir}/usr/bin/$(basename $i)"
	done
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
