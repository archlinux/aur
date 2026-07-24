# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgname=fronius-bridge
pkgver=1.5.10
pkgrel=3
arch=('x86_64' 'aarch64')
pkgdesc="Lightweight Modbus-to-MQTT bridge for Fronius devices"
url="https://github.com/ahpohl/fronius-bridge"
license=('MIT')
makedepends=('cmake' 'git' 'pkgconf')
depends=('libfronius' 'yaml-cpp' 'nlohmann-json' 'spdlog' 'cli11' 'mosquitto' 'fmt' 'postgresql-libs')
source=(
  "$pkgname-$pkgver::git+https://github.com/ahpohl/$pkgname.git#tag=v${pkgver}"
  "sysusers-meter.conf"
  "fronius-bridge.service"
)
sha256sums=('bf0319002ab64a53c4fc4d7f4f8d013f58a63c0056e3079092759469ab263592'
            'ceb25291231fff17ab14840233f700878897bd74d7749bed3345d6e46d4f4f24'
            '50f81682ebd9fb41380201ff285af15906c2d6b4ece16c264cd029a6449cdb77')
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
  install -Dm644 "$srcdir/$pkgname.service" \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # Create fronius user
  install -Dm644 "$srcdir/sysusers-meter.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

post_install() {
  systemd-sysusers $pkgname.conf >/dev/null 2>&1 || true
}
post_upgrade() {
  post_install
}

