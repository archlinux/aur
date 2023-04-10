# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.4.2
_pkgrev="1f3e184f97b12db45d9fadfab42d0ee44ec4ba69"
# _pkgref="refs/tags/v$_pkgrev"
_pkgref="$_pkgrev"
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz"
        Cargo.lock)
sha256sums=('c9057874f34567c1998824101ba8e70f444fd5e425db61ca0ccef0588bfd376c'
            '92e7f5be660ddf4d7411d4499ea5a74771bd859f8063cfa985f7a2844960c66e')
b2sums=('24f0b03c485a2e6650dc5c401820dfc1e6482200ba0efc95cca136ee004e0896f5fb3884b3a4309ec4167204d8aac8ad639e877715b98b737c07025c39e881ac'
        'ea5f04fe99b3aa1a0e9f52aa7de51ad1f070d0af7866cdbf8447f733d1bfa2ce1cbecf2608d28e77f2e6ff94e4cd9a4faf670e13362f469a12c91d453b2f5ea9')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$_pkgrev"

  ln -sf "$srcdir/Cargo.lock" bkmr/Cargo.lock

  cargo fetch --manifest-path bkmr/Cargo.toml --locked --target $_target
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
