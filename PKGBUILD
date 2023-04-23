# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.6.0
_pkgrev=982145d8ea36d9a78d7c7f828ca5a68f7aa9b524
_pkgref=$_pkgrev
# _pkgrev=$pkgver
# _pkgref="refs/tags/v$_pkgrev"
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz"
        Cargo.lock)
sha256sums=('5e1718518fc6a95cc2125718e99b622192bc637c54ef7ba776ef86ce17ca6180'
            '36b134b615d7748f426b05adf0e2d4303b74022ad7e858e4c787c3689026b178')
b2sums=('81ae2197a332dd91bc711fc787cffac7801dba3fdc095c3c43bb85dd5f85775e6a3081dbd98d7ce1b80de3417f88862e3ecc0e8b3e8952a6c6bf1fc71ac15e61'
        'cf24111998eeac7e1bde0d176d1fa599922fa3c18cf680ca034ce7f79f4185c1c7e0ec1d796c9dd09c649becda495b75a1f543610e5b94b2534b995acdc3ac0c')

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
