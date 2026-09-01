# Maintainer: Roberto Alsina <ralsina@kde.org>
pkgname=nicolino
pkgver=0.26.1
pkgrel=2
pkgdesc="A fast, modular static site generator written in Crystal"
arch=("x86_64" "aarch64")
url="https://github.com/ralsina/nicolino"
license=("MIT")
depends=("crystal>=1.21.0" "pandoc" "libvips" "libyaml" "lua54")
makedepends=("shards" "git")
# The lexbor shard compiles its bundled C library honoring $CFLAGS; with
# makepkg's LTO flags that produces GCC LTO bitcode which ld.lld (used by
# the Crystal linker) cannot read, failing with undefined lexbor symbols.
options=(!lto)
source=("$pkgname-$pkgver::git+https://github.com/ralsina/nicolino.git#tag=v$pkgver")
sha256sums=('17aedca22a2a9b813bb4992dfbdd6c7a31258bb5df2129ab9e1583db335b174c')

prepare() {
  cd "$pkgname-$pkgver"
  # makepkg's git checkout does not remove untracked files, so a lib/
  # left by a previous build attempt survives; shards then skips the
  # postinstall hooks of already-installed shards and silently reuses a
  # stale liblxb.a (undefined lexbor symbols at link time). Start clean.
  rm -rf lib
}

build() {
  cd "$pkgname-$pkgver"
  shards build --release --error-trace
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 "bin/nicolino" "$pkgdir/usr/bin/nicolino"

  # Install license
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
