# Maintainer: Laura Demkowicz-Duffy <dev@demkowiczduffy.co.uk>
pkgname=protolint
pkgver=0.58.0
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64')
url="https://github.com/yoheimuta/protolint"
license=('MIT')
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d5f4650ed23f68c34a6be1ba77fb3661dd4b7b28b64664a479b6835febceb18')

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

check() {
	cd "$pkgname-$pkgver"
	# tests fail with arch goflags
	GOFLAGS="" make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 0755 protolint "$pkgdir/usr/bin/protolint"
	install -Dm 0755 protoc-gen-protolint "$pkgdir/usr/bin/protoc-gen-protolint"
	install -Dm 0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
