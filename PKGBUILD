pkgname=disk-health-monitor-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 SMART and NVMe disk health monitor with trend tracking"
arch=('any')
url="https://github.com/EvansOgala/disk-health-monitor"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
  'smartmontools'
  'nvme-cli'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/disk-health-monitor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/disk-health-monitor"
  install -Dm644 main.py "$pkgdir/usr/lib/disk-health-monitor/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/disk-health-monitor/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/disk-health-monitor/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/disk-health-monitor/settings.py"
  install -Dm644 disk_ops.py "$pkgdir/usr/lib/disk-health-monitor/disk_ops.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.DiskHealthMonitor" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/disk-health-monitor/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.DiskHealthMonitor.desktop \
    "$pkgdir/usr/share/applications/org.evans.DiskHealthMonitor.desktop"
  install -Dm644 org.evans.DiskHealthMonitor.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.DiskHealthMonitor.metainfo.xml"
  install -Dm644 org.evans.DiskHealthMonitor.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.evans.DiskHealthMonitor.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
