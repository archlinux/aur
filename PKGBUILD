# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Manuel Schmitzberger <ms@ms-sw.at>

pkgbase=jv
pkgname=jsonschema
pkgver=6.0.2
pkgrel=1
pkgdesc='json-schema compilation and validation'
arch=(x86_64)
url="https://github.com/santhosh-tekuri/$pkgname"
license=(Apache-2.0)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('06465cc1c647b086f9b8d590c9de1608e5b335b58598d0eb84b9ee63a747e1d7')

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
