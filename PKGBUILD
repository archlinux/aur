# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=stasis
pkgver=1.0.0
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
sha256sums=('24714fd28b913aec483042fc0546949f8f310de4fe9796a1ea3b5d4bedb6b5de')

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
    install -Dm644 "packaging/systemd/user/stasis.service" "$pkgdir/usr/lib/systemd/user/stasis.service"
}
