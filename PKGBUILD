# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=postsleuth
pkgver=0.2.1
pkgrel=1
_tag=v$pkgver
_srcdir="postsleuth-$pkgver"
pkgdesc="Diagnoses why a Postfix server is not delivering mail: groups the queue by deferral reason, qshape view, mail log analysis, message traces and SPF/DKIM/DMARC/PTR checks; read-only by default, also an MCP server"
arch=('x86_64')
url="https://blackman99.github.io/postsleuth/"
license=('MIT')
depends=('glibc' 'postfix')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blackman99/postsleuth/archive/refs/tags/$_tag.tar.gz")
sha256sums=('ee1bc9add357323f94a7a1bdeae6386b8dd3aa3a5da279d259a18f6809f6610b')

prepare() {
	cd "$_srcdir"
	go mod download
}

build() {
	cd "$_srcdir"
	go build -trimpath -buildmode=pie -ldflags "-buildid= -X main.version=$pkgver" -o build/postsleuth ./cmd/postsleuth
}

check() {
	cd "$_srcdir"
	go test ./...
}

package() {
	cd "$_srcdir"
	install -Dm755 build/postsleuth "$pkgdir/usr/bin/postsleuth"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
