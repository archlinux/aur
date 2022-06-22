# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>

pkgname=ivy-git
pkgver=r374.8ed7a2a
pkgrel=1
pkgdesc='An APL-like calculator.'
arch=('i686' 'x86_64')
url='https://github.com/robpike/ivy'
license=('BSD')
makedepends=('git' 'go>=1.5')
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
	go build -o "${pkgname%-*}" .
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 ${pkgname%-*} "$pkgdir/usr/bin/${pkgname%-*}"
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	sed '11,313!d' doc.go > README
	install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
