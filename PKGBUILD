# Maintainer: Cody Schafer <dev@codyps.com>

pkgname=grpcurl
pkgver=1.9.4
pkgrel=1
pkgdesc="Like cURL, but for gRPC: Command-line tool for interacting with gRPC servers"
arch=(x86_64)
url="https://github.com/fullstorydev/grpcurl"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/fullstorydev/grpcurl/archive/v$pkgver.tar.gz"
	go127-test-reader.patch
)
sha384sums=('d236810751aabf080fd8afc8d4e6db1db05708e6353f4f050ba87e7d705ec853d2fdd74523172d19c18a3f7959b28115'
            '389ec1611231d4d92d83fb45afae75ca705420ec75ea32b41c1fffa40c0741247b8aba730cd6c11633d79962a3666e7a')
# really, `grpcurl-bin` should be conflicting with us instead of the oposite
conflicts=('grpcurl-bin')

prepare() {
	cd "$pkgname-$pkgver"
	# Go 1.27 rejects a nil reader even when the parser is unused.
	patch -Np1 -i "$srcdir/go127-test-reader.patch"
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/grpcurl "${pkgdir}/usr/bin/grpcurl"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
