# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=appimage-thumbnailer
pkgver=5.0.0
pkgrel=1
pkgdesc="Generates AppImage thumbnails for Linux desktops"
arch=('x86_64' 'aarch64')
url="https://github.com/kem-a/appimage-thumbnailer"
license=('MIT')
depends=(
  'glibc'
  'libgcc'
  'zstd'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e8a65c27350914be5a807c59da3df2a1d8a0da7b61827eca402a10259c1bde4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export ZSTD_SYS_USE_PKG_CONFIG=1
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX='/usr' DESTDIR="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
