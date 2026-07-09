# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi dot net>

pkgname=convco
pkgver=0.7.0
pkgrel=1
pkgdesc='Conventional commits, changelog, versioning, validation'
url='https://convco.github.io'
license=('MIT')
arch=('x86_64' 'i686' 'arm' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/convco/convco/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a9b33e41561f80eaa9252673a1ee1b4857743e2ff7b33079d0b616c772fa981')
b2sums=('e474bee2f6423fd857f44267733dbfc9e68cb40b434b3e871903fab20ffa47e45a48759a7d6c381b71b9f274887a8029928247e598c7418c518689a7386b9a17')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR='target' \
    cargo build --frozen --release \
      --no-default-features --features 'gix'
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/convco

  install -Dm0644 -t "$pkgdir/usr/share/fish/vendor_completions.d" \
    target/completions/convco.fish
  install -Dm0644 -t "$pkgdir/usr/share/zsh/site-functions" \
    target/completions/_convco
  install -Dm0644 -t "$pkgdir/usr/share/elvish/lib" \
    target/completions/convco.elv
  install -Dm0644 target/completions/convco.bash \
    "$pkgdir/usr/share/bash-completion/completions/convco"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
