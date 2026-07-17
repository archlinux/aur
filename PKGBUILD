# Maintainer: Yury Gubich <blue@macaw.me>
pkgname=bluemap-telemetry
pkgver=0.3.3
pkgrel=1
pkgdesc="Minecraft RCON daemon that writes live player positions to map web roots"
arch=('any')
url="https://git.macaw.me/blue/bluemap-telemetry"
license=('MIT')
depends=('bun')
optdepends=(
  'minecraftd: provides the minecraft system user'
)
install=bluemap-telemetry.install

source=("bluemap-telemetry-$pkgver.tar.gz::https://git.macaw.me/blue/bluemap-telemetry/archive/$pkgver.tar.gz")
sha256sums=('f19ddde9c5b8715977365c79441820b8886502934f7f8f73f6e1cedd0e8b1c98')

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
  install -Dm644 "$archlinux/config.env.example" \
    "$pkgdir/etc/bluemap-telemetry/config.env.example"

  install -dm755 "$pkgdir/usr/share/bluemap-telemetry"
  cp -a datapack "$pkgdir/usr/share/bluemap-telemetry/"
  cp -a assets "$pkgdir/usr/share/bluemap-telemetry/"
}
