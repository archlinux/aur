# Maintainer: Sykik <xo.sykik@gmail.com>
pkgname=inno
pkgver=0.5.0
pkgrel=1
pkgdesc="A lightweight, event-driven Wayland notification agent"
arch=('x86_64')
url="https://github.com/SykikXO/inno"
license=('MIT')
# pipewire-pulse supplies paplay and the sound server itself; without it
# every sound path is dead on a bare system.
depends=('wayland' 'cairo' 'dbus' 'glibc' 'pipewire-pulse')
makedepends=('rust>=1.85' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('sha256:62a2c1b0035d9bc969e1505ac2145c24de6f48c634ae6ec86f6cacbd119bfdb5')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/inno "${pkgdir}/usr/bin/inno"
  install -Dm644 inno.toml "${pkgdir}/etc/xdg/inno/inno.toml"
  for f in events/*.toml; do
    install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
  done
  install -Dm644 inno.service "${pkgdir}/usr/lib/systemd/user/inno.service"
  for f in assets/sounds/*.wav; do
    [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
  done
  # Frame animations referenced by the shipped config. Without these
  # --check-config fails on a packaged install.
  for d in assets/animations/*/; do
    [ -d "$d" ] || continue
    for f in "$d"*.png; do
      [ -f "$f" ] && install -Dm644 "$f" "${pkgdir}/etc/xdg/inno/${f}"
    done
  done
}
