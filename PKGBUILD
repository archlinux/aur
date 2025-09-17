# Maintainer: whiteman808 <whiteman808@paraboletancza.org>
# Contributor: Jeff Henson <jeff@henson.io>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: darkhz <kmachanwenw at gmail dot com>

pkgname=bluetuith
pkgver=0.2.5
pkgrel=1
epoch=1
pkgdesc="TUI-based bluetooth manager"
arch=('x86_64' 'i686' 'arm' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/bluetuith-org/bluetuith"
license=('MIT')
depends=('bluez' 'dbus')
optdepends=("bluez-obex: send and receive files via OBEX")
makedepends=('git' 'go')
source=("$pkgname::git+$url.git#tag=v${pkgver/_/-}")
sha256sums=('b19ef6f9903c01a1e47b1b7446bd53778beb5e258d4d96fd4ea4f40e8ea3ca65')

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath"

	cd "$pkgname"
	version="$(git describe --exact-match --abbrev=0 HEAD)@$(git rev-parse HEAD | head -c7)"
	go build -ldflags="-linkmode=external -s -w -X github.com/darkhz/bluetuith/cmd.Version=${version}" -o build
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
