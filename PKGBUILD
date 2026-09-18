# Maintainer: owe contributors
pkgname=owe
pkgver=0.2.0
pkgrel=1
pkgdesc="High-performance wallpaper engine for Omarchy (mp4, gif, stills)"
arch=('x86_64' 'aarch64')
url="https://github.com/omacom/owe"
license=('MIT')
depends=('mpv' 'ffmpeg' 'wayland' 'libglvnd' 'libepoxy' 'systemd-libs' 'socat')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'wayland-protocols')
checkdepends=('python')
optdepends=('intel-media-driver: VAAPI hardware decode on Intel GPUs'
            'libva-mesa-driver: VAAPI hardware decode on AMD GPUs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omacom/owe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d667048b0096bbcbb508c0cedd460bf5fb669fafffdcefc432f2886e284295c8')

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
