# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=feluda
pkgver=1.5.3
pkgrel=1
pkgdesc='Detect license usage restrictions in your project'
arch=('x86_64')
url="https://github.com/anistark/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('851d673150219667c5fac86b70be62d283af05d294aee0d511a65874232c8ba8')
makedepends=('cargo')
depends=('glibc' 'gcc-libs' 'openssl')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
