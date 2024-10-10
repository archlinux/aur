# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
_pkgname=jqfmt
pkgname=$_pkgname-git
pkgver=r5.8fc6f86
pkgrel=1
pkgdesc='like gofmt, but for jq'
arch=(x86_64)
url=https://github.com/noperator/$_pkgname
license=(MIT)
makedepends=(go
             git)
depends=(glibc)
conflicts=("$_pkgname")
provides=("$_pkgname")
_commit=8fc6f864c295e6bd6b08f36f503b3d809270da61
source=("git+$url#tag=$_commit")
sha256sums=('5db32cf6b05e4ca0ef70838c322138e2ac0bfdfb5207bc6fad59aae679f12663')

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || return 1
	export CGO_LDFLAGS="$LDFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"

	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	mkdir -p build
	go build -o build \
		-ldflags="-X ${url#*//}/cli.revision=${_commit:0:7}" \
		"./cmd/$_pkgname"
}

check() {
	cd "$_pkgname" || return 1
	go test ./...
}

package() {
	cd "$_pkgname" || return 1
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$_pkgname"
}
