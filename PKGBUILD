# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='bitw'
pkgname="$_pkgname-git"
pkgver='r46.17ac675'
pkgrel='1'
pkgdesc='Minimalist BitWarden client with Secret Service API implementation - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mvdan/$_pkgname"
license=('BSD')
makedepends=('git' 'go-pie')
provides=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_sourcedirectory-gopath"
	go build -gcflags "all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-extldflags $LDFLAGS" -o "$_pkgname" .
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	go clean -modcache
}
