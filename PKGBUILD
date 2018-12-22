# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=clair-git
_pkgname=clair
pkgver=v2.0.0.r249.g3947073b
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=(x86_64)
url='https://github.com/coreos/clair'
license=(Apache)
makedepends=('git' 'go')
source=("${_pkgname}::git+https://github.com/coreos/clair")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/coreos/"
	ln -sf "${srcdir}/${_pkgname}" "${srcdir}/go/src/github.com/coreos/"
}

build() {
	cd "${srcdir}/go/src/github.com/coreos/${_pkgname}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" go build \
		-ldflags "-X github.com/coreos/clair/pkg/version.Version=${pkgver}" \
			github.com/coreos/clair/cmd/clair
}

package() {
	cd "${srcdir}/go/src/github.com/coreos/${_pkgname}"

	install -Dm755 "clair" "${pkgdir}/usr/bin/clair"
	install -Dm755 "config.yaml.sample" "${pkgdir}/etc/clair/config.yaml"
}
