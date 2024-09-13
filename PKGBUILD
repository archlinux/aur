# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=quickwit
pkgver=0.8.2
pkgrel=1
pkgdesc='A fast and cost-efficient distributed search engine for large-scale, immutable data'
arch=('x86_64')
url='https://quickwit.io'
license=('AGPL-3.0-or-later')
makedepends=('git' 'rust' 'cmake' 'clang' 'yarn' 'protobuf')
depends=('gcc-libs' 'zlib' 'openssl')
backup=('etc/quickwit.yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quickwit-oss/quickwit/archive/refs/tags/v$pkgver.tar.gz"
        0001-arch-Update-time-crate.patch)
sha256sums=('aa9e932662e48447d814e36db657acd4c9a69beb97c16006e9cb5539585fd947'
            '974bcf7fdd7275295d0be8531c770b969d4663fa3d3736a43a08697c20239402')
b2sums=('52f3f78a1b979222d4a117410697a85b80778568c2aa029d2e8aa704be4d6bd9e7ba86e8653d51a8debcaea30eb6ce89a4f925537364d5890375ddd5e04341ae'
        '458055efb9283da5da3306d03c62631fb17426e32fd4db9b6685e8acf895ce1dab40952435bd2c7bb30914379eaabf64691b2fa70717c40f162133b35648a61b')
options=('!lto')

prepare() {
  cd "quickwit-$pkgver"

  patch -Np1 -i "$srcdir/0001-arch-Update-time-crate.patch"

  cargo fetch --manifest-path quickwit/Cargo.toml --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "quickwit-$pkgver"

  # set env vars
  # local QW_COMMIT_DATE=$(TZ=UTC0 git log -1 --format=%cd --date=format-local:'%Y-%m-%dT%H:%M:%SZ')
  # local QW_COMMIT_HASH=$(git rev-parse HEAD)
  local QW_COMMIT_TAGS="v$pkgver"

  # build web UI
  pushd "quickwit/quickwit-ui"
  yarn install || true
  yarn build || true
  popd

  cargo build --manifest-path quickwit/Cargo.toml --frozen --release --features release-feature-set
}

package() {
  cd "quickwit-$pkgver"

  # binary
  install -Dm0755 -t "$pkgdir/usr/bin" quickwit/target/release/quickwit

  # config
  install -Dm0640 -t "$pkgdir/etc" "config/$pkgname.yaml"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE_AGPLv3.0.txt
}
