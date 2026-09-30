# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=rootly-cli-git
_pkgname=rootly-cli
pkgver=r115.91c3fd6
pkgrel=1
pkgdesc="Manage Rootly incidents, alerts, services, teams and on-call schedules from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/rootlyhq/rootly-cli"
license=('MIT')
depends=()
makedepends=('go' 'git')
provides=("rootly-cli")
conflicts=("rootly-cli")
source=("$_pkgname::git+https://github.com/rootlyhq/rootly-cli.git#branch=master")
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
	go build -ldflags "-s -w -X main.version=$pkgver" -o build/rootly ./cmd/rootly
}

check() {
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm755 build/rootly "$pkgdir/usr/bin/rootly"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
