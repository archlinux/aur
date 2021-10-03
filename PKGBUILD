# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=grpcurl
pkgver=1.8.2
pkgrel=1
pkgdesc="Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
arch=(x86_64)
url="https://github.com/fullstorydev/grpcurl"
license=('MIT')
makedepends=('go')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/fullstorydev/grpcurl/archive/v$pkgver.tar.gz"
)
sha384sums=('1086ea3a60d644d98153d68bcc9ee94c87ba2914fe78e8d84323383f33814ca858f3496c0b513a4093affa930c9bbd32')
# really, `grpcurl-bin` should be conflicting with us instead of the oposite
conflicts=('grpcurl-bin')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	mkdir -p build
	go build -o build ./cmd/...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/grpcurl "${pkgdir}/usr/bin/grpcurl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
