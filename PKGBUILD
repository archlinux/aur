# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=secret-share
pkgver=0.6.0
pkgrel=1
pkgdesc="Share messages (secrets and passwords) securely with a CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/scosman/secret_share"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.23')
options=('!lto')
provides=('python-secret-share')
conflicts=('python-secret-share')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c43ca13f4ed2501ca9720cd1ca371e196f32d07a536b3d1aac09105a1d86c302')

prepare() {
	cd "secret_share-$pkgver"
	go mod download
}

build() {
	cd "secret_share-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/secret_share-build" cmd/secret_share/main.go
}

check() {
	cd "secret_share-$pkgver"
	export GOROOT=/usr/lib/go
	go test ./...
}

package() {
	cd "secret_share-$pkgver"
	install -Dm755 "$srcdir/secret_share-build" "$pkgdir/usr/bin/secret_share"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
