pkgname=sentry-relay
pkgver=23.3.1
pkgrel=1
pkgdesc="Sentry relay"
arch=('x86_64')
url="https://github.com/getsentry/relay"
license=('MIT' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake')
source=("git+https://github.com/getsentry/relay/#tag=$pkgver")
sha512sums=('SKIP')

prepare() {
  cd "relay"
  git submodule update --init
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "relay/relay"
  export RELAY_RELEASE=$pkgver
  unset CFLAGS
  unset LDFLAGS
  cargo build --release --locked --features ssl,processing
}

package() {
  cd "relay"
  install -Dm0755 target/release/relay "$pkgdir/usr/bin/sentry-relay"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/sentry-relay/LICENSE"
}
