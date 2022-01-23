# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=kt
pkgver=13.1.0
_commit=5ecef5c
pkgrel=1
pkgdesc="Kafka JSON tool"
arch=('x86_64')
url="https://github.com/fgeller/kt"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('76DCDDA475507AA5186DC9E571E54A69B0C4269F') ## Felix Geller

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build \
		-ldflags "-X main.buildTime=`date --iso-8601=s`
		-X main.buildVersion=$pkgver
		-linkmode external
		-extldflags \"${LDFLAGS}\""
}

# check() {
# 	cd "$pkgname"
# 	go test -v -short -vet=all -failfast -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
# }

package() {
	cd "$pkgname"
	install -D build/kt -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
