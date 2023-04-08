# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.4.1
_pkgrev="$pkgver"
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
sha256sums=('ba53f718f0a856bf71c08c831b3091283f232ed125a39c60b14dcc8199a59e76'
            'f2911c1daee1390caa390e3426b7c58135fd4f4e82e2e39da315cd2404e8deeb')
b2sums=('45fdd0f982042bdca9594cd581dafdccab1634a29fc8cc8d1654e3640073e4674e63dadc4a808e87e63a35a27303cd3240a8845f32ffc4e3a0d626ae87135535'
        'c56190cb0705779ee52c4fcef321a42c09ca285a23f1352e184829894e2a6ce5aadba677f4d8e8c08bbdedc6793b791158c8a1f36dfc1e52481ed948b385436f')

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
