# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=a
pkgver=0.8.4
pkgrel=1
pkgdesc="Graphical text editor inspired by Sam and Acme"
arch=('x86_64')
url="https://github.com/as/a"
license=('BSD')
depends=('glibc')
makedepends=('go')
provides=('a-editor')
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a752cbb047abdbef1e24f5e309144a66dad436885e26d43e3c6d61f513415362')

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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"
	cd "$pkgname-$pkgver"
	go build -o build
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
