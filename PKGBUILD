# Maintainer: trougnouf <trougnouf@disroot.org>
# Upstream: https://github.com/trougnouf/openwood
# NOTE: regenerate .SRCINFO before uploading to the AUR:
#   makepkg --printsrcinfo > .SRCINFO

pkgname=openwood-git
pkgver=r30.3eac734
pkgrel=2
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
install=openwood-git.install
source=("git+https://github.com/trougnouf/openwood.git" "openwood-git.install")
sha256sums=("SKIP" "SKIP")

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

  # mosquitto must start after docker, or a `listener 1883 172.17.0.1`
  # line in mosquitto.conf kills it at boot (docker0 does not exist yet).
  # Harmless without docker/mosquitto; see the file header.
  install -Dm644 packaging/systemd/mosquitto-docker0.conf \
    "$pkgdir/usr/lib/systemd/system/mosquitto.service.d/openwood-docker0.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
