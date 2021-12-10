# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Emilio Reggi <nag@mailbox.org>

pkgname=llama
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/antonmedv/llama"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c49f54e8dbaa5090e34ec7c9d5cf8f772a7c2d565ae072e9c275fdf97f8897e9')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build/ -ldflags "-linkmode=external -extldflags=${LDFLAGS}"
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/llama -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
