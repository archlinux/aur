# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.6.3
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
sha256sums=('5076ba78c674819a6d09fb4c2ac95183c1e5ee10d1babced68c9bc07e76a7187'
            'c9f0472dadf2d488a574a811d146a15e345e10617d15b52bd3dec495e28b4e0c')
b2sums=('352a426538760fadf0fa388c412277e376ff6d6eda701f63e7051865fea77e5a8c063f5cb98afaeafd60b922d28f2b0890d7668811a0521227be57b427f813ae'
        '56b3175e5d3ae69d9badad2e37f883c87a26c73e3372a7b1412c8cbd607e63e961f1ff4c177e32ea02e3cbb7641d5740f7db1ff7894f6b87c5d1119ce651fb04')

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
