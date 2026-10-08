# Maintainer: trougnouf <trougnouf@disroot.org>
# Upstream: https://github.com/trougnouf/openwood
# NOTE: regenerate .SRCINFO before uploading to the AUR:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=openwood-git
pkgver=r10.30bafa9
pkgrel=1
pkgdesc="Control a Charnwood E-series stove (Aire 300) over BLE: CLI + MQTT bridge with Home Assistant discovery"
arch=(any)
url="https://github.com/trougnouf/openwood"
license=("GPL-3.0-or-later")
makedepends=(git python-build python-installer python-wheel python-setuptools)
depends=(python python-bleak)
optdepends=(
  "python-paho-mqtt: MQTT bridge for Home Assistant (1.6 or 2.x)"
  "mosquitto: MQTT broker, if Home Assistant does not have one yet"
)
provides=(openwood)
conflicts=(openwood)
backup=(etc/openwood/mqtt.env)
source=("git+https://github.com/trougnouf/openwood.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/openwood"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/openwood"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/openwood"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # systemd service + service user + default config
  install -Dm644 packaging/systemd/openwood-mqtt.service \
    "$pkgdir/usr/lib/systemd/system/openwood-mqtt.service"
  install -Dm644 packaging/systemd/openwood.sysusers.conf \
    "$pkgdir/usr/lib/sysusers.d/openwood.conf"
  install -Dm644 packaging/systemd/mqtt.env \
    "$pkgdir/etc/openwood/mqtt.env"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
