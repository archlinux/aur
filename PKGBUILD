# Maintainer: Dustin Pilgrim <dustin.pilgrim1997@gmail.com>

pkgname=stasis
pkgver=1.6.1
pkgrel=1
pkgdesc="A modern Wayland idle manager designed for simplicity and effectiveness"
arch=('x86_64')
url="https://github.com/saltnpepper97/stasis"
license=('MIT')
depends=('systemd' 'dbus' 'libinput' 'wayland')
makedepends=('cargo' 'rust')
optdepends=(
  'libnotify: for desktop notifications'
  'pipewire-pulse: audio sink detection for media handling'
  'pulseaudio: audio sink detection for media handling (alternative to pipewire-pulse)'
)
conflicts=('stasis-git')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d9a009989b230c5ca70e1264f9b7a52494f8f3863c81502526ad557255d9e97')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/stasis" "$pkgdir/usr/bin/stasis"

    # Install icon
    install -Dm644  "assets/stasis.png"  "$pkgdir/usr/share/icons/hicolor/256x256/apps/stasis.png"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example configuration
    install -Dm644 "examples/stasis.rune" "$pkgdir/usr/share/$pkgname/examples/stasis.rune"

    # Install systemd user service file
    install -Dm644 "packaging/systemd/user/stasis.service" "$pkgdir/usr/lib/systemd/user/stasis.service"
}
