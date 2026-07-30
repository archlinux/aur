# Maintainer: Jim Philip <jimphilip394 at gmail dot com>

_pkgname=shit
pkgname=shit-git
pkgver=r76.3a16d89
pkgrel=2
pkgdesc="Simple file server in Go (latest git)"
arch=('x86_64' 'aarch64' 'pentium4' 'riscv64' 'loong64')
url="https://github.com/notwithering/shit"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags "-compressdwarf=false -linkmode=external" -o "$_pkgname" .
}

package() {
	cd "$_pkgname"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
