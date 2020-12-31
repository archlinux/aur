# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=0.4.0
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
sha256sums=('8736ca83f10f871c33916a15839769d9f4388af7ecb3debd05a17b1aed104f8b')

build() {
  cd "${pkgname}-${pkgver}"

  # Ignore target-dir in ~/.cargo/config.toml, reset it to default: "target".
  cargo build --release --locked --target-dir=target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-mirrorup" "$pkgdir/usr/bin/pacman-mirrorup"

  install -Dm644 "pacman-mirrorup.service" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.service"
  install -Dm644 "pacman-mirrorup.timer" "$pkgdir/usr/lib/systemd/system/pacman-mirrorup.timer"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
