# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc
pkgver=3.0.6
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
sha512sums=('2166fbbb3f1bfccc9de7d12ddf90eadb238a1efab70209fecaea1a558799b3d89d0be1e09aad7d4bc946a357926dc71545b75f3dda681838cefdebeb4f0dc14c')

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
