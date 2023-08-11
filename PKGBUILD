# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=rcon-cli
pkgver=0.10.3
pkgrel=1
pkgdesc="RCON client for executing queries on game servers"
arch=('x86_64' 'i686')
url="https://github.com/gorcon/rcon-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e871753e970300ff4fade6bc7e39eb086fd7a87c772657870b071b9e5f0468fe')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	GO_LDFLAGS="-linkmode=external -X main.Version=${pkgver}"
	go build -ldflags="${GO_LDFLAGS}" -o rcon ./cmd/gorcon/main.go
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm 755 rcon -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
