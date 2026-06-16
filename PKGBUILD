# Maintainer: KannarFr <kannarfr@gmail.com>
pkgname=friendly-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Spotlight-style overlay that rewrites a dictated/typed message in a chosen tone via Claude Code (claude -p), then copies it to the clipboard"
arch=('any')
url="https://github.com/KannarFr/friendly"
license=('MIT')
depends=(
  'bash'
  'python'
  'python-gobject'
  'gtk3'
  'gtk-layer-shell'
  'wl-clipboard'
  'hicolor-icon-theme'
)
optdepends=(
  'claude-code: LLM backend — friendly calls `claude -p` (REQUIRED at runtime; AUR, or `npm i -g @anthropic-ai/claude-code`)'
  'wofi: Spotlight-style menu/launcher (recommended; falls back to rofi/zenity)'
  'libnotify: desktop notifications (result + progress)'
  'rofi: fallback launcher if wofi is missing'
  'zenity: last-resort fallback dialogs'
)
makedepends=('git')
provides=('friendly')
conflicts=('friendly')
source=("$pkgname::git+https://github.com/KannarFr/friendly.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local tag
  if tag=$(git describe --long --tags 2>/dev/null); then
    printf '%s' "$tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 friendly          "$pkgdir/usr/bin/friendly"
  install -Dm644 friendly-input.py "$pkgdir/usr/share/friendly/friendly-input.py"
  install -Dm644 spotlight.css     "$pkgdir/usr/share/friendly/spotlight.css"
  install -Dm644 friendly.svg      "$pkgdir/usr/share/friendly/friendly.svg"

  install -Dm644 friendly.svg      "$pkgdir/usr/share/icons/hicolor/scalable/apps/friendly.svg"
  install -Dm644 friendly.desktop  "$pkgdir/usr/share/applications/friendly.desktop"

  install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
