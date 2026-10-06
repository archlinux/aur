# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=dnafile-git
_pkgname=dnafile
pkgver=r6.366b8b8
pkgrel=1
pkgdesc="Read raw DNA exports, detect the array and check rsID coverage, fully offline"
arch=('x86_64' 'aarch64')
url="https://github.com/AndreySoloviev/dnafile"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("dnafile")
conflicts=("dnafile")
source=("$_pkgname::git+https://github.com/AndreySoloviev/dnafile.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	export GOFLAGS="-modcacherw"
	go mod download
}

build() {
	cd "$_pkgname"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-s -w -X main.version=$pkgver" -o "build/$_pkgname" ./cmd/dnafile
}

check() {
	export GOROOT=/usr/lib/go
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/usr/share/$_pkgname/coverage"
	install -m644 coverage/data/*.csv "$pkgdir/usr/share/$_pkgname/coverage/"
}
