# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=stasis
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('systemd' 'dbus' 'libinput' 'wayland')
makedepends=('cargo' 'rust')
optdepends=(
  'libnotify: for desktop notifications'
  'playerctl: enhanced media player detection'
  'pipewire-pulse: audio sink detection for media handling'
  'pulseaudio: audio sink detection for media handling (alternative to pipewire-pulse)'
)
conflicts=('stasis-git')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e69a46e3db4145f85a34d822a6f8d4ec67195cc70ad270585119ed9c1d5bd90')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

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
