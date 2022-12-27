# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=moonraker-git
pkgver=r1579.358aee9
pkgrel=1
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
         python-jinja
         python-dbus-next
         libgpiod)
#checkdepends=("python-pytest>=7.0" python-pytest-asyncio python-pytest-timeout)
makedepends=(git)
optdepends=("polkit: enable service and machine control through moonraker"
            "python-preprocess-cancellation: enables exclude object processing"
            "python-apprise: enable [notifier] module for sending notifications"
            "python-ldap3: [authorization] using LDAP"
            "python-zeroconf: enable zeroconf announcements"
            "wireless_tools: network detection")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/klipper/moonraker.conf')
install=moonraker.install
source=('git+https://github.com/Arksine/moonraker.git#branch=master' 'moonraker.install' 'moonraker.conf' 'moonraker.service' 'moonraker.env' 'moonraker.rules' 'sysusers.conf' 'tmpfiles.conf' 'moonraker-klipper.cfg')
sha256sums=('SKIP'
            'b118f346ec57228add79b9c37555adc5dbae4cb6de0e39659912376b5ad2e932'
            '85855665ec1ff10c95529f456d8b00314d8909db4d83be48bb76d0fc2a5fd3d0'
            'd99c172a24e166b724bb0603a8909f2137a75b7e0d1cf9c883d9300f2a29f382'
            '5611f1a48bb18d0d95a31eaead4f59d84c0ae5e3c407f3488770e2236b97c3bf'
            'cef040e973a9bb697659d1506a37a5f829551d5cc96e3f81ff588d5bd67cf1d0'
            '549309fd129c8c665a5aed2d4229c20e5a9927f4fbdc937e0982db4785b9ee0d'
            'ee763cc109210583c21006054730f1b2422d705b03f2bb04017aab8441039a9b'
            'b6c35114ab2886acbd9168bb4588c86d3baea91ab38eda67b5ef38327cd7b11f')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  python -m compileall -o 0 -o 1 moonraker # emulate typical setup.py output
}

#check() {
#  cd "$srcdir/$_pkgname"
#  pytest
#}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm644 "$srcdir/moonraker.conf" "$pkgdir/etc/klipper/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/moonraker.env" "$pkgdir/var/opt/moonraker/systemd/moonraker.env"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonraker.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
  install -Dm644 "$srcdir/moonraker-klipper.cfg" "$pkgdir/usr/share/doc/moonraker/moonraker-klipper.cfg"

  # match directory owner/group and mode from [extra]/polkit
  install -d -o root -g 102 -m 0750 "$pkgdir"/usr/share/polkit-1/rules.d
  install -Dm644 "$srcdir/moonraker.rules" "$pkgdir/usr/share/polkit-1/rules.d/moonraker.rules"

  install -dm755 "$pkgdir/opt/moonraker"
  GLOBIGNORE=.git cp -r * "$pkgdir/opt/moonraker"
}
