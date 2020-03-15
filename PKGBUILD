# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=aur-thumbsup
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to manage voting for favorite AUR packages (including systemd service for auto vote)"
arch=('x86_64')
url="https://github.com/bpetlert/aur-thumbsup"
license=('MIT')
depends=('gawk' 'grep' 'pacman' 'systemd')
makedepends=('cargo' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4148d6d601c09dfa3203034a655e990db9e522189496437139c5f576ec3044c5')

build() {
  cd "${pkgname}-${pkgver}"

  # Ignore target-dir in ~/.cargo/config, reset it to default: "target".
  cargo build --release --locked --target-dir target
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/aur-thumbsup" "$pkgdir/usr/bin/aur-thumbsup"

  install -Dm644 "aur-thumbsup.service" "$pkgdir/usr/lib/systemd/system/aur-thumbsup.service"
  install -Dm644 "aur-thumbsup.timer" "$pkgdir/usr/lib/systemd/system/aur-thumbsup.timer"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
