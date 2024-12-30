# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=3.0.0
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
sha256sums=('9ea8e62f780e75e63b9dced43bd8cf457876a7888d2c755b221b11a9b7c4540d')
b2sums=('b772aec274023cdf84ff8d892a47a96cd2df4542779f32b595909c9ade8c5859cf42bd79dc09b00aae6a518bf196ef8daf5f1bd628d075a7185428f0a3180653')
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
