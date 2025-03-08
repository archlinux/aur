# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
pkgname=noti
pkgver=3.8.0
pkgrel=1
pkgdesc='Monitor a process and trigger a notification'
arch=('x86_64')
url='https://github.com/variadico/noti'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/variadico/noti/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b637b4b4e5eb10b3ea2c5b2cf0fbd1904ab8fd26eaec4b911f4ce2db3ab881a2')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -ldflags "-s -w -X github.com/variadico/noti/internal/command.Version=${pkgver}" \
    -o "$pkgname" \
    github.com/variadico/noti/cmd/noti
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 noti -t "$pkgdir/usr/bin/"
  install -Dm644 "docs/man/dist/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 "docs/man/dist/$pkgname.yaml.5" -t "$pkgdir/usr/share/man/man5/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
