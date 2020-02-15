# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=0.3.0
pkgrel=1
pkgdesc="A service to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('MIT')
depends=('systemd')
makedepends=('rust' 'cargo')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0009c8538a863280aa68fd89caf51a714acc3017f4ebdd80712c25a8a5eae482')

build() {
  cd "${pkgname}-${pkgver}"

  # Ignore target-dir in ~/.cargo/config, reset it to default: "target".
  cargo build --release --locked --target-dir target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-mirrorup" "$pkgdir/usr/bin/pacman-mirrorup"

  install -Dm644 "pacman-mirrorup.service" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.service"
  install -Dm644 "pacman-mirrorup.timer" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.timer"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
