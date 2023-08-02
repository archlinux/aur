# Maintainer: Vasili Novikov (replace "vvv" with "v" in email) vvvasya.novikov+cm3513git@gmail.com
# Past maintainer: Wesley Moore <wes@wezm.net>

pkgname=diffr
pkgver=0.1.5
pkgrel=2
pkgdesc='Word-by-word diff highlighting tool'
arch=('i686' 'x86_64')  # please write me to add more architectures if you test them and they work
url="https://github.com/mookid/diffr"
license=('MIT')
conflicts=('diffr-git')
makedepends=('cargo' 'git')
optdepends=(
  # This is subjective, but I don't want to force everyone
  # to install pandoc (+350Mb disk space), just for one manual page.
  'pandoc: to generate the manual at build time'
)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0e4bc406a8eb6f2347c9d760f8d2dacd4a258ecd73ffceb0314f1ab8e146db2acce60363c0eed48c8a28983ce95f695d2775780a987bee7bc4ddd5ebaf4d7ec3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
  if command -v pandoc &> /dev/null; then
    pandoc -s -t man assets/diffr.1.md -o assets/diffr.1
  fi
}

check() {
 cd "$srcdir/$pkgname-$pkgver"
 export RUSTUP_TOOLCHAIN=stable
 export CARGO_TARGET_DIR=target
 export DIFFR_TESTS_BINARY_PATH=${CARGO_TARGET_DIR}/release/diffr
 cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  if test -e "assets/diffr.1"; then
    install -Dm644 "assets/diffr.1" "${pkgdir}/usr/share/man/man1/diffr.1"
  fi
}
