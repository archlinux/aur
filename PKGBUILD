# Maintainer: nyrda <nyrda@keymasq.tools>

# The MCP server and the tools of a hyprmasq release, built from its source: hyprmasq-mcp, hyprmasq-input,
# hyprmasq-launch, and hyprmasq-reaper, which the plugin finds in /usr/lib/hyprmasq. None of them depends on Hyprland's
# internals, so a Hyprland update needs no rebuild. The plugin of the same release comes from hyprmasq-plugin-bin.
# hyprmasq-bin has the same programs, built by this file in the project's CI.
# Only Go modules are downloaded besides the release, and go.sum verifies them.
# The CI of github.com/nyrda/hyprmasq publishes this file from packaging/aur. It sets pkgver to the release,
# sha256sums to its archive, and pkgrel.

pkgname=hyprmasq
pkgver=0.5.1
pkgrel=1
pkgdesc='Computer use for Hyprland: an MCP server and tools for per-window screenshots and input'
arch=(x86_64)
url='https://github.com/nyrda/hyprmasq'
license=(MIT)
# The plugin of this release or a newer one: yay installs the new hyprmasq-plugin-bin before it builds this package, while
# the old one is still installed, and makepkg checks this before it builds.
depends=(ffmpeg glibc "hyprmasq-plugin>=$pkgver" jq libei libxkbcommon sh)
makedepends=(go)
source=("hyprmasq-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2af12f26157a56c72d7e0f8c5050fa2b03067846b8f32baaf6c6cb2c0a27e49')

# Keeps the modules in $srcdir, uses the installed Go only, and passes makepkg's flags.
_go() {
  GOPATH=$srcdir GOTOOLCHAIN=local GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=readonly -modcacherw' \
    CGO_CPPFLAGS=$CPPFLAGS CGO_CFLAGS=$CFLAGS CGO_CXXFLAGS=$CXXFLAGS CGO_LDFLAGS=$LDFLAGS go "$@"
}

prepare() {
  cd "hyprmasq-$pkgver/mcp"
  _go mod download
}

build() {
  cd "hyprmasq-$pkgver"
  make hyprmasq-input hyprmasq-launch hyprmasq-reaper
  cd mcp
  _go build -ldflags "-linkmode=external -X github.com/nyrda/hyprmasq/mcp/internal/server.Version=$(<../VERSION)" ./cmd/hyprmasq-mcp
}

check() {
  cd "hyprmasq-$pkgver/mcp"
  _go test -short ./...
}

package() {
  cd "hyprmasq-$pkgver"
  install -Dm755 hyprmasq-input hyprmasq-launch mcp/hyprmasq-mcp -t "$pkgdir/usr/bin"
  install -Dm755 hyprmasq-reaper -t "$pkgdir/usr/lib/hyprmasq"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
