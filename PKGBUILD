# Maintainer: Alexander Pohl <alex@ahpohl.com>

pkgname=smartmeter-gateway
pkgver=1.0.7
pkgrel=1
arch=('x86_64' 'aarch64')
pkgdesc="Protocol gateway for domestic meter telemetry"
url="https://github.com/ahpohl/smartmeter-gateway"
license=('MIT')
makedepends=('cmake' 'git' 'pkgconf')
depends=('libmodbus' 'yaml-cpp' 'nlohmann-json' 'spdlog' 'cli11' 'mosquitto' 'fmt')
source=(
  "$pkgname-$pkgver::git+https://github.com/ahpohl/$pkgname.git#tag=v${pkgver}"
  "sysusers-meter.conf"
  "smartmeter-gateway.service"
)
sha256sums=('3d8ae5e2f95fa6ac4f5d96337623b3cde4a54785e29be0d7c1ac1f33aeef68f3'
            'ceb25291231fff17ab14840233f700878897bd74d7749bed3345d6e46d4f4f24'
            'b6695bf8190bf81047908b85ae4950839f4e6eedd91fe58c7890c2b9eceae565')
backup=('etc/smartmeter-gateway/config.yaml')

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

