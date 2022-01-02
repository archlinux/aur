# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=url-bot-rs-git
pkgver=0.2.0.r76.gaf328a3
pkgrel=1
pkgdesc='URL title fetching bot for IRC in Rust'
arch=('x86_64')
url=https://github.com/nuxeh/url-bot-rs
license=('ISC')
depends=('gcc-libs' 'openssl' 'sqlite')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=$pkgname.install
source=("git+$url.git"
        "${pkgname%-git}".{service,sysusers.conf})
sha512sums=('SKIP'
            '5b2ef73ab44fffc2b4119b77d2fa2566eec0e217f19ace50d23abcf4120b195a9dd93f3ee5bb20d49cc5f60aa27a8589a077433290906644adb1a9833a1eb037'
            'ea4e28aa8e0f565d09329b831bcdd865c91c32f2f21281b9faebe6757a5e2fb2202cbf4c6140868b4fce470221cc3b4786ec2dd63b311ea4a74a9af882361054')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd ${pkgname%-git}
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd ${pkgname%-git}
  cargo build --release --locked --offline
}

check() {
  cd ${pkgname%-git}
  cargo test --locked --offline
}

package() {
  cd ${pkgname%-git}
  install -Dt "$pkgdir"/usr/bin target/release/url-bot-{get,rs}
  install -Dm644 -t "$pkgdir"/usr/lib/systemd/system ../${pkgname%-git}.service
  install -Dm644 ../${pkgname%-git}.sysusers.conf \
    "$pkgdir"/usr/lib/sysusers.d/${pkgname%-git}.conf
  install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname%-git} example.config.toml
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname COPYING
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 ${pkgname%-git}.1
}

# vim:set ts=2 sw=2 et:
