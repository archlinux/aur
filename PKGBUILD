# Maintainer: OuinOuin74 ouinouin@ouinouin.eu
pkgname=steamos-manager-hhd-bridge
pkgver=0.2.3
pkgrel=2
pkgdesc="D-Bus remote bridge letting vanilla steamos-manager control TDP and GPU clock through Handheld Daemon"
arch=('x86_64')
url='https://github.com/OuinOuin74/hhd-steamos-bridge'
license=('MIT')
depends=('gcc-libs' 'hhd' 'steamos-manager')
makedepends=('cargo')
install=$pkgname.install
source=("${pkgname}::git+https://github.com/OuinOuin74/hhd-steamos-bridge.git#tag=v${pkgver}")
sha256sums=('a650f6c6078266cec84a0327511aa77acaff66eafc88e26fd322c2e884dd7c32')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  sed -i 's|ExecStart=/usr/local/bin/|ExecStart=/usr/bin/|' dist/hhd-steamos-bridge.service
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 dist/hhd.toml \
    "$pkgdir/usr/share/steamos-manager/remotes.d/hhd.toml"

  install -Dm644 dist/hhd-steamos-bridge.service \
    "$pkgdir/usr/lib/systemd/user/$pkgname.service"

  install -Dm644 dist/com.steampowered.HhdBridge.conf \
    "$pkgdir/usr/share/doc/$pkgname/com.steampowered.HhdBridge.conf.example"
    
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
