# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>

pkgname=f-droid
_pkgname=fdroid-linux
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultra-lightweight Android & F-Droid application runner and compatibility layer for Linux"
arch=('x86_64')
url="https://github.com/gerliczkowalczuk/$_pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'andron: optimized Android translation runtime engine'
  'wayland: native Wayland zero-copy display support'
  'pipewire: low-latency direct audio routing'
)
provides=('fdroid' 'fdroid-linux')
conflicts=('fdroid' 'fdroid-linux')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fdc4c0aac9ecc3f0fe99eb330f1cdcd80f92461fc28ff91f0b2de55623faabe5')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  ln -s "$_pkgname" "$pkgdir/usr/bin/fdroid"
  ln -s "$_pkgname" "$pkgdir/usr/bin/f-droid"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
