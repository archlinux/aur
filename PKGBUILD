# Maintainer: aksr <aksr at t-com dot me>
pkgname=s-git
pkgver=0.5.7.r155.gc8c3d86
pkgrel=1
pkgdesc='Open a web search in your terminal.'
arch=('i686' 'x86_64')
url='https://github.com/zquestz/s'
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
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
	go build -o "${pkgname%-*}" .
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 ${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
