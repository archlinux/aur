# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc
pkgver=4.1.4
pkgrel=1
pkgdesc="Easily and securely send things from one computer to another."
arch=('x86_64')
url="https://${_gonamespc}"
license=('MIT')
#depends=()
makedepends=('go')
provides=('croc')
conflicts=('croc-bin' 'croc-git')
#options=()
source=("${url}/archive/v${pkgver}.tar.gz")

prepare() {
	if [ ! $(wc -w <<< $srcdir) == 1 ]; then echo srcdir can\'t contain spaces because of trimpath; return 1; fi
	export GOPATH="${srcdir}/.gopath"
	export GOBIN="${srcdir}/.gopath/bin"
	mkdir -p "${GOPATH}/src/${_gonamespc%/*}"
	if [ -e "${GOPATH}/src/${_gonamespc}" ]; then rm -r "${GOPATH}/src/${_gonamespc}"; fi
	mv "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_gonamespc}"
	go get -d -t -v $_gonamespc
}

build() {
	go clean -i -x $_gonamespc
	go build -x -ldflags "-X main.version=${pkgver}" -gcflags "all=-trimpath=${srcdir}" $_gonamespc
}

check() {
	go test $_gonamespc
}

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
sha512sums=('3d13611f2c61af9f68d46562811bcb7c412df1984666bc32f2889475cb42b3371aec7471bbc07a466eecad4e6cb00ce26053e3af49f35a68777ae4110a88b808')
