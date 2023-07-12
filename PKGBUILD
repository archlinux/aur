# Contributor: Toby Vincent <tobyv@tobyvin.dev>
# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=maildir-rank-addr-git
pkgver=1.3.0.r0.g50569b5
pkgrel=1
pkgdesc='Generates a ranked addressbook from a maildir folder'
arch=('x86_64')
url="https://github.com/ferdinandyb/maildir-rank-addr"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p build/
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./...
}

check() {
	cd "$srcdir/${pkgname%-git}"
	go test ./...
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
