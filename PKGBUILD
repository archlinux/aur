# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=sqls
pkgver=0.2.22
pkgrel=1
pkgdesc="Language Server Protocol implementation for SQL"
arch=('x86_64')
url="https://github.com/lighttiger2505/sqls"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('mysql' 'sqlite3' 'postgresql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0f417123331b23a50b10f2724befc53aa82f44150cf84f28bfb885f768697a01')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build .
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D sqls -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
