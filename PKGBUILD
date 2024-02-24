# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=ferium
pkgver=4.5.2
pkgrel=1
pkgdesc='Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases'
url='https://github.com/gorilla-devs/ferium'
license=('MPL-2.0')
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gorilla-devs/ferium/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b4fde3eee2336c4874d8bf5c412e019843f9cef018f750bbb4c51c1fceb9484')
b2sums=('0ecfb6f66992a04f2807382ca31699c27dde52934c53c56826eb26e81fd70d503010d6bbe162e0e8f809ddc5894d18db7406944f5d1e15f96c31d565aca72dc3')

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
