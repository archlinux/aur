pkgname=uni
pkgver=1.1.1
pkgrel=1
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
arch=('x86_64')
repo="github.com/arp242/$pkgname"
url="https://$repo"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d29fdd8f34f726e6752e87f554d8ea73e324b7729afaf4bd52fcae04c7638757')

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
