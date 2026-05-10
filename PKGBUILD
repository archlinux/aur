# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=murmur
pkgver=0.1.9
pkgrel=1
pkgdesc='A native, opinionated IRC client. Subtle by default. IRCv3-ready.'
arch=('x86_64' 'aarch64')
url='https://github.com/prietus/murmur'
license=('MIT')
depends=(
  'libxkbcommon'
  'fontconfig'
  'freetype2'
  'vulkan-icd-loader'
  'wayland'
)
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/prietus/murmur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3fa54b9c56851389be293cd409b4887efcd0289b7d0f40336e40f86a79f4c3c0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/linux/murmur.desktop \
    "$pkgdir/usr/share/applications/murmur.desktop"
  install -Dm644 assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/murmur.svg"
}
