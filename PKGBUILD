# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ingestr
pkgver=1.1.62
pkgrel=1
pkgdesc="Command-line tool to copy data from any source to any destination database"
arch=('x86_64' 'aarch64')
url="https://github.com/bruin-data/ingestr"
license=('custom:FSL-1.1-ALv2')
depends=('glibc' 'gcc-libs' 'ca-certificates')
makedepends=('go>=1.26.7' 'gcc')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('21310a458ca9ac3b27f580f1e859af49a3e4bdcab0ea8d0bee8493d92626b13e')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
	go run ./cmd/genregistry
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-linkmode external -X github.com/bruin-data/ingestr/cmd.Version=$pkgver" -o "$srcdir/$pkgname-build" .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$srcdir/$pkgname-build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD_PARTY_LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.txt"
}
