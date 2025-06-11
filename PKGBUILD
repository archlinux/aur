# Maintainer: Juliette Cordor
pkgname=ignoreit
pkgver=2.4.10
pkgrel=3
depends=('openssl' 'gcc-libs' 'glibc')
makedepends=('cargo')
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv7h' 'aarch64')
pkgdesc="Quickly load .gitignore templates"
license=('MIT')
url="https://github.com/jewlexx/ignoreit"

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jewlexx/ignoreit/archive/v$pkgver.tar.gz"
  "LICENSE::https://github.com/jewlexx/ignoreit/raw/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
  'dd91a8b36bd669dd997a7aee25df02bb317b4e43ac08637383fd7ef0e7203833'
  '2b164c5af4c64b5578ac5048f71a87ea1b86c30fc7899d620adef4b9a5e71769'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
