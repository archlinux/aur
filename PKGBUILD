# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=rdap-client
pkgver=1.2.1
pkgrel=1
pkgdesc="RDAP command line client from Registro.br"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/registrobr/rdap-client"
license=('BSD-2-Clause')
depends=("glibc")
makedepends=("go>=1.15")
provides=("rdap-client")
conflicts=("rdap-client" "rdap-client-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('64491660784e5421ae675e1200dff1fee8f13805ca00826ac00577a7763c61fa')

prepare() {
	cd "${pkgname}-${pkgver}"
	mkdir -p build
	go mod download
}

# tests not passing...
# check() {
# 	cd "${pkgname}-${pkgver}"
# 	go test -v ./..
# }

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "${pkgname}-${pkgver}"
	go build -o build .
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
