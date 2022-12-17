# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=pywws
pkgver=22.10.0
pkgrel=1
pkgdesc="Python software for USB Wireless WeatherStations"
arch=('any')
url="https://github.com/jim-easterbrook/pywws"
license=('GPL')
depends=('python-tzlocal' 'python-libusb1')
optdepends=(
  'python-croniter: flexible timed tasks'
  'python-daemon: runs pywws as a proper UNIX daemon process'
  'gnuplot>=4.2: draws weather data graphs'
  'python-requests: weather service uploading'
  ## paramiko and pycrypto are co-dependents
  'python-paramiko: secure website uploading over SFTP'
  'python-pycryptodome: secure website uploading over SFTP'
  # 'python-twitter3: twitter updates' # ????
  # 'python-oauth2' ## not in AUR yet
  'python-paho-mqtt: sends weather data to an MQTT broker')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.udev")
sha256sums=('c3d2edcc2cc703039adff6a40fec21f6ad844c92afee4b6ba1f7a50a24070ecf'
            '295a6d5c213556b587d9c8067257a13333b82bb809dc3a604fb50f3187bc91f5'
            'f65e849c1b1e59384c9a57fd8ccac43722302817a82b25e3479eabf4bf802931'
            '48adb8621d7561de665987d4883568923f73bb90a71d9bc9e9d119e0b71ef047'
            '90e646e74d4c8000529324d287b9b41679c1b6ffe6b952c155fddba9f968af78')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  install -Dm644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$pkgname.sysusers"   "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.tmpfiles"   "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "$pkgname.udev"       "$pkgdir/usr/lib/udev/rules.d/$pkgname.conf"
  cd "$pkgname-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
