# Maintainer: Isaac Ganoung <inventor500@vivaldi.net>
pkgname=openrdap
_pkgname=rdap
pkgver=0.10.2
pkgrel=1
pkgdesc="A command line RDAP client implementation in Go."
license=("MIT")
arch=("x86_64" "aarch64")
url="https://www.openrdap.org/"
makedepends=("go")
depends=("glibc")
source=("https://github.com/${pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90c8ad29468cfb774c166a371b164c1e2a37de088e52328f4b9d5c80c0e23d98')


prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}/cmd/${_pkgname}"
    export GOPATH="${srcdir}"
    go mod download -modcacherw
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/cmd/${_pkgname}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build \
	    -trimpath \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags="-linkmode external" \
	    -v
}

package() {
    # Installing as openrdap instead of rdap prevents conflicts with other implementations.
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/cmd/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
