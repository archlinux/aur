# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=quickwit
pkgver=0.8.1
pkgrel=1
pkgdesc='A fast and cost-efficient distributed search engine for large-scale, immutable data'
arch=('x86_64')
url='https://quickwit.io'
license=('AGPL-3.0-or-later')
makedepends=('git' 'rust' 'cmake' 'clang' 'yarn' 'protobuf')
depends=('gcc-libs' 'zlib' 'openssl')
backup=('etc/quickwit.yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quickwit-oss/quickwit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b23a597b8b18bb9826d4bbdef868ab7b2a9e47076efb356c5ef36b6e648ed2a9')
b2sums=('04a26a9c06ac4f17f6d4bbf2bb547ef80e57201dc8b056382ec9211ce795957fbdf6f4cebba90a03bde567d40285b1f6769c35f8e966befa00e51fbda199031e')
options=('!lto')

prepare() {
  cd "quickwit-$pkgver"

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
  yarn install
  yarn build
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
