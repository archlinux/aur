# Maintainer: totti786
pkgname=mpris-bridge
pkgver=1.0.0
pkgrel=1
pkgdesc="Publishes Firefox media tabs as MPRIS players (native-messaging helper for the MPRIS Bridge extension)"
arch=('x86_64' 'aarch64')
url="https://github.com/totti786/mpris-bridge"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!debug')
optdepends=('firefox: the browser the extension runs in')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d68c4d9b8efb7d05beaf6d5fe268ec1c5dedcac69c7e9c173ee8517590664d66')

build() {
  cd "$pkgname-$pkgver/host"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 host/target/release/mpris-bridge-host "$pkgdir/usr/lib/$pkgname/mpris-bridge-host"
  install -d "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
  cat > "$pkgdir/usr/lib/mozilla/native-messaging-hosts/mpris_bridge.json" <<JSON
{
  "name": "mpris_bridge",
  "description": "MPRIS Bridge helper: publishes browser media tabs as MPRIS players",
  "path": "/usr/lib/$pkgname/mpris-bridge-host",
  "type": "stdio",
  "allowed_extensions": ["mpris-bridge@totti786.github.io"]
}
JSON
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
