# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=1.0.0
# _pkgrev=982145d8ea36d9a78d7c7f828ca5a68f7aa9b524
# _pkgref=$_pkgrev
_pkgrev=$pkgver
_pkgref="refs/tags/v$_pkgrev"
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz")
sha256sums=('b48017fd6049bf6f4e3556405863bbf44d5764600b0f76bdd5bbcd4017fbbfac')
b2sums=('d6fe2f4e671591fc118bc67b58dbec91001a88c85c0a6fec03ef7596d0d5117ee625457ee259b88f45c651805f4f2ca8c808eab49be4c12e55ea5dfc01c3b171')

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
