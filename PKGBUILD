# Maintainer: Ryan Petris (ryan@petris.net)

pkgname=libpod
pkgver=0.10.1
pkgrel=1
pkgdesc="Utility for running OCI-based containers."
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
sha256sums=("c456a6e5c89ae938607154a16ec07efeda5287351d2741b762c495e651189cf5")

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
