# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.50.5
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1be01df54565c4831db8f1dcef38347e25a7a945d9f3ff77ca7a488e0307b3ac')

build() {
	cd "$pkgname-$pkgver"
	export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -modcacherw -ldflags=-linkmode=external"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	go build ./cmd/protolint
	go build ./cmd/protoc-gen-protolint
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 0755 protolint "$pkgdir/usr/bin/protolint"
	install -Dm 0755 protoc-gen-protolint "$pkgdir/usr/bin/protoc-gen-protolint"
	install -Dm 0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
