# Maintainer: Gerhard Schwanzer <geri@sdf.org>

pkgname=freecut
pkgver=2.0.0
pkgrel=1
pkgdesc='Free and open source cut optimizer for editable rectangular panel layouts'
arch=('x86_64')
url='https://github.com/geri1701/freecut'
license=('Apache-2.0')
options=('!debug')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libgl'
  'libx11'
  'libxcursor'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'wayland'
)
makedepends=(
  'cargo'
  'desktop-file-utils'
  'pkgconf'
  'wayland-protocols'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  'freecut.desktop'
)
sha256sums=(
  '94b4b817a0199b4d11b3f5ac53d9d04759bf13fb74719ecc533c55c6f43c7309'
  'd612e3f31a2bed00228b2f717bf0bb67139309113efbf53dae9e8ee64f0bbfaa'
)

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo build --release --locked
}

check() {
  desktop-file-validate "$srcdir/freecut.desktop"

  cd "$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CREDITS.md "$pkgdir/usr/share/doc/$pkgname/CREDITS.md"
  install -Dm644 docs/architecture.md "$pkgdir/usr/share/doc/$pkgname/architecture.md"
  install -Dm644 docs/csv-import-schema.md "$pkgdir/usr/share/doc/$pkgname/csv-import-schema.md"
  install -Dm644 docs/requirements.md "$pkgdir/usr/share/doc/$pkgname/requirements.md"
  install -Dm644 assets/freecut-logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

  cd "$srcdir"
  install -Dm644 freecut.desktop "$pkgdir/usr/share/applications/freecut.desktop"
}
