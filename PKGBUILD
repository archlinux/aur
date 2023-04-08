# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.4.0
_pkgrev=9539e80a732b9355fa5fe8bcc6f98f34828caa2b
_pkgref=$_pkgrev
pkgrel=1
pkgdesc='Ultrafast Bookmark Manager and Launcher'
url='https://github.com/sysid/bkmr'
license=('custom:BSD-3-Clause')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sysid/bkmr/archive/$_pkgref.tar.gz"
        Cargo.lock)
sha256sums=('89415f2b8174cd0afea161728d4cf99ddac66f91add4bf2dcd3715c6f403760f'
            '51755cf193373ce35f40fcc12f7bb1c6682ad08c7a09530910174a0da8169d0a')
b2sums=('a5ab4479c79f92de32d7f70b5b50afc70517809d25185551c4eecb34e8de94dd61ebbd9fbc97182e176ff59a54823d9aea55604eaa838bf01500d40edd5fecea'
        'a1ae02d169d58cfc113b704f7e23aa2b0d5dd4d425d9d1001343072682e5a49b2596c6cd1675f560bef02fe346cbfcfd0a821f6904b627d26c707f1bf3005064')

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
