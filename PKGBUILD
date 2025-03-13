# Maintainer: kxxt <i at kxxt dot dev>

_pkgname=cargo-visualize
pkgname=cargo-visualize
_asset_dir="/usr/share/$_pkgname/resources" 
pkgver=2.1.0
pkgrel=1
pkgdesc="Know your dependencies via interactive cargo dependency graph visualization"
arch=('x86_64' 'aarch64' 'riscv64' 'loong64' 'ppc64le')
url="https://github.com/kxxt/cargo-visualize"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'yarn' 'git')
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd frontend
  export SKIP_YARN_COREPACK_CHECK=1
  yarn install
}

build() {
  cd "$_pkgname"
  export SKIP_YARN_COREPACK_CHECK=1
  env -C frontend yarn build
  ASSET_DIR="$_asset_dir" cargo build --frozen --release --no-default-features
}

check() {
  cd "$_pkgname"
  ASSET_DIR="$_asset_dir" cargo test --frozen --release --no-default-features
}

package() {
  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -d "$pkgdir/$_asset_dir"
  cp -rT frontend/dist "$pkgdir/$_asset_dir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
