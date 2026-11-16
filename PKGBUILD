# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sentry-relay
pkgver=26.11.0
pkgrel=1
pkgdesc="Sentry relay"
arch=('x86_64')
url="https://github.com/getsentry/relay"
license=('Apache-2.0')
depends=('zlib' 'gcc-libs')
makedepends=('cargo' 'git' 'cmake')
source=("git+https://github.com/getsentry/relay/#tag=$pkgver"
	"sentry-relay.service")
sha512sums=('e01f4c41c446a6d6496f3c08f92306dfaef55a5b0ed52ca1a7427505d2ed047afe403f6a4e290b0a7bf244289db8a3e7812bb2668b8a54e5d11df19e7887b491'
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
