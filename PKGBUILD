# Maintainer: polarours <polarours@zohomail.com>
pkgname=hyprshare-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Linux-native sharing platform for Hyprland and Wayland (CLI, TUI, desktop GUI and web UI) - git version"
arch=('x86_64')
url="https://github.com/polarours/hyprshare"
license=('GPL-3.0-only')
depends=(
  'openssl' 'sdbus-cpp' 'pipewire' 'gcc-libs' 'glibc'
  'webkit2gtk-4.1' 'gtk3'
)
makedepends=(
  'cmake' 'ninja' 'git'
  'cargo' 'rust' 'nodejs' 'npm' 'pkgconf'
)
optdepends=('avahi: mDNS discovery support')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  local version
  version="$(sed -n 's/^project(hyprshare VERSION \([^ ]*\).*/\1/p' CMakeLists.txt | head -n1)"
  printf "%s.r%s.g%s" "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  # C++ CLI + daemon (tests built for check()).
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build

  # Web frontend (embedded into the GUI, also served by `hyprshare web serve`).
  (cd web && npm ci && npm run build)

  # Tauri GUI.
  (cd desktop/src-tauri && cargo build --release --locked)

  # Terminal UI.
  (cd tui && cargo build --release --locked)
}

package() {
  cd "$srcdir/${pkgname%-git}"

  DESTDIR="$pkgdir" cmake --install build

  # Desktop GUI.
  install -Dm755 desktop/src-tauri/target/release/hyprshare-desktop "$pkgdir/usr/bin/hyprshare-desktop"
  install -Dm644 desktop/hyprshare.desktop "$pkgdir/usr/share/applications/hyprshare.desktop"
  install -Dm644 desktop/src-tauri/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hyprshare.svg"
  for size in 32 128 256; do
    case "$size" in
      256) src="128x128@2x.png" ;;
      *)   src="${size}x${size}.png" ;;
    esac
    install -Dm644 "desktop/src-tauri/icons/$src" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/hyprshare.png"
  done

  # Terminal UI.
  install -Dm755 tui/target/release/hyprshare-tui "$pkgdir/usr/bin/hyprshare-tui"

  # Web frontend served by `hyprshare web serve`.
  install -d "$pkgdir/usr/share/hyprshare"
  cp -r web/dist "$pkgdir/usr/share/hyprshare/web"
}
