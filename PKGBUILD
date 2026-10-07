# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=trzsz-ssh
pkgver=0.1.26
pkgrel=1
pkgdesc="Drop-in openssh client replacement with login prompt, trzsz, zmodem (rz/sz) and udp mode"
arch=('x86_64' 'aarch64')
url="https://github.com/trzsz/trzsz-ssh"
license=('MIT')
depends=('openssh')
makedepends=('go>=1.25.0')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('67c9082543e1785ece3f5ab09f6299cd655e3657593d55cc85751c097c1bb381')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/tssh-build" ./cmd/tssh
}

check() {
	cd "$pkgname-$pkgver"
	export GOROOT=/usr/lib/go
	go test -skip 'TestTableExample$' ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$srcdir/tssh-build" "$pkgdir/usr/bin/tssh"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
