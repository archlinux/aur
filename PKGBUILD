# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=pullcord-git
pkgver=r137.a4456d6
pkgrel=3
pkgdesc="Discord archiver"
arch=('x86_64')
url="https://github.com/tsudoko/pullcord"
license=('Unlicense')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	go mod init "${url#https://}"
	go mod tidy
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build ./cmd/...
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/pullcord -t "$pkgdir/usr/bin/"
}
