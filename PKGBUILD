# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium-gui
pkgver=4.5.0
pkgrel=1
pkgdesc='Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases'
url='https://github.com/gorilla-devs/ferium'
license=('MPL-2.0')
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9b54673a494cecabfc62a48d03d504b6fea00af1b749c3ccb210021f8528bf0')
b2sums=('fc05b470030c8e63ee0dd9a25364050f41b60ad88460bd5ad9f3a1a4733d4e6d77fc5cc57b065b455f7a54ad3cdb62ff4c1b91fc36576542a3018b07b5815889')

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
