# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=quickwit
pkgver=0.6.2
pkgrel=1
pkgdesc='A fast and cost-efficient distributed search engine for large-scale, immutable data'
arch=('x86_64')
url='https://quickwit.io'
license=('AGPL3')
depends=('gcc-libs')
makedepends=('git' 'rust' 'cmake' 'clang' 'yarn' 'protobuf')
backup=('etc/quickwit.yaml')
options=('!lto')
_commit='9040401ee440c957943499db1bade1e36628fee9'
source=("$pkgname::git+https://github.com/quickwit-oss/quickwit.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname/$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname/$pkgname"

  # set env vars
  local QW_COMMIT_DATE=$(TZ=UTC0 git log -1 --format=%cd --date=format-local:'%Y-%m-%dT%H:%M:%SZ')
  local QW_COMMIT_HASH=$(git rev-parse HEAD)
  local QW_COMMIT_TAGS=$(git tag --points-at HEAD | tr '\n' ',')

  # build web UI
  pushd "$pkgname-ui"
  yarn install
  yarn build
  popd

  cargo build --frozen --release --features release-feature-set
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" quickwit/target/release/quickwit

  # config
  install -vDm640 -t "$pkgdir/etc" "config/$pkgname.yaml"
}
