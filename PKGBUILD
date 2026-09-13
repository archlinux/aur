# Maintainer: shahriyardx <mdshahriyaralam552@gmail.com>
pkgname=baaz
pkgver=0.1.2
pkgrel=1
pkgdesc="Falcon-fast segmented download manager - Chrome interception and Omarchy bar widget"
arch=('x86_64')
url="https://github.com/shahriyardx/baaz"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('libnotify: desktop notifications'
            'yt-dlp: media-site downloads (YouTube, TikTok, ...)'
            'omarchy: status bar widget (baaz install-bar)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2793e9397528740abed1c7830ad49a976a4b72b50eb3b0a9424f1710f12fd4ef')

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
