# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ergo-git
_pkg="${pkgname%-git}"
pkgver=0.7.1.r1.gcab9782
pkgrel=2
pkgdesc="List of utilities for the daily developer workflow"
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/beatlabs/ergo'
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_pkg")
conflicts=("$_pkg")
install=ergo.install
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkg"
	mkdir -p build/
	go mod tidy
	go generate ./...
}

build() {
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$_pkg"
	go build -o build/ergo -ldflags "-linkmode=external -X main.version=$pkgver" ./cmd/cli
}

check() {
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkg"
	go test ./...
}

package() {
	cd "$_pkg"
	install -D "build/$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 .ergo.yml.dist "$pkgdir/usr/share/$pkgname/config-template.yml"
}
