# Maintainer: owe contributors
pkgname=owe
pkgver=0.2.10
pkgrel=1
pkgdesc="High-performance wallpaper engine for Omarchy (mp4, gif, stills)"
arch=('x86_64' 'aarch64')
url="https://github.com/omacom/owe"
license=('MIT')
depends=('mpv' 'ffmpeg' 'wayland' 'libglvnd' 'libepoxy' 'systemd-libs' 'socat' 'qt6-declarative')
makedepends=('meson' 'ninja' 'gcc' 'pkgconf' 'wayland-protocols' 'cmake')
checkdepends=('python')
optdepends=('intel-media-driver: VAAPI hardware decode on Intel GPUs'
            'libva-mesa-driver: VAAPI hardware decode on AMD GPUs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omacom/owe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b171397c24c0ffd6096781b3f744f674055a57f660a74db07a3b71a111a6980b')

build() {
  meson setup build "$srcdir/owe-$pkgver" -Dbuildtype=release -Dprefix=/usr
  ninja -C build
  cmake -S "$srcdir/owe-$pkgver/qml-plugin" -B build-qml \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=ON
  cmake --build build-qml
}

check() {
  meson test -C build
  ctest --test-dir build-qml --output-on-failure
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  DESTDIR="$pkgdir" cmake --install build-qml
  install -d "$pkgdir/usr/lib/systemd/user"
  sed 's|%h/.local/bin/owed|/usr/bin/owed|' "$srcdir/owe-$pkgver/systemd/owed.service" \
    >"$pkgdir/usr/lib/systemd/user/owed.service"
  install -Dm755 "$srcdir/owe-$pkgver/hooks/owe-idle" "$pkgdir/usr/bin/owe-idle"
  install -Dm644 "$srcdir/owe-$pkgver/hooks/theme-set.d/10-owe-sync" "$pkgdir/usr/share/owe/10-owe-sync"
  install -Dm644 "$srcdir/owe-$pkgver/config/config.toml" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
