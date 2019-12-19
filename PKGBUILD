# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.14.0
pkgrel=1
pkgdesc='Show CommonMark (a standardized Markdown dialect) documents on text terminals.'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('Apache')
depends=('oniguruma')
conflicts=('mdcat-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('330059534642bba502e82d6a86f16451b7ce9d2ad02e356fd0bcff961020bc9f')

build() {
  cd "$pkgname-$pkgname-$pkgver"

  # Default features include remote_resources. remote_resources brings in a
  # larege dependency chain reqwest->native-tls->openssl.
  #
  # We dynamically link against the system libonig so that, that dependency is
  # shared with, and kept up to date with the rest of the system. It means
  # this package will need to have the pkgrel bumped if there is a breaking
  # release to libonig though.
  RUSTONIG_DYNAMIC_LIBONIG=1 RUSTONIG_SYSTEM_LIBONIG=1 cargo build \
    --release --no-default-features --locked
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
