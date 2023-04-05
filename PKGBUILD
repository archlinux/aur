pkgname=sentry-relay
pkgver=23.3.1
pkgrel=2
pkgdesc="Sentry relay"
arch=('x86_64')
url="https://github.com/getsentry/relay"
license=('MIT' 'custom')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake')
source=("git+https://github.com/getsentry/relay/#tag=$pkgver"
	"sentry-relay.service")
sha512sums=('SKIP'
            '849b2fd41dad7f89b47fdba2729e83d92a6bfa63e9bd5507607d7c4cf498e051a14f07597f2cc6f415297ecb94a8619d21f370d2f38d04c5fa993e5c5d691cb6')

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
  install -Dm0644 "${srcdir}/sentry-relay.service" "${pkgdir}/usr/lib/systemd/system/sentry-relay.service"
  install -dm0755 "${pkgdir}/etc/sentry-relay"
}
