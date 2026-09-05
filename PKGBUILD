# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=okuri
pkgver=0.2.0
pkgrel=1
pkgdesc="Dead-simple file transfer for Omarchy & Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/okuri"
license=('MIT')
depends=('gtk4>=4.12' 'libadwaita>=1.5' 'gcc-libs' 'glibc')
makedepends=('cargo' 'pkgconf')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('46657b462bd99e298e8079b6baa59c5c46893ce0f0cf15a5eaf764bed945b9b9')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --package "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "packaging/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 48 64 128 256; do
    install -Dm644 "assets/icons/$pkgname-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
}
