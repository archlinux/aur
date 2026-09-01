# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=okuri
pkgver=0.1.0
pkgrel=1
pkgdesc="Dead-simple file transfer for Omarchy & Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/okuri"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'gcc-libs' 'glibc')
makedepends=('cargo' 'qt6-base' 'qt6-declarative')
# The QML is compiled ahead of time against whichever Qt is installed when this is built, so an
# install picks up the Qt of the day. Nothing rebuilds it later — the AUR has no build farm, and
# a Qt minor bump leaves the soname alone, so checkrebuild will not spot it either. If a Qt
# release ever does break the compiled QML, it takes a pkgrel bump here, same as the -bin one.
#
# !lto because makepkg's -flto=auto hands GCC-LTO objects to the C++ glue cxx-qt generates,
# which the linker Rust drives cannot read.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('68a4c8051cee8aadad2a2a771d07e9415bf7dbf6cbf1f53481809641d2c045de')

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
