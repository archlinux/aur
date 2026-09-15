# Maintainer: James Willson <jsdoublel@gmail.com>
pkgname=camus
pkgver=1.0.2
pkgrel=1
pkgdesc="A scalable program for inferring level-1 phylogenetic networks"
arch=('x86_64' 'aarch64')
url="https://github.com/jsdoublel/camus"
license=('MIT')
depends=()
makedepends=('go>=1.25')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e9b2913a621dccb9f68269bce136c52f58175f39f5879d4eab0f93fc873a1b56')

prepare() {
	cd "$pkgname-$pkgver"
	GOPATH="$srcdir/gopath" GOFLAGS="-modcacherw" go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export GOPATH="$srcdir/gopath"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-X main.Version=v$pkgver" -o "$pkgname" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
