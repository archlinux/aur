# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium-gui
pkgver=4.7.1
pkgrel=1
pkgdesc='Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases'
url='https://github.com/gorilla-devs/ferium'
license=('MPL-2.0')
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a9b9fd966f47d5f8c32e483a21ea476f6883f194e7813f1f81b0001e14b046a5')
b2sums=('4277f8f3028e87dc63c3649298c3ae778b80ba8c59f944f914484d02d21941b4a4cd326e5d87ef59ae7f7ca6e17c0eefb88bf6ac6508f19e758643db190bfade')
options=(!lto)

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "ferium-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "ferium-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release
}

package() {
  cd "ferium-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/ferium

  target/release/ferium complete bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/ferium
  target/release/ferium complete zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_ferium
  target/release/ferium complete fish | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/ferium.fish

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
