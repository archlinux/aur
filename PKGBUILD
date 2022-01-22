# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tiago Cardoso <tbcardoso at outlook dot com>

pkgname=evans
pkgver=0.10.2
pkgrel=1
pkgdesc='More expressive universal gRPC client'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/ktr0731/evans'
license=('MIT')
depends=('glibc')
makedepends=('go')
# checkdepends=('git' 'vim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fd1d7433317c8f864fca1a9be3977d1e8afd36f91fe5a24e49b7c2d45cd65ea4')

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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	go test ./...
# }

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
