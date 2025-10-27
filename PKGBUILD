# Maintainer: Hannele Ruiz <justlemoncl [at] gmail [dot] com>
# Contributor: Wilhelm Schuster <aur [at] rot13 [dot] io>

_pkgname=moonraker
pkgname="${_pkgname}-git"
pkgver=0.9.3.r123.g8426f41
pkgrel=2
pkgdesc="HTTP frontend for Klipper 3D printer firmware"
arch=(any)
url="https://github.com/Arksine/moonraker"
license=('GPL3')
depends=(klipper
         python-tornado
         python-importlib-metadata
         python-pillow
         python-pyserial-asyncio
         python-lmdb
         python-streaming-form-data
         python-distro
         python-inotify-simple
         python-libnacl
         python-paho-mqtt
         python-jinja
         python-dbus-fast
         python-periphery
         curl)
#checkdepends=("python-pytest>=7.0" python-pytest-asyncio python-pytest-timeout)
makedepends=(git python-build python-installer python-wheel python-pdm python-pdm-backend)
optdepends=("polkit: enable service and machine control through moonraker"
            "apprise: enables the [notifier] module for sending notifications"
            "python-preprocess-cancellation: enables exclude object processing"
            "python-libcamera: enables webcam detection"
            "python-ldap3: [authorization] using LDAP"
            "python-msgspec: optional speedup"
            "python-uvloop: optional speedup"
            "python-zeroconf: enable zeroconf announcements"
            "wireless_tools: network detection")
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=('etc/klipper/moonraker.conf' 'var/opt/moonraker/systemd/moonraker.env')
install=moonraker.install
source=('git+https://github.com/Arksine/moonraker.git#branch=master' 'moonraker.install' 'moonraker.conf' 'moonraker.service' 'moonraker.env' 'moonraker.rules' 'sysusers.conf' 'tmpfiles.conf' 'moonraker-klipper.cfg')
sha256sums=('SKIP'
            'b118f346ec57228add79b9c37555adc5dbae4cb6de0e39659912376b5ad2e932'
            '16ac5116ff18e67b7334cf9baf4c404734aede0b1d56d5bed8bde90fbd926e8c'
            '80411ae57512e32d391e40c73d56877b6c76cca1fe393c16ab1987a7a35cb5b5'
            '5611f1a48bb18d0d95a31eaead4f59d84c0ae5e3c407f3488770e2236b97c3bf'
            'cef040e973a9bb697659d1506a37a5f829551d5cc96e3f81ff588d5bd67cf1d0'
            '96275f40a9627f9069fa0fd7a84d17f08de47d49ae66a666c59b9448cc99de67'
            '5106762365d6275a514897f5a6b42b2b08cbe941732670ac031d4f842679832b'
            'b6c35114ab2886acbd9168bb4588c86d3baea91ab38eda67b5ef38327cd7b11f')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's/"pdm-backend<=2.4.4"/"pdm-backend"/' pyproject.toml
}

build() {
  cd "$srcdir/$_pkgname"

  # clean wheel before build to prevent subsequent package() runs from erroring
  # due to `dist/*.whl` expanding to multiple files (which `python -m install`
  # doesn't support)
  rm -f dist/*.whl

  python -m build --wheel --no-isolation
}

#check() {
#  cd "$srcdir/$_pkgname"
#  pytest
#}

package() {
  cd "$srcdir/$_pkgname"

  python -m venv --system-site-packages --without-pip "$pkgdir/opt/$_pkgname"

  "$pkgdir/opt/$_pkgname/bin/python" -m installer --destdir="${pkgdir}" --prefix="/opt/$_pkgname" dist/*.whl

  # fix dangling references to $pkgdir
  sed -i "s|$pkgdir/opt/$_pkgname|/opt/$_pkgname|" "$pkgdir/opt/$_pkgname"/pyvenv.cfg
  find "$pkgdir/opt/$_pkgname/bin" \! -name "python*" -type f -exec sed -i "s|$pkgdir/opt/$_pkgname|/opt/$_pkgname|" '{}' +

  install -Dm644 "$srcdir/moonraker.conf" "$pkgdir/etc/klipper/moonraker.conf"
  install -Dm644 "$srcdir/moonraker.service" "$pkgdir/usr/lib/systemd/system/moonraker.service"
  install -Dm644 "$srcdir/moonraker.env" "$pkgdir/var/opt/moonraker/systemd/moonraker.env"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/moonraker.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/moonraker.conf"
  install -Dm644 "$srcdir/moonraker-klipper.cfg" "$pkgdir/usr/share/doc/moonraker/moonraker-klipper.cfg"
  install -Dm644 "$srcdir/moonraker.rules" "$pkgdir/usr/share/polkit-1/rules.d/moonraker.rules"
}
