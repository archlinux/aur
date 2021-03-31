# Maintainer: aksr <aksr at t-com dot me>
pkgname=gitbrute-git
pkgver=r12.16d0dee
pkgrel=1
pkgdesc='Brute-force a git commit hash'
arch=('i686' 'x86_64')
url='https://github.com/bradfitz/gitbrute'
license=('unknown')
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "${pkgname%-*}" gitbrute.go
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 "gitbrute" "$pkgdir/usr/bin/gitbrute"
	install -D -m644 README "$pkgdir/usr/share/doc/${pkgname%-*}/README"
}
