# Maintainer: Gleb Sinyavsky <zhulik.gleb@gmail.com>

pkgname=rutracker-proxy
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool for proxying client's announces to blocked rutracker servers"
arch=('x86_64' 'i686')
url="https://github.com/zhulik/$pkgname"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/zhulik/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service")
sha256sums=('c06702971f45bcfee32987b40df1c73004e02a57c052e9fb3c18b28f231ac9c5'
            'e79f961e069637ea548a3b7729eb3a51891a28bdf20815a418674d16954eaaad'
            '903e72b3adda53c4d4833996a37a56d34d447a3f51982d13c4d2891d78f39e09')

build() {
  GOPATH="$srcdir"
  _ROOT="$srcdir/src/github.com/zhulik/"
  mkdir -p "$_ROOT"
  mv "$pkgname-$pkgver" "$_ROOT/$pkgname"
  cd "$_ROOT/$pkgname"
  go get
  go build
}

package() {
  install -Dm755 "$pkgname.conf" "$pkgdir/etc/$pkgname/$pkgname.conf"
  install -Dm755 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  _ROOT="$srcdir/src/github.com/zhulik/"
  cd "$_ROOT/$pkgname"

  install -p -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et: