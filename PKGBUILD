# Maintainer: Arkaizn <your-email at example dot com>
pkgname=mediasync-git
_pkgname=mediasync
pkgver=r22.5515558
pkgrel=1
pkgdesc="Universal media session bridge: local MPRIS players and Jellyfin sessions behind one local API"
arch=('x86_64' 'aarch64')
url="https://github.com/arkaizn/mediasync"
license=('MIT')
depends=('glibc' 'dbus')
makedepends=('git' 'go')
optdepends=(
  'gnome-keyring: Secret Service backend for Jellyfin tokens'
  'kwallet: Secret Service backend for Jellyfin tokens (KWallet >= 5.97)'
  'keepassxc: Secret Service backend for Jellyfin tokens'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/arkaizn/mediasync.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # v0.1.0-12-gabc1234 -> 0.1.0.r12.gabc1234; without tags: r123.abc1234
  if git describe --long --tags --abbrev=7 >/dev/null 2>&1; then
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

prepare() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  go mod download -x 2>/dev/null || go mod download
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o build/ ./cmd/...
}

check() {
  cd "$_pkgname"
  export GOPATH="$srcdir/gopath"
  export GOFLAGS="-mod=readonly -modcacherw"
  # D-Bus tests start a private dbus-daemon and skip if it is missing.
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 build/mediasyncd build/mediasyncctl -t "$pkgdir/usr/bin/"
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  sed 's|@BINDIR@|/usr/bin|g' contrib/systemd/mediasyncd.service.in \
    > "$pkgdir/usr/lib/systemd/user/mediasyncd.service"
  chmod 644 "$pkgdir/usr/lib/systemd/user/mediasyncd.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD_PARTY_NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$_pkgname/config.toml"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 docs/*.md -t "$pkgdir/usr/share/doc/$_pkgname/docs/"
}
