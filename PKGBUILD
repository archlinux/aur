# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=align
pkgver=1.1.2
pkgrel=1
pkgdesc="A general purpose application for aligning text"
arch=('x86_64')
url='https://github.com/Guitarbum722/align'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dc3b16f2b1f61a1fc514d3fcd75ae49da587aaa75d81fc879356d08e2d3f464a')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod init "${url#https://}"
	go mod tidy
}

build() {
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build -ldflags "-linkmode=external -extldflags \"${LDFLAGS}\"" ./...
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/align -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
