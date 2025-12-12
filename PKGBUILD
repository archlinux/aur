# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
shopt -s extglob

pkgname=seal
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple, user-friendly, and useful runtime for Luau "
url="https://github.com/seal-runtime/seal"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
arch=('x86_64')
options=('!lto')
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac13797af9ef14612b416cfa2da317fbf886ce3f2d09842e0377b4c69dde6377')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  # directory name must be "seal" for tests to work
  mkdir seal
  mv -t seal ./!(seal) .luaurc .seal .vscode
  cd seal

  ./target/release/seal ./tests/run.luau
}

package() {
  cd "$pkgname-$pkgver/seal"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
