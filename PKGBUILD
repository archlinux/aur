# Maintainer: Phaylali <admin@omniversify.com>

pkgname=omniversify-hypr-calendar
pkgver=1.0.5
pkgrel=1
pkgdesc="Three-calendar (Gregorian, Hijri, Amazigh) floating overlay for Hyprland"
arch=('any')
url="https://github.com/phaylali/hypr-calendar-omniversify"
license=('Unlicense')
depends=('python' 'python-gobject' 'gtk4' 'hyprland')
optdepends=(
  'noto-fonts: Arabic and Tifinagh glyphs for the Hijri/Amazigh tags'
  'waybar: the clock module this overlay is meant to be bound to'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/phaylali/hypr-calendar-omniversify.git#tag=v$pkgver")
sha256sums=('SKIP')

# No compiled code, no build() - it is a single Python file and a JSON table.
# The widget reads its tables from ~/.local/share/hypr-calendar/data.json if
# present and falls back to the copy below, which is why package() can install
# into /usr/share without ever touching $HOME.

package() {
  local repo="$srcdir/$pkgname"

  # /usr/bin, not ~/.local/bin: a package has no business writing to $HOME.
  install -Dm755 "$repo/src/hypr-calendar" "$pkgdir/usr/bin/hypr-calendar"

  # Calendar tables, read-only, overridable per user by dropping a file into
  # ~/.local/share/hypr-calendar/ (see DATA_PATH in the widget).
  install -Dm644 "$repo/src/data.json" \
    "$pkgdir/usr/share/hypr-calendar/data.json"

  # The launcher the waybar clock should call. Installed under a name that
  # does not collide with the widget itself.
  install -Dm755 "$repo/scripts/calendar.sh" \
    "$pkgdir/usr/bin/hypr-calendar-toggle"

  install -Dm644 "$repo/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$repo/DEV_NOTES.md" \
    "$pkgdir/usr/share/doc/$pkgname/DEV_NOTES.md"
  install -Dm644 "$repo/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
