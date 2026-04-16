pkgname=python-browser-git
pkgver=0.r5.g342ea85
pkgrel=1
pkgdesc="GTK4 web browser with profiles, local history, bookmarks, and session restore"
arch=('any')
url="https://github.com/EvansOgala/python-browser"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'webkitgtk-6.0'
  'libsoup3'
)
makedepends=('git')
provides=('python-browser')
conflicts=('python-browser')
source=("$pkgname::git+https://github.com/EvansOgala/python-browser.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/python-browser"
  install -Dm755 main.py "$pkgdir/usr/lib/python-browser/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/python-browser/ui.py"
  install -Dm644 storage.py "$pkgdir/usr/lib/python-browser/storage.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/python-browser/gtk_style.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.PythonBrowser" <<'EOF'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/python-browser/main.py "$@"
EOF

  install -Dm644 org.evans.PythonBrowser.desktop \
    "$pkgdir/usr/share/applications/org.evans.PythonBrowser.desktop"
  install -Dm644 org.evans.PythonBrowser.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.PythonBrowser.metainfo.xml"
  install -Dm644 org.evans.PythonBrowser.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.PythonBrowser.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
