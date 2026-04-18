pkgname=ops-console-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 operations console for network inspection and update checks"
arch=('any')
url="https://github.com/EvansOgala/ops-console"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'python-psutil'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/ops-console.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/ops-console"
  install -Dm644 main.py "$pkgdir/usr/lib/ops-console/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/ops-console/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/ops-console/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/ops-console/settings.py"
  install -Dm644 network_forensics.py "$pkgdir/usr/lib/ops-console/network_forensics.py"
  install -Dm644 updater.py "$pkgdir/usr/lib/ops-console/updater.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.OpsConsole" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/ops-console/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.OpsConsole.desktop \
    "$pkgdir/usr/share/applications/org.evans.OpsConsole.desktop"
  install -Dm644 org.evans.OpsConsole.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.OpsConsole.metainfo.xml"
  install -Dm644 org.evans.OpsConsole.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.OpsConsole.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
