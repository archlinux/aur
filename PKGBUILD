# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.2.4
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('40a0c781da1f93057a8a02194999e76759191425c1c2525525f3db4c78006b4b'
            'a6cc1dca99c1b2f824f8e06633020ae84787b787207ea2aa2fcd1760c5f8f03f')
b2sums=('70335f4d658b66e8726a1965df91ec0e28c79d9cebb0ed621a285ea66634fbb628043c976798767292ff9b634cda359ed2ee39d26e3130512c439e9a077d0fdd'
        'b702380b1e4eb9ff1fc4e5f297e1c5bff2f96b6bbf2b1572a045482352a9597bec2ecb6b3799a8e2959157d79674f0f4e6809dc8447792208632e29a995a6cf3')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  ln -sf "$srcdir/Cargo.lock" bkmr/Cargo.lock

  cargo fetch --manifest-path bkmr/Cargo.toml --locked --target $_target
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --manifest-path bkmr/Cargo.toml --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/bkmr

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
