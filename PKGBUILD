# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=outagedeck-git
_pkgname=outagedeck
pkgver=r23.bf7cb15
pkgrel=1
pkgdesc="Check the status of 170+ cloud and SaaS providers from official vendor feeds"
arch=('x86_64' 'aarch64')
url="https://github.com/outagedeck/cli"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("outagedeck")
conflicts=("outagedeck")
source=("$_pkgname::git+https://github.com/outagedeck/cli.git#branch=main")
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
	go build -ldflags "-s -w -X main.version=$pkgver" -o "build/$_pkgname" ./cmd/outagedeck
}

check() {
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
