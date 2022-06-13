# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=moonraker-git
pkgver=r1375.a8b9fc0
pkgrel=2
pkgdesc="HTTP frontend for Klipper 3D printer firmware"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPL3')
depends=(klipper
         python-tornado
         python-pillow
         python-pyserial-asyncio
         python-lmdb
         python-streaming-form-data
         python-distro
         python-inotify-simple
         python-libnacl
         python-paho-mqtt
         python-pycurl
         python-zeroconf
         python-jinja
         python-dbus-next
         libgpiod)
makedepends=(git)
optdepends=("polkit: enable service and machine control through moonraker"
            "python-preprocess-cancellation: enables exclude object processing"
            "python-apprise: enable [notifier] module for sending notifications"
            "python-ldap3: [authorization] using LDAP")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/klipper/moonraker.conf')
source=('git+https://github.com/Arksine/moonraker.git#branch=master' 'moonraker.conf' 'moonraker.service' 'moonraker.rules' 'sysusers.conf' 'tmpfiles.conf' 'moonraker-klipper.cfg')
sha256sums=('SKIP'
            'd7ecdfbe5ec156f98277f7f3f8f13807e7d81f47d33a075936af3915407caf54'
            'b47549a8b888018b03bf41c9b6ccabf8c9e15d3b00a98bd21af85e9b4ec77f5c'
            'cef040e973a9bb697659d1506a37a5f829551d5cc96e3f81ff588d5bd67cf1d0'
            '549309fd129c8c665a5aed2d4229c20e5a9927f4fbdc937e0982db4785b9ee0d'
            '7b908a1c3e0b56523d27db5283e2f546f93051fe855cc949635fafa37ba2f416'
            'caa868a447ab94bd3e5f86cdf70e5deeb17b233077d94a424a682dfe49349a96')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  python -m compileall -o 0 -o 1 moonraker # emulate typical setup.py output
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm644 "$srcdir/moonraker.conf" "$pkgdir/etc/klipper/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonraker.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
  install -Dm644 "$srcdir/moonraker-klipper.cfg" "$pkgdir/usr/share/doc/moonraker/moonraker-klipper.cfg"

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 0750 "$pkgdir"/usr/share/polkit-1/rules.d
  install -Dm644 "$srcdir/moonraker.rules" "$pkgdir/usr/share/polkit-1/rules.d/moonraker.rules"

  install -dm755 "$pkgdir/opt/moonraker"
  GLOBIGNORE=.git cp -r * "$pkgdir/opt/moonraker"
}
