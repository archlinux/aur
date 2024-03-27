# Maintainer: Tzu-Yu Lee <leejuyuu at google dot com>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=sqls
pkgver=0.2.27
pkgrel=1
pkgdesc="Language Server Protocol implementation for SQL"
arch=('x86_64')
url="https://github.com/sqls-server/sqls"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('mysql' 'sqlite3' 'postgresql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f47aff522ce20eb4f87fb099d492c35503824b10d40cb3d4b755bc0a8d6ddf56')

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
