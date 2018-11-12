# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=clair-git
pkgver=v2.0.0.r246.g504f0f3a
pkgrel=1
pkgdesc="Vulnerability Static Analysis for Containers"
arch=(x86_64)
url='https://github.com/coreos/clair'
license=(Apache)
makedepends=(git go)
source=("${pkgname}::git+https://github.com/coreos/clair")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname}

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${srcdir}/go/src/github.com/coreos"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/coreos/clair"

}

build() {
	cd "${srcdir}/go/src/github.com/coreos/clair"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" \
		go build -ldflags "-X github.com/coreos/clair/pkg/version.Version=${pkgver}" \
			github.com/coreos/clair/cmd/clair
}

package() {
	cd "${srcdir}/go/src/github.com/coreos/clair"

	install -Dm755 "clair" "${pkgdir}/usr/bin/clair"
	install -Dm755 "config.yaml.sample" "${pkgdir}/etc/clair/config.yaml"
}
