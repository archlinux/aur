# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>

pkgname=pywws
pkgver=22.3.0
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
  'python-pycrypto: secure website uploading over SFTP'
  # 'python-twitter3: twitter updates' # ????
  # 'python-oauth2' ## not in AUR yet
  'python-paho-mqtt: sends weather data to an MQTT broker')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles"
        "$pkgname.udev")
sha256sums=('29b924a6cc471c99ab3f950ff216c20fc1f2ea055ab5b65f1db22084bcabc413'
            '295a6d5c213556b587d9c8067257a13333b82bb809dc3a604fb50f3187bc91f5'
            'f65e849c1b1e59384c9a57fd8ccac43722302817a82b25e3479eabf4bf802931'
            'edf31725feb47cb928f5c676b27d2fcc97288a07ca1ccf4d51571ea4d47b9065'
            '90e646e74d4c8000529324d287b9b41679c1b6ffe6b952c155fddba9f968af78')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  install -Dm 644 "$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm 644 "$pkgname.sysusers"   "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 "$pkgname.tmpfiles"   "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm 644 "$pkgname.udev"       "$pkgdir/usr/lib/udev/rules.d/$pkgname.conf"
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
