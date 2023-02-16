# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.2.2
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/refs/tags/v$pkgver.tar.gz"
        0001-makepkg-Fix-Cargo.toml.patch
        Cargo.lock)
sha256sums=('228e9c5acb554ad24fcaf3f78a9e8ce1955f34a646f56133f7d8c2919ed9d4c7'
            '207f34b092c8a864cecfb4bfe813ebd929221fe0a6062fdb95c8fcce63788061'
            'aaadf2e0d11fa731da18d32d2c317155e1b13291783c57ee9b1565360ed21cde')
b2sums=('cbae8dba39de1152eda52392fc6f81b37770752d8c49b44ccebef4a710db3ae9f668ff453aec5989e0e4b0b11661cbdb867cba274cb43b1b2f1c796fdf9196a2'
        '6a6f5b7833963956fe45f37dc48d3a15824df33d46f7e248b0780bcf4cc65302e29cddafbe56ea3d7de575e468a762e53f112bc1ef4bdcf0d0f122655e727d66'
        '2b8111de1ef659d4a522ebcdfc1533d390715110fe502324dd7c82bc5ae0817c45b321e45b75549ffeb7361ad5a1dbe868eaba41a2f45f629c283a077c50e5ae')

case $CARCH in
  x86_64|i686|aarch64)
    _target="$CARCH-unknown-linux-gnu" ;;
  arm)
    _target="arm-unknown-linux-gnueabi" ;;
esac

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/0001-makepkg-Fix-Cargo.toml.patch"
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
