# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=dofigen
pkgver=2.3.2
pkgrel=2
pkgdesc='Generate Dockerfiles using simplified descriptions in YAML'
arch=('x86_64')
url="https://github.com/lenra-io/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3bbbd243be1c461ceee25aa0eb5e6df8ba7c52378f9be94ee698de9b78feaed3')
makedepends=('cargo' 'cargo-edit')
depends=('glibc' 'gcc-libs' 'openssl')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cargo set-version "$pkgver"
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
