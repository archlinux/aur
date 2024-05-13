# Maintainer: ole <ole@orhagen.no>
pkgname=go-tagalign-git
_pkgname="tagalign"
pkgver=v1.3.4.r0.e25313b
pkgrel=2
pkgdesc="TagAlign is used to align and sort tags in Go struct."
arch=("x86_64")
url="https://github.com/4meepo/tagalign"
license=('MIT')
groups=()
depends=("go")
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("go-tagalign")
source=("git+https://github.com/4meepo/tagalign.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
build() {
	cd "$srcdir/${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build ./cmd/${_pkgname}
}

check() {
	cd "$srcdir/${_pkgname}"
	go test ./...
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/$_pkgname/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
