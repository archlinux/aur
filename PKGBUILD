# Maintainer: Daniel Vigh <vighd@digital.co.hu>
pkgname=wlrun
pkgver=1.11.0
pkgrel=1
pkgdesc="Keyboard-driven launcher and system console for wlr-layer-shell compositors: apps, network, Bluetooth, display, storage, keyboard, pass"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/vighd/wlrun"
license=('MIT')
depends=('libxkbcommon' 'freetype2' 'fontconfig')
makedepends=('go' 'pkgconf')
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
  'sshfs: sshfs network mounts in the mount mode'
  'nfs-utils: NFS network mounts in the mount mode'
  'cifs-utils: CIFS / SMB network mounts in the mount mode'
  'pass: password-store mode'
  'pass-otp: TOTP codes in the pass mode'
  'wl-clipboard: Ctrl+V paste on Wayland'
  'xclip: Ctrl+V paste on X11'
  'libnotify: desktop notifications'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('524e4ef1e39a151ca46988c680d32ff8fd605b08fc3b309ccc1044075d72f5dc')

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-linkmode=external -X main.version=v$pkgver" \
    -o "$pkgname" ./cmd/wlrun
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 config.sample.toml "$pkgdir/usr/share/$pkgname/config.sample.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
