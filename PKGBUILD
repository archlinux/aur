# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=syngestures
_pkgname=syngesture
pkgver=1.0.1
pkgrel=3
pkgdesc="Swipes and gestures for Linux with the MT multitouch protocol"
arch=('any')
url="https://github.com/mqudsi/syngesture"
license=('MIT')
makedepends=('cargo')
depends=('evtest')
optdepends=("wmctrl: needed for syngestures-switch-ws for X11 and Wayland compatible workspace switching"
            "xdotool: simulates keyboard and mouse actions for Xorg or XWayland based apps")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.toml"
        "$pkgname-switch-ws")
sha256sums=('3b187ef32818427490e422925dc6c30cf2ab05649a94a14a568b70ac2fc177c2'
            '244d8dc40c0bb6eea28a05c22b4a6950bbf0ecfc358cbc4c1500aae805f87883'
            '56496557c63baa472dc426ee0215c80b63859983bc6977078e34266bda5fce7b'
            '587366d03b3e70f8cbdd78f557bdf5191ff9937f9f86afa0d7ff78c490b015d8')
backup=("usr/local/etc/$pkgname.toml")

prepare() {
  cd $_pkgname-$pkgver
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $_pkgname-$pkgver

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  install -Dm644 $pkgname.toml -t "$pkgdir/usr/local/etc"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $_pkgname-$pkgver/README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 $_pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 $pkgname-switch-ws -t "$pkgdir/usr/bin"
  install -Dm755 $_pkgname-$pkgver/target/release/$pkgname -t "$pkgdir/usr/bin"
}
