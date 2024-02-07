# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.5.1
pkgrel=1
pkgdesc='Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases'
url='https://github.com/gorilla-devs/ferium'
license=('MPL-2.0')
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b337f0a5884f1e1f6786417914e052ca08fea7e946e6977ccb68abe4fbcf09ee')
b2sums=('fd9d5124227c00c9b4b472ce42ca7d45f220539e35eb57ebfc49bb882a7606baaff6b3969d88202783138c0110822c1d826eecdd6f6ad111b20eb9e31ed82e2f')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release --no-default-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/ferium

  target/release/ferium complete bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/ferium
  target/release/ferium complete zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_ferium
  target/release/ferium complete fish | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/ferium.fish

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
