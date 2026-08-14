# Maintainer: Axel Haustant <noirbizarre@gmail.com>
#
# Prebuilt binary package. `0.1.0` and `e852fbfb92b48d4882ef070eedfd1dfdf6a7462f7354a50f6acb0256f59fe12c` are substituted by
# .github/workflows/aur.yml from the published release assets.

pkgname=snypr-bin
_pkgname=snypr
pkgver=0.1.0
pkgrel=1
pkgdesc="Screenshot, annotation, and live-drawing tool for Hyprland and wlroots compositors (prebuilt binary)"
arch=('x86_64')
url="https://github.com/noirbizarre/snypr"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'wayland' 'hicolor-icon-theme')
optdepends=(
  'libnotify: desktop notifications (any notification daemon, e.g. mako, dunst, swaync)'
  'waybar: StatusNotifierItem host for `snypr daemon --systray` (any SNI host works)'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-$CARCH.tar.gz::$url/releases/download/$pkgver/$_pkgname-$pkgver-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('e852fbfb92b48d4882ef070eedfd1dfdf6a7462f7354a50f6acb0256f59fe12c')

package() {
  cd "$_pkgname-$pkgver-${CARCH}-unknown-linux-gnu"

  # The tarball is already laid out as a `$PREFIX` tree, so this is a copy.
  install -Dm755 bin/snypr "$pkgdir/usr/bin/snypr"
  install -Dm644 -t "$pkgdir/usr/share/applications" share/applications/*.desktop
  install -Dm644 share/man/man1/snypr.1 "$pkgdir/usr/share/man/man1/snypr.1"

  local size
  for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
    install -Dm644 \
      "share/icons/hicolor/$size/apps/noirbizar.re.Snypr.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/noirbizar.re.Snypr.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
