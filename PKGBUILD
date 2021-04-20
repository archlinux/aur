# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>
pkgname=moonraker-git
pkgver=r573.2c078cb
pkgrel=1
pkgdesc="HTTP frontend for Klipper 3D printer firmware"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPLv3')
depends=(klipper
         python-tornado
         python-pillow
         python-pyserial
         python-lmdb
         python-streaming-form-data
         libgpiod)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/klipper/moonraker.conf')
source=('git+https://github.com/Arksine/moonraker.git#branch=master' 'moonraker.conf' 'moonraker.service' 'tmpfiles.conf' 'moonraker-klipper.cfg')
sha256sums=('SKIP'
            'c98047840f074f7269e8fd8e8476566f9a0d4c43359b3bac81a03d2c7972b83d'
            '079711d571f950a5dc7dc3b48d59e3f13947db92a22753936e2e2f5c828fbee6'
            '7b908a1c3e0b56523d27db5283e2f546f93051fe855cc949635fafa37ba2f416'
            'caa868a447ab94bd3e5f86cdf70e5deeb17b233077d94a424a682dfe49349a96')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm644 "$srcdir/moonraker.conf" "$pkgdir/etc/klipper/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
  install -Dm644 "$srcdir/moonraker-klipper.cfg" "$pkgdir/usr/share/doc/moonraker/moonraker-klipper.cfg"

  install -dm755 "$pkgdir/opt/moonraker"
  GLOBIGNORE=.git cp -r * "$pkgdir/opt/moonraker"
}
