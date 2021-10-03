# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=timetrace
pkgver=0.14.0
pkgrel=1
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
sha256sums=('bdfe2c2e93d729f1e933d4b78ed4e17378a7f627e6f7bddd3ad9285036ad03e6')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o "$pkgname" -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" -X main.version=$pkgver"
	"./$pkgname" completion bash > "$pkgname.sh"
	"./$pkgname" completion zsh > "_$pkgname"
	"./$pkgname" completion fish > "$pkgname.fish"
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
	install -Dm 644 "$pkgname.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm 644 "_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
