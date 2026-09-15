# Maintainer: shahriyardx <mdshahriyaralam552@gmail.com>
# NOTE: pkgver and sha256sums here are placeholders — the release workflow
# stamps the real values and pushes to the AUR. The AUR is the source of truth.
pkgname=baaz
pkgver=0.1.9
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
sha256sums=('99dc3a8a29dcd60d76b4d40475ba8c8bc9ce3e9adf45e2a37a8aba1a67beb7bb')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-X main.version=$pkgver" -o baaz ./cmd/baaz
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
