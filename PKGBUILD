# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Terin Stock <terinjokes@gmail.com>

pkgname=gojq
pkgver=0.12.6
pkgrel=3
pkgdesc='Pure go implementation of jq'
url="https://github.com/itchyny/$pkgname"
arch=(x86_64)
license=(MIT)
makedepends=(go
             git)
depends=(glibc)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('46f66af22e1701dd6f3605012c6e3ccc5bf4dc2ad1a8a7f5be248cb7c6bf316c')

prepare(){
	cd "$_archive"
	mkdir -p build/
}

build() {
	local _commit=$(zcat ${source[0]##*/} | git get-tar-commit-id)
	cd "$_archive"
	export CGO_LDFLAGS="$LDFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"

	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build \
		-ldflags="-X ${url#*//}/cli.revision=${_commit:0:7}" \
		"./cmd/$pkgname"
}

check() {
	cd "$_archive"
	go test ./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/share/zsh/site-functions/" _gojq
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
