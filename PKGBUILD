# Maintainer: Ryan Petris (ryan@petris.net)

pkgname=libpod
pkgver=0.10.1.3
pkgrel=1
pkgdesc="A library used to create container pods."
arch=("x86_64")
url="https://github.com/containers/libpod"
license=("Apache")

depends=(
	"python"
	"cri-o"
	"cni-plugins"
	"skopeo"
	"device-mapper"
	"libseccomp"
	"iptables"
	"runc"
	"ostree"
)

makedepends=("go" "go-md2man")
conflicts=("podman")
source=("https://github.com/containers/libpod/archive/v${pkgver}.tar.gz")
sha256sums=('6f34b05ca091d87bf700b2d3b60b80ce32738099b00ed8af3a2f71bcd3ac06eb')

prepare() {
	export GOPATH="${srcdir}/go"
	mkdir -p "${GOPATH}/src/github.com/containers"

	sed -i "s/-ldflags '\$(LDFLAGS)'/-gccgoflags '\$(LDFLAGS)'/g" "${pkgname}-${pkgver}/Makefile"
	sed -i "s/-ldflags '\$(LDFLAGS_PODMAN)'/-gccgoflags '\$(LDFLAGS)' -ldflags '\$(LDFLAGS_PODMAN)'/g" "${pkgname}-${pkgver}/Makefile"
	sed -i "s/LDFLAGS_PODMAN ?= \$(LDFLAGS)/LDFLAGS_PODMAN ?=/g" "${pkgname}-${pkgver}/Makefile"

	mv "${pkgname}-${pkgver}" "${GOPATH}/src/github.com/containers/${pkgname}"
}

build() {
	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgname}"

	make install.tools
	make all
}

package() {
	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgname}"

	make install DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
}
