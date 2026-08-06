# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Manuel Schmitzberger <ms@ms-sw.at>

pkgbase=jv
pkgname=jsonschema
pkgver=6.0.3
pkgrel=1
pkgdesc='json-schema compilation and validation'
arch=(x86_64)
url="https://github.com/santhosh-tekuri/$pkgname"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('f94a43d08c6b8f1f80069f44e996090ce89e2abb3b6dd997e8f1e61ac6d9fb9f')

prepare(){
	  cd "$_archive"
	  mkdir -p dist/
	  go mod download
}

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
	go build -o dist/ "./cmd/$pkgbase"
}

check() {
	cd "$_archive"
	go test ./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "dist/$pkgbase"
}
