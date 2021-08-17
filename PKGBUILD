# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=timetrace
pkgver=0.13.0
pkgrel=2
pkgdesc="A simple time-tracking CLI tool"
arch=('x86_64')
url="https://github.com/dominikbraun/timetrace"
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=('bash-completion: built-in completions')
install="$pkgname.install"
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1edd3a51782242a60503476e9f9e10215f3b90992a35e9deec1d578ec41ead5d')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o "$pkgname"
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm 644 completion/bash/timetrace.sh "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
