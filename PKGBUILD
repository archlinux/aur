# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=snav
pkgver=0.7.4
pkgrel=1
pkgdesc="Fast terminal code navigator with fuzzy search and preview, powered by ripgrep"
arch=('x86_64' 'aarch64')
url="https://github.com/m7b-io/snav"
license=('MIT')
depends=('glibc' 'ripgrep')
makedepends=('go>=1.26' 'gcc')
checkdepends=('ripgrep')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36e4c20e88d2694911d5c2497b11789d048c5d1129b974cd352ed8fdebe97d97')

prepare() {
	cd "$pkgname-$pkgver/src"
	go mod download
}

build() {
	cd "$pkgname-$pkgver/src"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o "$srcdir/$pkgname-build" .
}

check() {
	cd "$pkgname-$pkgver/src"
	go test ./...
}

package() {
	install -Dm755 "$srcdir/$pkgname-build" "$pkgdir/usr/bin/$pkgname"
	cd "$pkgname-$pkgver"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
}
