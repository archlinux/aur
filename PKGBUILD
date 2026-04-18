pkgname=weather-dashboard-git
pkgver=0.r0.g0000000
pkgrel=1
pkgdesc="GTK4 weather desktop app with current conditions, forecast, and saved cities"
arch=('any')
url="https://github.com/EvansOgala/weather-dashboard"
license=('MIT')
depends=(
  'python'
  'python-gobject'
  'gtk4'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/EvansOgala/weather-dashboard.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/weather-dashboard"
  install -Dm644 main.py "$pkgdir/usr/lib/weather-dashboard/main.py"
  install -Dm644 ui.py "$pkgdir/usr/lib/weather-dashboard/ui.py"
  install -Dm644 gtk_style.py "$pkgdir/usr/lib/weather-dashboard/gtk_style.py"
  install -Dm644 settings.py "$pkgdir/usr/lib/weather-dashboard/settings.py"
  install -Dm644 weather-api.py "$pkgdir/usr/lib/weather-dashboard/weather-api.py"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/org.evans.Weather" <<'LAUNCHER'
#!/bin/sh
exec /usr/bin/python3 /usr/lib/weather-dashboard/main.py "$@"
LAUNCHER

  install -Dm644 org.evans.Weather.desktop \
    "$pkgdir/usr/share/applications/org.evans.Weather.desktop"
  install -Dm644 org.evans.Weather.metainfo.xml \
    "$pkgdir/usr/share/metainfo/org.evans.Weather.metainfo.xml"
  install -Dm644 org.evans.Weather.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/org.evans.Weather.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
