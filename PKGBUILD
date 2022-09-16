# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>

pkgname=litmusctl
pkgver=0.13.0
pkgrel=1
pkgdesc="CLI tool to manage litmuschaos's agent plane"
url='https://github.com/litmuschaos/litmusctl'
arch=('x86_64' 'aarch64')
license=('Apache')
depends=('kubectl')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2b24b24b58cbf4b3ea5548d256c62a23cf38ddbe6b5d7156997564d16d7f6a12')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build -ldflags="-linkmode=external -X main.CLIVersion=$pkgver"
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 Usage.md "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
	install -Dm644 Usage_interactive.md "$pkgdir/usr/share/doc/$pkgname/USAGE_INTERACTIVE.md"
}
