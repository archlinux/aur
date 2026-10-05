# Maintainer: solareon <aur@solareon.com>

pkgname=qbx-lua-git
pkgver=1.0.6.r63.gc33a513
pkgrel=1
pkgdesc='Lua linter, formatter, and language server for FiveM (git version)'
arch=('x86_64')
url='https://github.com/Qbox-project/qbx-lua'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('qbx-lua')
conflicts=('qbx-lua')
source=("qbx-lua::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/qbx-lua"
  git describe --long --tags --always |
  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/qbx-lua"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/qbx-lua"
  CARGO_TARGET_DIR=target cargo build --frozen --profile lint-release -p qbx_lint
  CARGO_TARGET_DIR=target cargo build --frozen --release -p qbx_lua_ls
}

check() {
  cd "$srcdir/qbx-lua"
  CARGO_TARGET_DIR=target cargo test --frozen --workspace
}

package() {
  cd "$srcdir/qbx-lua"

  install -Dm755 target/lint-release/qbx-lint "$pkgdir/usr/bin/qbx-lint"
  install -Dm755 target/release/qbx-lua-ls "$pkgdir/usr/bin/qbx-lua-ls"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  cp -a docs "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 examples/qbxlint.toml \
    "$pkgdir/usr/share/doc/$pkgname/examples/qbxlint.toml"
}
