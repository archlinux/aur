pkgname=linux-ops-center-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 operations dashboard for services, disk audits, and package checks"
arch=('any')
url="https://github.com/EvansOgala/linux-ops-center"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'systemd'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/linux-ops-center.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/linux-ops-center"
  install -Dm644 main.py "$pkgdir/usr/lib/linux-ops-center/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/linux-ops-center/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/linux-ops-center/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/linux-ops-center/settings.py"
  install -Dm644 service_ops.py "$pkgdir/usr/lib/linux-ops-center/service_ops.py"
  install -Dm644 disk_audit.py "$pkgdir/usr/lib/linux-ops-center/disk_audit.py"
  install -Dm644 package_audit.py "$pkgdir/usr/lib/linux-ops-center/package_audit.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.LinuxOpsCenter" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/linux-ops-center/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.LinuxOpsCenter.desktop \
    "$pkgdir/usr/share/applications/org.evans.LinuxOpsCenter.desktop"
  install -Dm644 org.evans.LinuxOpsCenter.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.LinuxOpsCenter.metainfo.xml"
  install -Dm644 org.evans.LinuxOpsCenter.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.LinuxOpsCenter.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
