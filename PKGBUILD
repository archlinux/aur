# Maintainer: Arkaizn
# pkgver and sha256sums are updated by .github/workflows/aur-release.yml
# when a release tag (vX.Y.Z) is pushed.
pkgname=mediasync
pkgver=0.2.2
pkgrel=1
pkgdesc="Universal media session bridge: local MPRIS players and Jellyfin sessions behind one local API"
arch=('x86_64' 'aarch64')
url="https://github.com/arkaizn/mediasync"
license=('MIT')
depends=('glibc' 'dbus')
makedepends=('go')
optdepends=(
  'gnome-keyring: Secret Service backend for Jellyfin tokens'
  'kwallet: Secret Service backend for Jellyfin tokens (KWallet >= 5.97)'
  'keepassxc: Secret Service backend for Jellyfin tokens'
)
conflicts=('mediasync-git')
# No -debug split package: it would conflict between mediasync and
# mediasync-git (same file paths) when switching packages.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arkaizn/mediasync/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7c5e899482d4c8124fdc1c7806681444fb098649473c39bb248bd797ce9ba60')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  # -modcacherw: keep the module cache writable so makepkg/yay can clean up.
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o build/ ./cmd/...
}

check() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-mod=readonly -modcacherw"
  # D-Bus tests start a private dbus-daemon and skip if it is missing.
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/mediasyncd build/mediasyncctl -t "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  sed 's|@BINDIR@|/usr/bin|g' contrib/systemd/mediasyncd.service.in \
    > "$pkgdir/usr/lib/systemd/user/mediasyncd.service"
  chmod 644 "$pkgdir/usr/lib/systemd/user/mediasyncd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$pkgname/docs/"
}
