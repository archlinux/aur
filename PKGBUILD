# Maintainer: Laura Demkowicz-Duffy <laura at demkowiczduffy dot co.uk>
_pkgname=hledger-language-server
pkgname=$_pkgname-git
pkgver=r143.74e8903
pkgrel=1
pkgdesc="LSP implementation for plaintext accounting"
arch=('x86_64')
url="https://github.com/yeldiRium/hledger-language-server"
license=('MIT')
depends=(hledger glibc)
makedepends=(go git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build .
}

check() {
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dm0755 hledger-language-server "$pkgdir/usr/bin/hledger-language-server"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
