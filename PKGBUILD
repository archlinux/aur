# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=rhai-lsp-git
pkgver=r182.2f1fcd7
pkgrel=1
pkgdesc='Language server for Rhai'
url='https://github.com/rhaiscript/lsp'
license=('Apache')
arch=('x86_64' 'aarch64')
makedepends=(git cargo)
depends=(gcc-libs)
source=("$pkgname::git+https://github.com/rhaiscript/lsp.git")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

pkgver() {
  cd "$pkgname"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$pkgname"

  cargo fetch
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR="target" \
    cargo build --bin rhai --frozen --release
}

package() {
  cd "$pkgname"

  install -Dm0755 target/release/rhai "$pkgdir/usr/bin/rhai-lsp"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
