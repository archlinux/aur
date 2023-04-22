# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=bkmr
pkgver=0.5.0
_pkgrev=0c6dc483246c85f303c4a5f101ccb6d73beb3e55
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
sha256sums=('ab4fc83bbec65e1d9b3c1536e4529d02ea50dbea1d8f76dc82ce5a69d520c05f'
            '1f56a267a84748948a76cbe48fe8d03450c398c8085d330f049cc47bd7602565')
b2sums=('9e56da0fbd34933e8ce981eda3df03ad33565d162de56ccbaeb73ebf5da554895bf2e4257f5b59fef5859ba9ca98f84a2dfcd9782f93fa84893b0119480ab810'
        'b65e6ec461c6469adf7fe12a8e611ae17059179a4a7c37bd51be6e3bb1863f9748b0ddbf3687fda0ed063d72b87ee5b298752fb499db075b42132a6b72a81273')

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
