# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff
pkgver=1.4.6
pkgrel=1
pkgdesc="Diff tool for YAML files"
arch=('x86_64')
url="https://github.com/homeport/dyff"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3a9a5dc36c1ee36c918231d183d7dce5510f6d9959b97ea3e44ced5b2dd430fc')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build ./...
	build/dyff completion bash > dyff.bash
	build/dyff completion zsh > _dyff
	build/dyff completion fish > dyff.fish
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D build/dyff -t "$pkgdir/usr/bin"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 dyff.bash "$pkgdir/usr/share/bash-completion/completions/dyff"
	install -Dm 644 _dyff -t "$pkgdir/usr/share/zsh/site-functions/"
	install -Dm 644 dyff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
