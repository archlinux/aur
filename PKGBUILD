# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc
pkgver=6.0.7
pkgrel=2
pkgdesc="Easily and securely send things from one computer to another."
arch=('x86_64')
url="https://${_gonamespc}"
license=('MIT')
#depends=()
makedepends=('go')
optdepends=('upx: compress binary')
provides=('croc')
conflicts=('croc-bin' 'croc-git')
#options=()
source=("${url}/archive/v${pkgver}.tar.gz"
		"croc.service")
sha256sums=('a3f8aa856d5f0358c4c0d25d01e973be9d128aab7a0b90184d178986d9a8d054'
			'cf074568f16c7b86870a89a0a2d8e488e3837223cca071a911085d814d6f2194')

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
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${pkgname} with UPX...
		upx "${srcdir}/${pkgname}"; fi
}

check() {
	go test $_gonamespc
}

package() {
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${srcdir}/${source[1]}" "${pkgdir}/usr/lib/systemd/system/${source[1]}"
}
