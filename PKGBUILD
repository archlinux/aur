# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=grpcurl
pkgver=1.6.0
pkgrel=1
pkgdesc="Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
arch=(x86_64)
url="https://github.com/fullstorydev/grpcurl"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fullstorydev/grpcurl/archive/v$pkgver.tar.gz")
md5sums=('77082b483193d08ff6ff126269d1714d')
# really, `grpcurl-bin` should be conflicting with us instead of the oposite
conflicts=('grpcurl-bin')


build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	mkdir -p build
	go build -o build ./cmd/...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/grpcurl "${pkgdir}/usr/bin/grpcurl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
