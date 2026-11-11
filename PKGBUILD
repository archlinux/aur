# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>

pkgname=f-droid
_pkgname=fdroid-linux
pkgver=0.2.0
pkgrel=2
pkgdesc="Official F-Droid Android GUI Client and compatibility runner for Linux"
arch=('x86_64')
url="https://github.com/gerliczkowalczuk/$_pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'andron: ultra-lightweight Android translation runtime'
  'wayland: native Wayland zero-copy display support'
  'pipewire: low-latency direct audio routing'
)
provides=('fdroid')
conflicts=('fdroid')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64315d7ae60927908c613ac594ff15275205cf58524453e4cbb815472579abd2')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin fdroid
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/fdroid" "$pkgdir/usr/bin/fdroid"
  ln -s fdroid "$pkgdir/usr/bin/f-droid"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
