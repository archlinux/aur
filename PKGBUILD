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
        0001-arch-Update-time-crate.patch
        0002-Fix-pulsar-dependency.patch)
sha256sums=('aa9e932662e48447d814e36db657acd4c9a69beb97c16006e9cb5539585fd947'
            '4bc4bb41cb93006d7d79e7d31483cf96f25a11112121915f186db30e20654bbc'
            'f9180a9eceaf13570b8d7d663e80bb577a673be978ed0ba16a2c4693faf4aea3')
b2sums=('52f3f78a1b979222d4a117410697a85b80778568c2aa029d2e8aa704be4d6bd9e7ba86e8653d51a8debcaea30eb6ce89a4f925537364d5890375ddd5e04341ae'
        '1edf2dc7e4361d578dba539ea99bfd0d6c882e6b6b00d712b9f4b21332997c0eaaf05f5db110b9c2757357a17794d13fe5c913eb2fec19a4d41d5cdc31ae2f4a'
        '824a7ee83293c9ba124e81b1b72ac200717b53de7300110ef6510338dd12600dd8069a6189b2ded88a35ed24c96a091d144aa982c7f5fdd801ed8e2bce4df7fc')
options=('!lto')

prepare() {
  cd "quickwit-$pkgver"

  patch -Np1 -i "$srcdir/0001-arch-Update-time-crate.patch"
  patch -Np1 -i "$srcdir/0002-Fix-pulsar-dependency.patch"

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
