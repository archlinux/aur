# Maintainer: ole <ole at orhagen.no>
pkgname=go-sqls-git
_pkgname="sqls"
pkgver=v0.2.28.r18.eb695ac
pkgrel=1
pkgdesc="SQLs is an implementation of the Language Server Protocol for SQL."
arch=("x86_64")
url="https://github.com/sqls-server/sqls"
license=('MIT')
groups=()
depends=("go")
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("go-regal")
source=("git+https://github.com/sqls-server/sqls.git")
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

	install -Dm755 "$srcdir/$_pkgname/sqls" "$pkgdir/usr/bin/sqls"
}
