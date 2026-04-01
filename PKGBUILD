# Maintainer: Dunky <braxtinmoss13@gmail.com>

pkgname=charm-pop
_upstream=pop
pkgver=0.2.0
pkgrel=1
pkgdesc="Send emails from your terminal (charmbracelet/pop)"
arch=(x86_64)
url="https://github.com/charmbracelet/pop"
license=('MIT')
depends=(glibc)
makedepends=(go)
provides=(pop)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('360db66ff46cf6331b2851f53477b7bf3a49303b0b46aaacff3d6c1027bf3f40')

prepare() {
cd "$_upstream-$pkgver"
go mod download
}

build() {
cd "$_upstream-$pkgver"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
go build -o "$_upstream" .
}

package() {
cd "$_upstream-$pkgver"
install -Dm755 "$_upstream" "$pkgdir/usr/bin/$_upstream"
install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
