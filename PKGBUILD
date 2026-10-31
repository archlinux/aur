# Maintainer: Vladimir Tsanev <tsachev at gmail dot com>
# Slimbook service: performance-mode notifications, ppd/EC profile sync, touchpad lock.
# Source: upstream commit 2f6a2f6 (Debian release branch debian/resolute, 1.0.16, adds only debian/*). Upstream has no tags.
pkgname=slimbook-service
pkgver=1.0.16
pkgrel=1
pkgdesc="Slimbook service: performance-mode notifications, ppd/EC profile sync, touchpad lock"
arch=('any')
url="https://github.com/Slimbook-Team/slimbook_service"
license=('GPL-3.0-or-later')
depends=('python' 'python-slimbook' 'libslimbook' 'python-gobject' 'python-dbus' 'python-evdev'
         'python-pyzmq' 'python-requests' 'python-feedparser' 'python-pyudev' 'python-dateutil'
         'gtk4' 'libadwaita' 'libnotify' 'adwaita-icon-theme' 'power-profiles-daemon')
optdepends=('qc71-laptop-slimbook-dkms: EC performance mode, fans and fn-lock on QC71 models (e.g. EVO15)')
makedepends=('git' 'gettext')
source=("$pkgname::git+$url.git#commit=2f6a2f67a40eb46962a3b1646059446f5a840ef6")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  for locale in es ca ru ast; do
    msgfmt "slimbook/usr/share/slimbook/locale-langpack/$locale/LC_MESSAGES/slimbook.po" \
      -o "slimbook/usr/share/slimbook/locale-langpack/$locale/LC_MESSAGES/slimbook.mo"
  done
}

package() {
  cd "$pkgname"
  install -d "$pkgdir/usr/share/slimbook"
  cp -a slimbook/usr/share/slimbook/. "$pkgdir/usr/share/slimbook/"
  # the .po sources are not needed at runtime
  find "$pkgdir/usr/share/slimbook" -name '*.po' -delete

  install -Dm644 slimbook/usr/share/slimbook/slimbook-indicator.desktop \
    "$pkgdir/usr/share/applications/slimbook-indicator.desktop"
  cp -a slimbook/usr/share/icons "$pkgdir/usr/share/"
  install -Dm755 slimbook/bin/slimbookindicator "$pkgdir/usr/bin/slimbookindicator"

  install -Dm644 slimbook-service.service "$pkgdir/usr/lib/systemd/system/slimbook-service.service"
  install -Dm644 90-slimbook-service.preset "$pkgdir/usr/lib/systemd/system-preset/90-slimbook-service.preset"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
