# Maintainer: Mentigen <Kis-Ilya-A@yandex.ru>

pkgname=ghost-pause
pkgver=0.1.0
pkgrel=1
pkgdesc="Automatically pause media players when a browser plays audio"
arch=('x86_64' 'aarch64')
url="https://github.com/mentigen/ghost-pause"
license=('MIT')
depends=('libpulse' 'dbus')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# After tagging v0.1.0 and uploading, run: makepkg -g >> PKGBUILD
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-linkmode=external -X main.version=$pkgver" \
    -o "$pkgname" \
    .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname"            "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.service"    "$pkgdir/usr/lib/systemd/user/$pkgname.service"
  install -Dm644 config.example.json   "$pkgdir/usr/share/$pkgname/config.example.json"
  install -Dm644 LICENSE               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('b38e393304dda3cbddf970fb094ce0416c904cadd8672a4dd91d9865b4678488')
