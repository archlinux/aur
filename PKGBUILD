# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=grpcurl
pkgver=1.8.0
pkgrel=2
pkgdesc="Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
arch=(x86_64)
url="https://github.com/fullstorydev/grpcurl"
license=('MIT')
makedepends=('go')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/fullstorydev/grpcurl/archive/v$pkgver.tar.gz"
	file://0001-use-latest-version-of-protoreflect-212.patch
)
md5sums=('6b8efb66f4281e3a09221dfa5d9b2fc3'
         '8b6c6b82b43bb22145ffc746e747e6b7')
# really, `grpcurl-bin` should be conflicting with us instead of the oposite
conflicts=('grpcurl-bin')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "../0001-use-latest-version-of-protoreflect-212.patch"
}

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
