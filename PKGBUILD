# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gogololcat-git
pkgver=r3.236b66e
pkgrel=4
pkgdesc="golang implementation of lolcat"
url="https://github.com/vbatts/gogololcat/"
arch=('x86_64' 'i686')
license=('MIT')
conflicts=(gogololcat gogololcat-bin)
provides=(gogololcat gogololcat-bin)
makedepends=('go')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/vbatts/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/vbatts/gogololcat"

	cd "${srcdir}/go/src/github.com/vbatts/gogololcat"

	export GO111MODULE="auto"
	export GOPATH="${srcdir}/go"

	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/vbatts/gogololcat"

	mkdir -p build

	export GO111MODULE="auto"
	export GOPATH="${srcdir}/go"

	go build -ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/lolcat ./cmd/lolcat
}

package() {
	cd "${srcdir}/go/src/github.com/vbatts/gogololcat"

	install -Dm755 "./build/lolcat" "${pkgdir}/usr/bin/lolcat"
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
