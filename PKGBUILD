# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: duapple <2832893880@qq.com>

pkgname=genmake
pkgver=0.4.0
pkgrel=5
_commit=c16e594
pkgdesc="Makefile template generator"
arch=('x86_64')
url="https://gitee.com/duapple/genmake"
license=('AGPL3')
depends=('glibc' 'genmake-templates')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/repository/archive/$_commit?format=tar.gz")
sha256sums=('53f998c73d9662bc364f8d22541e7720f5058524ac57ef66f3b466dace0fd563')

prepare() {
	cd "$pkgname-$_commit"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname-$_commit"
	go build -o build/genmake -ldflags "-linkmode=external -extldflags=${LDFLAGS}"
}

check() {
	cd "$pkgname-$_commit"
	go test ./...
}

package() {
	cd "$pkgname-$_commit"
	install -D build/genmake -t "$pkgdir/usr/bin/"
	install -Dm644 config/genmake_conf.json -t "$pkgdir/usr/share/$pkgname/config/"
	install -d "$pkgdir/usr/share/$pkgname/template/"
}
