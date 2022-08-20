# Maintainer: Yigit Sever <yigit at yigitsever dot com>

pkgname=ouch
pkgver=0.3.1
pkgrel=4
pkgdesc="Painless compression and decompression in the terminal"
arch=('x86_64')
url="https://github.com/ouch-org/ouch"
license=('MIT')
makedepends=('cargo')
conflicts=(${pkgname}-git ${pkgname}-bin)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('269abaf5ac2f80da3796dbf5e73419c1b64104d1295f3ff57965141f079e6f6d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  GEN_COMPLETIONS=1 cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd target/release/build/ouch-*/out/completions
  sed -i "s/':output -- The resulting file. It's extensions can be used to specify the compression formats:_files'/\":output -- The resulting file. It's extensions can be used to specify the compression formats:_files\"/" _ouch

  install -Dm0644 ${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm0644 ${pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm0644 _${pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
