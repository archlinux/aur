# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgname=fronius-bridge
pkgver=1.5.5
pkgrel=1
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
sha256sums=('c2b5bffb39c93a3982697cb8c2feac0232f6793fce75c66644168a1e8e010a81'
            'ceb25291231fff17ab14840233f700878897bd74d7749bed3345d6e46d4f4f24'
            '9b07ac29013a6548f1ed08a8aa9565084ef273653444a5f4a5192c4389206bb9')
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

