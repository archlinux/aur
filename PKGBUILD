# Maintainer: Roberto Alsina <ralsina@kde.org>
pkgname=nicolino
pkgver=0.26.0
pkgrel=1
pkgdesc="A fast, modular static site generator written in Crystal"
arch=("x86_64" "aarch64")
url="https://github.com/ralsina/nicolino"
license=("MIT")
depends=("crystal>=1.21.0" "pandoc" "libvips" "libyaml" "lua54")
makedepends=("shards" "git")
source=("$pkgname-$pkgver::git+https://github.com/ralsina/nicolino.git#tag=v$pkgver")
sha256sums=('921ff9596952be1bc6f0c264482a80cbcfb84c2eb46ae06c2a7bceefaff3d7a8')

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
