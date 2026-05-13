# Maintainer: Jakov Petrina Trnski <jkv.petrina@gmail.com>
pkgname=dtsfmt
pkgver=0.8.0
_tsdtver=6557729f4afaf01dec7481d4e5975515ea8f0edd
pkgrel=2
pkgdesc='Auto formatter for device tree files written in Rust.'
url='https://github.com/mskelton/dtsfmt'
source=("$pkgname-$pkgver.tar.gz::https://github.com/mskelton/dtsfmt/archive/v$pkgver.tar.gz"
        "ts-devicetree.tar.gz::https://github.com/joelspadin/tree-sitter-devicetree/archive/$_tsdtver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('ISC')
makedepends=('cargo')
# TODO: Fix `note: ld.lld: error: undefined symbol: ts_tree_cursor_goto_parent`
options=('!lto')
sha256sums=('436efc35883a48fe68549e1bc86923fcf10696a3c2a7af4ae4463c6b0f67429d'
            'cbf55984c8c9edf2eb160591c28da948b67e6522c8aa753f97c68c73457d627f')

prepare() {
  cd "$pkgname-$pkgver"

  cp -r $srcdir/tree-sitter-devicetree-$_tsdtver/* ./tree-sitter-devicetree
}

build () {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/dtsfmt "${pkgdir}/usr/bin/dtsfmt"
}
