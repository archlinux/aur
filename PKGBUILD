pkgname=file-explorer-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 file explorer with favorites, search, preview, and file operations"
arch=('any')
url="https://github.com/EvansOgala/file-explorer"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'xdg-utils'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/file-explorer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/file-explorer"
  install -Dm644 main.py "$pkgdir/usr/lib/file-explorer/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/file-explorer/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/file-explorer/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/file-explorer/settings.py"
  install -Dm644 models.py "$pkgdir/usr/lib/file-explorer/models.py"
  install -Dm644 file_ops.py "$pkgdir/usr/lib/file-explorer/file_ops.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.FileExplorer" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/file-explorer/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.FileExplorer.desktop \
    "$pkgdir/usr/share/applications/org.evans.FileExplorer.desktop"
  install -Dm644 org.evans.FileExplorer.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.FileExplorer.metainfo.xml"
  install -Dm644 org.evans.FileExplorer.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.FileExplorer.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
