# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=pcopy
pkgver=0.6.1
pkgrel=1
pkgdesc="Temporary file host, nopaste and clipboard across machines; usable from Web UI, CLI or plain curl"
arch=('x86_64' 'aarch64')
url="https://github.com/binwiederhier/pcopy"
license=('Apache-2.0')
depends=()
makedepends=('go>=1.16')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ca54b3a8322a11ff0c3d54c719a671d71001034596503089010c760c485fd78')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=$pkgver -X main.commit=v$pkgver" -o "pcopy" .
}

check() {
	cd "$pkgname-$pkgver"
	export GOROOT=/usr/lib/go
	go test -skip 'TestTCPForwarder|TestSniffWriter_DownloadWithUnknownMimeType' ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "pcopy" "$pkgdir/usr/bin/pcopy"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
