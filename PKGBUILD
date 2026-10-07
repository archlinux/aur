# Maintainer: Ilyas Turki <turki.ilyass@gmail.com>
pkgbase=universe-bin
pkgname=(universe-bin universe-desktop-bin)
pkgver=0.0.11
pkgrel=1
pkgdesc='Gamepad-first game launcher: a Rust core, a PySide6 UI, games inside gamescope (prebuilt release)'
arch=('x86_64')
url='https://github.com/ilyasturki/universe'
license=('MIT')
makedepends=('python-installer')
# the release binaries come stripped
options=('!debug' '!strip')
# the release asset's name carries no version
source=(
  "$pkgbase-$pkgver.tar.gz::$url/releases/download/v$pkgver/universe-x86_64-linux.tar.gz"
  "metadata-$pkgver.json::$url/raw/v$pkgver/extension/metadata.json"
  "extension-$pkgver.js::$url/raw/v$pkgver/extension/extension.js"
)
sha256sums=('be2d91a3d4b099f7ac9ad4ee1aefab3fcbd882095e8b06c6954f3cb4485b465b'
            '9553a252999bd38451c6d7a3601eec64ea295c5f1761426106fc92d3add7fcb1'
            'bd002bbb46df0ce972907934d2f96dbb57d132fce86743dde00c2ce0aec11808')
_id=io.github.ilyasturki.UniverseDesktop
_desktop=(
  "applications/$_id.desktop"
  "dbus-1/services/$_id.service"
  "gnome-shell/search-providers/$_id.search-provider.ini"
  "metainfo/$_id.metainfo.xml"
  "icons/hicolor/scalable/apps/$_id.svg"
  "icons/hicolor/symbolic/apps/$_id-symbolic.svg"
  'man/man1/universe-desktop.1'
)

package_universe-bin() {
  depends=(
    'libgcc'
    'glibc'
    'hicolor-icon-theme'
    'python'
    'pyside6>=6.11'
    'python-pysdl2'
    'python-qrcode'
    'python-xkbcommon'
    'qt6-5compat'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-multimedia'
    'qt6-svg'
    'qt6-wayland'
    'sdl2'
    'systemd'
  )
  optdepends=(
    'gamescope: games run inside it'
    'mangohud: the frame rate limit and the in-game HUD'
    "lib32-mangohud: the HUD in 32-bit games, Proton's included"
    'umu-launcher: Proton launches; fetched on first use when missing'
    'heroic-gogdl: the GOG source; fetched on first use when missing'
    'legendary: the Epic Games source; fetched on first use when missing'
    'ludusavi: save backups; fetched on first use when missing'
    'butler: the itch.io source; fetched on first use when missing'
    'steam: the Steam source'
    "gpu-screen-recorder: the capture module's recordings"
    "ffmpeg: the capture module's thumbnails and cuts"
    'trash-cli: recordings deleted to the trash'
    'game-devices-udev: udev rules that make pads readable by your session'
    'grim: screenshots on sway, hyprland and niri'
    'spectacle: screenshots on KDE Plasma'
    'universe-desktop-bin: the library in a GTK app for mouse and keyboard'
  )
  provides=("universe=$pkgver")
  conflicts=('universe')
  cd "universe-$pkgver"
  for wheel in wheels/*.whl; do
    python -m installer --destdir="$pkgdir" "$wheel"
  done
  install -Dm755 bin/universe -t "$pkgdir/usr/bin"
  install -Dm755 lib/universe/universe-system-install -t "$pkgdir/usr/lib/universe"
  install -d "$pkgdir/usr/share"
  cp -r share/. "$pkgdir/usr/share"
  local f
  for f in "${_desktop[@]}"; do
    rm "$pkgdir/usr/share/$f"
  done
  find "$pkgdir/usr/share" -type d -empty -delete
  local ext="$pkgdir/usr/share/gnome-shell/extensions/universe@ilyasturki.github.io"
  install -Dm644 "$srcdir/metadata-$pkgver.json" "$ext/metadata.json"
  install -Dm644 "$srcdir/extension-$pkgver.js" "$ext/extension.js"
  install -Dm644 lib/udev/rules.d/70-universe.rules -t "$pkgdir/usr/lib/udev/rules.d"
  install -Dm644 lib/modules-load.d/universe.conf -t "$pkgdir/usr/lib/modules-load.d"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_universe-desktop-bin() {
  pkgdesc='The Universe game library for mouse and keyboard: a GTK 4 and libadwaita app (prebuilt release)'
  depends=(
    'libgcc'
    'glibc'
    'gst-plugins-base'
    'gst-plugins-good'
    'gtk4>=1:4.22'
    'hicolor-icon-theme'
    'libadwaita>=1:1.9'
    "universe=$pkgver"
  )
  optdepends=(
    'gst-libav: recordings played in the app (H.264, HEVC)'
    'gst-plugins-bad: recordings played in the app (AV1, VA-API)'
  )
  provides=("universe-desktop=$pkgver")
  conflicts=('universe-desktop')
  cd "universe-$pkgver"
  install -Dm755 bin/universe-desktop -t "$pkgdir/usr/bin"
  local f
  for f in "${_desktop[@]}"; do
    install -Dm644 "share/$f" "$pkgdir/usr/share/$f"
  done
  sed -i 's|^Exec=universe-desktop|Exec=/usr/bin/universe-desktop|' "$pkgdir/usr/share/dbus-1/services/$_id.service"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
