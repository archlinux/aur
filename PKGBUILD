# Maintainer: owe contributors
pkgname=owe
pkgver=0.1.0
pkgrel=1
pkgdesc="High-performance wallpaper engine for Omarchy (mp4, gif, stills)"
arch=('x86_64')
url="https://github.com/omacom/owe"
license=('MIT')
depends=('mpv' 'ffmpeg' 'wayland' 'libglvnd' 'libepoxy' 'systemd-libs' 'socat')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'wayland-protocols' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omacom/owe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af7440d50c3a4b1ebb7fb4968abb508d100ac1111580966a8da2abd8d024877b')

build() {
  meson setup build "$srcdir/owe-$pkgver" -Dbuildtype=release -Dprefix=/usr
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -d "$pkgdir/usr/lib/systemd/user"
  sed 's|%h/.local/bin/owed|/usr/bin/owed|' "$srcdir/owe-$pkgver/systemd/owed.service" \
    >"$pkgdir/usr/lib/systemd/user/owed.service"
  install -Dm755 "$srcdir/owe-$pkgver/hooks/owe-idle" "$pkgdir/usr/bin/owe-idle"
  install -Dm644 "$srcdir/owe-$pkgver/hooks/theme-set.d/10-owe-sync" "$pkgdir/usr/share/owe/10-owe-sync"
  install -Dm644 "$srcdir/owe-$pkgver/config/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
