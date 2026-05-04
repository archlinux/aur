# Maintainer: Carlos Prieto <cprieto.ortiz@gmail.com>
pkgname=murmur
pkgver=0.1.4
pkgrel=1
pkgdesc='A native, opinionated IRC client. Subtle by default.'
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
sha256sums=('b5010a3710f02784e626020ac130a2a78a7c66c098a1084aa795a34a08f2a55d')

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
