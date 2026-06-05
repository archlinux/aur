# Maintainer: Daniel Vigh <vighd@digital.co.hu>
pkgname=wlrun-git
_pkgname=wlrun
pkgver=1.2.0
pkgrel=1
pkgdesc="Keyboard-driven launcher and system console for wlr-layer-shell compositors: apps, network, Bluetooth, display, storage, keyboard, pass (git)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/vighd/wlrun"
license=('MIT')
depends=('libxkbcommon' 'freetype2' 'fontconfig')
makedepends=('go' 'pkgconf' 'git')
optdepends=(
  'iwd: Wi-Fi in the network mode'
  'dhcpcd: DHCP for wired networking'
  'openvpn: OpenVPN connections in the network mode'
  'sudo: privilege escalation for wired network / OpenVPN'
  'bluez-utils: Bluetooth mode'
  'wlr-randr: display mode'
  'udisks2: mount mode'
  'polkit: passwordless removable-media authorisation for the mount mode'
  'gvfs: MTP / phone volumes in the mount mode'
  'pass: password-store mode'
  'pass-otp: TOTP codes in the pass mode'
  'wl-clipboard: Ctrl+V paste on Wayland'
  'xclip: Ctrl+V paste on X11'
  'libnotify: desktop notifications'
)
provides=("$_pkgname")
# Renamed from river-delta-git: replace the old packages cleanly and warn on install.
replaces=('river-delta-git')
conflicts=("$_pkgname" 'river-delta' 'river-delta-git')
install="$pkgname.install"
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Latest tag + commits-since + short hash, e.g. 1.1.0.r5.gabc1234
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=v$(git -C . describe --tags 2>/dev/null || echo dev)" \
    -o "$_pkgname" ./cmd/wlrun
}

check() {
  cd "$_pkgname"
  go test ./...
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.sample.toml "$pkgdir/usr/share/$_pkgname/config.sample.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
