# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.3.1
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/refs/tags/v$pkgver.tar.gz"
        Cargo.lock)
sha256sums=('b154bdbbaff290b0053ae4b1bb487e55fefebf5fd94f232be5b3e4095b0a82f4'
            '6d802906cf8c5a82de7fde5091372db175c3caf2a307ba2559bcc9c3b1314276')
b2sums=('536a39c47183f457d754f40a13135d126ff33029d2eeca8d623130176009def2c93134fdc71253c061ea9e766f0bc07e90c9df54191eeea855467c06eb444b2b'
        '369913dd55e9c2fa2b3102e5624152d4792aa53bf98c9465a691925e069c435195e152e9028276f86d9576c7979a5670a2640f0c1ce5838c970af29d819c64e2')

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
