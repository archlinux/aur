# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>

pkgname=fdroid-cli
_pkgname=fdroid-linux
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI management tool for F-Droid packages and Android APK inspection on Linux"
arch=('x86_64')
url="https://github.com/gerliczkowalczuk/$_pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
  'andron: ultra-lightweight Android translation runtime'
)
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('20dfe6a8804eb9c21be98028ea99ed99fedd8e335b0fea8ace3231ce1c34b82c')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --bin fdroid-cli
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "target/release/fdroid-cli" "$pkgdir/usr/bin/fdroid-cli"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
