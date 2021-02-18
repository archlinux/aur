# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=cod
pkgver=0.0.0
pkgrel=4
pkgdesc="A completion daemon for bash/zsh"
arch=('any')
url="https://github.com/dim-an/cod"
license=('Apache-2.0')
makedepends=('go')
optdepends=('bash-completion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dim-an/cod/archive/v$pkgver.tar.gz")
sha256sums=('6f773358f363141dcd1bbdffaaa5dea0a40ae7a84d5fc55fd453302de8493c20')

prepare() {
	# Prevent creation of a `go` directory in one's home.
	# Sometimes this directory cannot be removed with even `rm -rf` unless
	# one becomes root or changes the write permissions.
	export GOPATH="$srcdir/gopath"
	go clean -modcache
}

build() {
	cd "$pkgname-$pkgver"
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o "${pkgname%-git}" .

	# Clean now to ensure makepkg --clean works
	go clean -modcache
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
