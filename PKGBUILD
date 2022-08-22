# Maintainer: pjvds
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=germanium
pkgver=1.2.3
pkgrel=1
pkgdesc='Generate image from source code'
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
url="https://github.com/matsuyoshi30/germanium"
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('69c818f06bbd7ea562afb5ed38b24fc2e9e9a447d5668d995314da5203e72de3')

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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build "./cmd/$pkgname"
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
