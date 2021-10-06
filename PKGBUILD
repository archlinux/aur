pkgname=uni
pkgver=2.3.0
pkgrel=1
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
arch=('x86_64')
repo="github.com/arp242/$pkgname"
url="https://$repo"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2786c0e7ebe138de3a05320525eba4d4b718d36ea7557a9b0e2009f18b59a43b')

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
