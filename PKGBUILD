# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.7.0
# _pkgrev=982145d8ea36d9a78d7c7f828ca5a68f7aa9b524
# _pkgref=$_pkgrev
_pkgrev=$pkgver
_pkgref="refs/tags/v$_pkgrev"
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz"
        Cargo.lock)
sha256sums=('0043c7e39ad7815014845f89600438e8968da2438746a1694867954380ef76f6'
            'c958c76c441cd65d77d31c58dd20e90ecb6cb68e4f2f5d8518b5b38323c7291a')
b2sums=('2f672f20cb4c0a854f34f0be6b5a79b665a2385b12a9cf07f193ba5d1d69d1729ff255cc09ae61297453969810acc5dca507b644aebf19316f8fd591c2fa706d'
        'f2411061e2ab68e0f41cf778c68645d2cc7b0b7c8fd9a060ee6f96dff547a64ac834cb44130e57713daa89cd095448997bfa75cd3886091246f100fe23facc70')

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
