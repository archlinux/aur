# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bindboss-git
_pkgname=bindboss
pkgver=r10.434ddc5
pkgrel=1
pkgdesc="Pack any directory into a self-extracting executable with dependency checking"
arch=('x86_64' 'aarch64')
url="https://github.com/grug-group420/Bindboss"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("bindboss")
conflicts=("bindboss")
source=("$_pkgname::git+https://github.com/grug-group420/Bindboss.git#branch=main")
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
	go build -ldflags "-s -w" -o "build/$_pkgname" .
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
