# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# VCS package: tracks the `main` branch. `pkgver` is derived by makepkg, so this
# PKGBUILD carries no `@VERSION@` placeholder.

pkgname=snypr-git
_pkgname=snypr
pkgver=0.3.0.r0.g0ee5984
pkgrel=1
pkgdesc="Screenshot, annotation, and live-drawing tool for Hyprland and wlroots compositors (git)"
arch=('x86_64')
url="https://github.com/noirbizarre/snypr"
license=('MIT')
# `desktop-file-utils` and `hicolor-icon-theme` provide the pacman hooks that
# refresh the desktop database and the icon cache, which is why this package
# ships no .install file.
depends=('gtk4' 'gtk4-layer-shell' 'wayland' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'rust' 'pkgconf')
optdepends=(
  'libnotify: desktop notifications (any notification daemon, e.g. mako, dunst, swaync)'
  'waybar: StatusNotifierItem host for `snypr daemon --systray` (any SNI host works)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

check() {
  cd "$_pkgname"
  cargo test --release --locked
}

package() {
  cd "$_pkgname"

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
