# Maintainer: Ryan Petris (ryan@petris.net)

pkgbase=libpod
pkgname=(
	"libpod"
	"libpod-docker"
	"libpod-networking"
	"libpod-python"
)
pkgver=0.11.1
pkgrel=3
pkgdesc="A library used to create container pods."
arch=("x86_64")
url="https://github.com/containers/libpod"
license=("Apache")
makedepends=(
	"cni-plugins"
	"cri-o"
	"device-mapper"
	"go"
	"go-md2man"
	"iptables"
	"libseccomp"
	"ostree"
	"python-setuptools"
	"runc"
)
source=("https://github.com/containers/libpod/archive/v${pkgver}.tar.gz")
sha256sums=('1bc077fa5f734b72f9efab60a06d413927b0f09851463868f074fcb082c6d84e')

prepare() {
	export GOPATH="${srcdir}/go"
	mkdir -p "${GOPATH}/src/github.com/containers"

	sed -i "s/-ldflags '\$(LDFLAGS)'/-gccgoflags '\$(LDFLAGS)'/g" "${pkgbase}-${pkgver}/Makefile"
	sed -i "s/-ldflags '\$(LDFLAGS_PODMAN)'/-gccgoflags '\$(LDFLAGS)' -ldflags '\$(LDFLAGS_PODMAN)'/g" "${pkgbase}-${pkgver}/Makefile"
	sed -i "s/LDFLAGS_PODMAN ?= \$(LDFLAGS)/LDFLAGS_PODMAN ?=/g" "${pkgbase}-${pkgver}/Makefile"

	mv "${pkgbase}-${pkgver}" "${GOPATH}/src/github.com/containers/${pkgbase}"
}

build() {
	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.tools
	make all
}

package_libpod() {
	depends+=(
		"cri-o"
		"device-mapper"
		"libpod-networking"
		"libseccomp"
		"runc"
		"ostree"
		"skopeo"
	)
	optdepends+=(
		"libpod-docker: docker cli"
		"libpod-python: pypodman"
	)
	provides+=(
		"podman"
	)
	conflicts+=(
		"podman"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.bin install.completions install.config install.man install.systemd DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"

	# seccomp.json is provided by cri-o
	rm "${pkgdir}/etc/crio/seccomp.json"
	find "${pkgdir}" -type d -empty -delete
}

package_libpod-docker() {
	pkgdesc="Use podman as a Docker CLI replacement."
	depends+=(
		"libpod"
	)
	conflicts+=(
		"docker"
	)
	provides+=(
		"docker"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.docker DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
}

package_libpod-networking() {
	pkgdesc="Networking configuration for libpod."
	depends+=(
		"libpod"
		"cni-plugins"
		"iptables"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.cni DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
}

package_libpod-python() {
	pkgdesc="CLI for podman written in python."
	depends+=(
		"libpod"
		"python"
	)
	provides+=(
		"pypodman"
	)
	conflicts+=(
		"pypodman"
	)

	export GOPATH="${srcdir}/go"
	cd "${GOPATH}/src/github.com/containers/${pkgbase}"

	make install.python DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr"
}
