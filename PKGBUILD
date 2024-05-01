# Maintainer: ole <ole@orhagen.no>
pkgname=go-regal-git
_pkgname="regal"
pkgver=v0.21.3.r1.a106547
pkgrel=2
pkgdesc="Regal is a linter and language server for Rego"
arch=("x86_64")
url="https://github.com/StyraInc/regal"
license=('Apache2.0')
groups=()
depends=("go")
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("go-regal")
source=("git+https://github.com/StyraInc/regal.git")
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
  go build .
}

check() {
	cd "$srcdir/${_pkgname}"
	go test ./...
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 "$srcdir/$_pkgname/regal" "$pkgdir/usr/bin/regal"
}
