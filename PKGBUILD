# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=dofigen
pkgver=2.3.0
pkgrel=1
pkgdesc='Generate Dockerfiles using simplified descriptions in YAML'
arch=('x86_64')
url="https://github.com/lenra-io/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c0d4580742697f9b0f5b008574e213d560933a59f0b9cd320b1499c41e960ced')
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

# tests are taking way too long to run
# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --release --frozen
# }

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  cp -R docs/* "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
