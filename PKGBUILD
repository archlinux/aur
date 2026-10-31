# Maintainer: Jeremy Attali <contact@jtheoof.me>

pkgname=squirrel-disk
_pkgname=squirreldisk
pkgver=2.6.1
pkgrel=1
pkgdesc='Fast, cross-platform disk usage analyzer with an animated sunburst (native Rust rewrite)'
arch=('x86_64')
url='https://github.com/adileo/squirreldisk'
license=('AGPL-3.0-only')
depends=(
  'alsa-lib'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libglvnd'
  'libx11'
  'libxkbcommon'
  'wayland'
)
makedepends=('cargo')
optdepends=(
  'rclone: scan cloud storage and SSH servers'
  'xdg-desktop-portal: native file dialogs'
)
options=('!lto')
conflicts=('squirrel-disk-bin' 'squirreldisk' 'squirreldisk-bin')
provides=('squirreldisk')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a9f1dc9e831a86a4290499c551188483a759b501205ee10c26a6bd1a38a061f')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"

  install -Dm644 packaging/linux/squirreldisk.desktop -t "$pkgdir/usr/share/applications/"
  local _size
  for _size in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon/icon-$_size.png" \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
  done

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
