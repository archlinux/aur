# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sentry-relay
pkgver=26.6.0
pkgrel=1
pkgdesc="Sentry relay"
arch=('x86_64')
url="https://github.com/getsentry/relay"
license=('Apache-2.0')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake')
source=("git+https://github.com/getsentry/relay/#tag=$pkgver"
	"sentry-relay.service")
sha512sums=('5be0d822b3eecceb2382511a50d5dcd350e80faaf1b046f8653f0d68c712a6c050e251caee746c6274914581770c11ec5f86b66ed01828669a2f9c3e04dac893'
            '849b2fd41dad7f89b47fdba2729e83d92a6bfa63e9bd5507607d7c4cf498e051a14f07597f2cc6f415297ecb94a8619d21f370d2f38d04c5fa993e5c5d691cb6')

prepare() {
  cd "relay"
  git submodule update --init
}

build() {
  cd "relay/relay"
  export RELAY_RELEASE=$pkgver
  export RUSTFLAGS="$RUSTFLAGS --cfg tokio_unstable"
  unset CFLAGS
  unset LDFLAGS
  cargo fetch --locked --target "$(rustc --print host-tuple)"
  cargo build --frozen --release
}

package() {
  cd "relay"
  install -Dm0755 target/release/relay "$pkgdir/usr/bin/sentry-relay"
  install -Dm0644 LICENSE.md "$pkgdir/usr/share/licenses/sentry-relay/LICENSE.md"
  install -Dm0644 "${srcdir}/sentry-relay.service" "${pkgdir}/usr/lib/systemd/system/sentry-relay.service"
  install -dm0755 "${pkgdir}/etc/sentry-relay"
}
