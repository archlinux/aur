# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=statping
pkgver=0.80.70
pkgrel=1
pkgdesc='An easy to use Status Page for your websites and applications.'
arch=(x86_64)
url='https://statping.com/'
license=("GPL3")
makedepends=(go sassc go.rice)
source=("$pkgname-$pkgver.tar.gz::https://github.com/hunterlong/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('8ead17b56bcc6b5705f3e8ec894dbe885e0f622a39e58df3179ea26992574478')
_commit_version=72f1889a9479042ea04a9d9efed247e1460812fb

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  go generate
  cd "$srcdir/$pkgname-$pkgver/handlers/graphql"
  go generate
  cd "$srcdir/$pkgname-$pkgver/source"
  sassc scss/base.scss css/base.css
  cd "$srcdir/$pkgname-$pkgver/source"
  rice embed-go
  cd "$srcdir/$pkgname-$pkgver"
  go mod vendor
  go build -a -ldflags "-X main.VERSION=${pkgver} -X main.COMMIT=$_commit_version" -o $pkgname -v ./cmd
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/statping" "$pkgdir/usr/bin/statping"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
