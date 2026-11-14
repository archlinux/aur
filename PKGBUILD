# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=quickwit
pkgver=0.9.3
pkgrel=1
pkgdesc='A fast and cost-efficient distributed search engine for large-scale, immutable data'
arch=('x86_64')
url='https://quickwit.io'
license=('Apache-2.0')
makedepends=('git' 'rust' 'cmake' 'clang' 'yarn' 'protobuf')
depends=('gcc-libs' 'zlib' 'openssl')
backup=('etc/quickwit.yaml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/quickwit-oss/quickwit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d6c083d77aa54a7510d6ac6f52a19070a723d15ca37ce2222f9e30672ad3dd3')
b2sums=('f98ec5df984006c87bb5602d36dfa7a3325c945ee5884c8f8c8992071b926bd2fdd796823f5cc55fb7cba2ec1816dc2edb7487db9a82656493ada205b383f98f')
options=('!lto')

prepare() {
  cd "quickwit-$pkgver"

  cargo fetch --manifest-path quickwit/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "quickwit-$pkgver"

  # set env vars
  # local QW_COMMIT_DATE=$(TZ=UTC0 git log -1 --format=%cd --date=format-local:'%Y-%m-%dT%H:%M:%SZ')
  # local QW_COMMIT_HASH=$(git rev-parse HEAD)
  local QW_COMMIT_TAGS="v$pkgver"

  # makepkg's RUSTFLAGS overrides rustflags from upstream's .cargo/config.toml, which drops this cfg
  export RUSTFLAGS="$RUSTFLAGS --cfg tokio_unstable"

  # build web UI
  pushd "quickwit/quickwit-ui"
  yarn install || true
  yarn build || true
  popd

  cargo build \
    --manifest-path quickwit/Cargo.toml \
    --frozen --release \
    --package quickwit-cli \
    --features "quickwit-cli/jemalloc,quickwit-cli/openssl-support,quickwit-cli/pprof,quickwit-metastore/postgres"
}

package() {
  cd "quickwit-$pkgver"

  # binary
  install -Dm0755 -t "$pkgdir/usr/bin" quickwit/target/release/quickwit

  # config
  install -Dm0640 -t "$pkgdir/etc" "config/$pkgname.yaml"

  # license
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
