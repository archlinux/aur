# Maintainer: shahriyardx <mdshahriyaralam552@gmail.com>
pkgname=baaz
pkgver=0.1.0
pkgrel=1
pkgdesc="Falcon-fast segmented download manager - Chrome interception and Omarchy bar widget"
arch=('x86_64')
url="https://github.com/shahriyardx/baaz"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('libnotify: desktop notifications'
            'omarchy: status bar widget (baaz install-bar)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('19499d5386e19d41c97838321d9eef306151e0770863d8c7f9d39818b4492d0c')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o baaz ./cmd/baaz
}

check() {
  cd "$pkgname-$pkgver"
  go test ./internal/...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 baaz "$pkgdir/usr/bin/baaz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 systemd/baaz.service "$pkgdir/usr/lib/systemd/user/baaz.service"
}
