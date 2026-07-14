# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=bluemap-telemetry
pkgver=0.1.0
pkgrel=1
pkgdesc="Minecraft RCON daemon that writes live player positions to map web roots"
arch=('x86_64')
url="https://git.macaw.me/blue/bluemap-telemetry"
license=('MIT')
makedepends=('bun')
install=bluemap-telemetry.install

source=("bluemap-telemetry-$pkgver.tar.gz::https://git.macaw.me/blue/bluemap-telemetry/archive/$pkgver.tar.gz")
sha256sums=('2a02fc39cfdcee7375f0b3f5c23eee8bdf2cd980828dbf7845dec6f9a0a58e28')

build() {
  cd "$srcdir/bluemap-telemetry"
  bun install
  bun build --compile --minify --target=bun-linux-x64 src/main.ts --outfile bluemap-telemetry
}

package() {
  local archlinux="$srcdir/bluemap-telemetry/packaging/Archlinux"

  cd "$srcdir/bluemap-telemetry"

  install -Dm755 bluemap-telemetry "$pkgdir/usr/bin/bluemap-telemetry"

  install -Dm644 "$archlinux/bluemap-telemetry.service" \
    "$pkgdir/usr/lib/systemd/system/bluemap-telemetry.service"
  install -Dm644 "$archlinux/bluemap-telemetry.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/bluemap-telemetry.conf"
  install -Dm644 "$archlinux/config.env.example" \
    "$pkgdir/etc/bluemap-telemetry/config.env.example"
}
