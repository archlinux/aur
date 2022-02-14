# Maintainer: hashworks <mail@hashworks.net>
pkgname=xrel-terminal-client
pkgver=2.1.2
pkgrel=3
pkgdesc="A terminal client to access the xREL.to API"
arch=("x86_64")
url="https://github.com/hashworks/xREL-Terminal-Client"
license=("GPL3")
changelog=CHANGELOG
makedepends=('go')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("5fc87553a139ea25fc2c616045d0c99ce884bc62eaed53091a30bbcef3a3661f")

prepare(){
	cd "xREL-Terminal-Client-${pkgver}"
	mkdir -p build/
}

build() {
	cd "xREL-Terminal-Client-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags '-X main.VERSION='"${pkgver}"' -X main.BUILD_DATE='"$(date +"%Y-%m-%d_%H:%M:%S")" -o build/xrel ./src
}

check() {
	cd "xREL-Terminal-Client-${pkgver}"
	go test ./src
}

package() {
	cd "xREL-Terminal-Client-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 build/xrel "${pkgdir}/usr/bin/xrel"
}

