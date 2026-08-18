# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# Source package. `0.3.0` and `6cd100a70516b4ce1eab9e46fbd8c040d1cf5d07daee29d3d9f2e58c1b1cce83` are substituted by
# .github/workflows/aur.yml from the published release assets.

pkgname=snypr
pkgver=0.3.0
pkgrel=1
pkgdesc="Screenshot, annotation, and live-drawing tool for Hyprland and wlroots compositors"
arch=('x86_64')
url="https://github.com/noirbizarre/snypr"
license=('MIT')
# `desktop-file-utils` and `hicolor-icon-theme` provide the pacman hooks that
# refresh the desktop database and the icon cache, which is why this package
# ships no .install file.
depends=('gtk4' 'gtk4-layer-shell' 'wayland' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('rust' 'pkgconf')
optdepends=(
  'libnotify: desktop notifications (any notification daemon, e.g. mako, dunst, swaync)'
  'waybar: StatusNotifierItem host for `snypr daemon --systray` (any SNI host works)'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6cd100a70516b4ce1eab9e46fbd8c040d1cf5d07daee29d3d9f2e58c1b1cce83')

build() {
  cd "$pkgname-$pkgver"
  # `--locked` honours the tracked Cargo.lock shipped in the tarball, so the
  # package is built from the exact dependency graph upstream CI tested.
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  # Unit tests only: anything needing a live compositor sits behind the
  # `integration-wayland` feature and is not enabled here.
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/snypr "$pkgdir/usr/bin/snypr"
  install -Dm644 -t "$pkgdir/usr/share/applications" data/applications/*.desktop
  install -Dm644 docs/man/snypr.1 "$pkgdir/usr/share/man/man1/snypr.1"

  local size
  for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 \
      "data/icons/hicolor/$size/apps/noirbizar.re.Snypr.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/noirbizar.re.Snypr.png"
  done
  install -Dm644 \
    data/icons/hicolor/scalable/apps/noirbizar.re.Snypr.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/noirbizar.re.Snypr.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
