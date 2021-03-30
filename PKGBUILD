pkgname=uni
pkgver=2.1.0
pkgrel=1
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
arch=('x86_64')
repo="github.com/arp242/$pkgname"
url="https://$repo"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('79574395d83f628b0b325127b2dcea9b3e91dd6510dafd036679fae8998bcf6e')

#prepare() {
#  go mod vendor # to not download anything in build()
#}

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw" # add "-mod=vendor" if using  `go mod vendor` in prepare()
  cd "$pkgname-$pkgver"
  go build -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
