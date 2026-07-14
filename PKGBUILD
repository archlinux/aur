# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=bluemap-telemetry
pkgver=0.1.1
pkgrel=1
pkgdesc="Minecraft RCON daemon that writes live player positions to map web roots"
arch=('any')
url="https://git.macaw.me/blue/bluemap-telemetry"
license=('MIT')
depends=('bun')
install=bluemap-telemetry.install

source=("bluemap-telemetry-$pkgver.tar.gz::https://git.macaw.me/blue/bluemap-telemetry/archive/$pkgver.tar.gz")
sha256sums=('f0ce23114d7bb5d8e5ecfc3df01848b68e8c8b0be77126b9b24c61aa8f2299a7')

build() {
  cd "$srcdir/bluemap-telemetry"
  bun install --production
}

package() {
  local archlinux="$srcdir/bluemap-telemetry/packaging/Archlinux"

  cd "$srcdir/bluemap-telemetry"

  install -dm755 "$pkgdir/usr/lib/bluemap-telemetry"
  cp -a src "$pkgdir/usr/lib/bluemap-telemetry/"
  install -Dm644 package.json "$pkgdir/usr/lib/bluemap-telemetry/"
  cp -a node_modules "$pkgdir/usr/lib/bluemap-telemetry/"

  install -Dm644 "$archlinux/bluemap-telemetry.service" \
    "$pkgdir/usr/lib/systemd/system/bluemap-telemetry.service"
  install -Dm644 "$archlinux/bluemap-telemetry.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/bluemap-telemetry.conf"
  install -Dm644 "$archlinux/config.env.example" \
    "$pkgdir/etc/bluemap-telemetry/config.env.example"
}
