# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=3.1.1
# _pkgrev=982145d8ea36d9a78d7c7f828ca5a68f7aa9b524
# _pkgref=$_pkgrev
_pkgrev=$pkgver
_pkgref="refs/tags/v$_pkgrev"
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'python')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz")
sha256sums=('0773c0f605c6259b120e052b01d0e4d970e958c750b437c19611c4ffb53e6dc6')
b2sums=('780d6a5c890fd00d1bbf1d34688d2b746ac295e919e2470336c90bd44745abed5fe80cc8e236e86d7295ab3195c7e0457da562b0f9ab6143c59a07abd29929d9')
options=('!lto')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$_pkgrev"

  cargo fetch --manifest-path bkmr/Cargo.toml --target $_target
}

build() {
  cd "$pkgname-$_pkgrev"

  CARGO_TARGET_DIR='target' \
    cargo build --manifest-path bkmr/Cargo.toml --frozen --release
}

package() {
  cd "$pkgname-$_pkgrev"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/bkmr

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
