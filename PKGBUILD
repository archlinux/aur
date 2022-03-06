# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=timetrace
pkgver=0.14.3
pkgrel=1
pkgdesc="Simple time-tracking CLI tool"
arch=('x86_64')
url="https://github.com/dominikbraun/timetrace"
license=('Apache')
depends=('glibc')
makedepends=('go')
optdepends=('bash-completion: built-in completions')
install="$pkgname.install"
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('670ae0b147ddd6a430efb0a727f1612bcc66fffb025855f151760002c63fb847')

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
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname.sh" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 "_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
