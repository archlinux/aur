pkgname=uni
pkgver=2.0.0
pkgrel=1
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
arch=('x86_64')
repo="github.com/arp242/$pkgname"
url="https://$repo"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('744e1d49b9cc8e336e260e0e922b28bb60f8fdaf347e656e964b5f4353c5162a')

prepare() {
  cd "$pkgname-$pkgver"
  # go mod vendor # to not download anything in build()
}

build() {
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw -mod=readonly" # add "-mod=vendor" if using  `go mod vendor` in prepare()
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
