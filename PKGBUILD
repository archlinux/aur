# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgname=fronius-bridge
pkgver=1.0.5
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Lightweight Modbus-to-MQTT bridge for Fronius inverters"
url="https://github.com/ahpohl/fronius-bridge"
license=('MIT')
makedepends=('cmake' 'git' 'pkgconf')
depends=('libfronius' 'yaml-cpp' 'nlohmann-json' 'spdlog' 'cli11' 'mosquitto' 'fmt')
source=(
  "$pkgname-$pkgver::git+https://github.com/ahpohl/fronius-bridge.git#tag=v${pkgver}"
  "sysusers-fronius.conf"
  "fronius-bridge.service"
)
sha256sums=('037bcde7f17083fb447d0b934f225535c65ebd7cf5b7e3a89da99789a4877404'
            'f93532f32babcf1c4cce79a1bfc49cca702e1cfd41267d6b580181af277009f2'
            '5047953f514a345441fb69ee5c60e79acf7ccb387d206ae7d0e11a2550683060')
backup=('etc/fronius-bridge/config.yaml')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$pkgbase-$pkgver"
  cmake --install build --prefix "${pkgdir}/usr"

  # License
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Readme
  install -d "$pkgdir/usr/share/doc/$pkgbase"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgbase/README.md"

  # Config file
  install -d "$pkgdir/etc/$pkgbase"
  install -Dm644 "config.yaml" "$pkgdir/etc/$pkgbase/config.yaml"

  # Systemd service
  install -Dm644 "$srcdir/fronius-bridge.service" \
    "$pkgdir/usr/lib/systemd/system/fronius-bridge.service"

  # Create fronius user
  install -Dm644 "$srcdir/sysusers-fronius.conf" "$pkgdir/usr/lib/sysusers.d/fronius-bridge.conf"
}

post_install() {
  systemd-sysusers fronius-bridge.conf >/dev/null 2>&1 || true
}
post_upgrade() {
  post_install
}

