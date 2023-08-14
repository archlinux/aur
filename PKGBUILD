# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.4.1
pkgrel=1
pkgdesc='Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases'
url='https://github.com/gorilla-devs/ferium'
license=('MPL2')
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ccab09df5cd0c3db890b7099705696cd8770dcf936182dcd266ad3da5f5262f9')
b2sums=('41533fb977861de377fc48319aaf430dec84a3fb5f9f9ab1bfd5b7cfce9db0fc6875f94108c4c2ace3d4d4d79a6be517adef1ca96c4926083a50b816c09473e7')

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
