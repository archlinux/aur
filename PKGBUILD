pkgname=stasis-git
pkgver=0.6.2.r23.ge247137
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness (git version)"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('systemd' 'dbus' 'libinput' 'wayland')
makedepends=('git' 'cargo' 'rust')
optdepends=(
  'libnotify: for desktop notifications'
  'playerctl: enhanced media player detection'
  'pipewire-pulse: audio sink detection for media handling'
  'pulseaudio: audio sink detection for media handling (alternative to pipewire-pulse)'
)
provides=('stasis')
conflicts=('stasis')
options=('!debug')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/stasis"
  git describe --long --tags --always | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$srcdir/stasis"
  cargo build --release --locked
}

package() {
  cd "$srcdir/stasis"
  # Install binary
  install -Dm755 "target/release/stasis" "$pkgdir/usr/bin/stasis"
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Install example configuration
  install -Dm644 "examples/stasis.rune" "$pkgdir/usr/share/$pkgname/examples/stasis.rune"
  # Install systemd user service file
  install -Dm644 "systemd/stasis.service" "$pkgdir/usr/lib/systemd/user/stasis.service"
  # Install python script for Media Bridge
  install -Dm755 "scripts/media_bridge_host.py" "$pkgdir/usr/bin/media_bridge_host.py"
}
