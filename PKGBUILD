# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='bitw'
pkgname="$_pkgname-git"
pkgver='r40.8c8d0e9'
pkgrel='1'
pkgdesc='Minimalist BitWarden client with Secret Service API implementation'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mvdan/$_pkgname"
license=('BSD')
makedepends=('git' 'go')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export GOPATH="$srcdir/gopath"
	cd "$srcdir/$_pkgname"
	go build -gcflags "all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-extldflags $LDFLAGS" -o "$_pkgname" .
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	go clean -modcache
}
