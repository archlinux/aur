# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=everhour-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Everhour from the terminal — draft-first time tracking (CLI + TUI)"
arch=('x86_64' 'aarch64')
url="https://github.com/Qu4tro/everhour-cli"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('everhour-cli-git' 'everhour-cli-bin')
# !lto: ring's build script compiles C/asm with makepkg's -flto=auto, leaving
# GCC LTO bitcode in libring_core that the final rustc link can't resolve.
options=('!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qu4tro/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('49f0c22742916369ed8590879b5f41062a69310f51090ec276665e5ff462609d')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
  for shell in bash zsh fish; do
    ./target/release/everhour completion print "$shell" > "everhour.$shell"
  done
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/everhour "$pkgdir/usr/bin/everhour"
  install -Dm644 everhour.bash "$pkgdir/usr/share/bash-completion/completions/everhour"
  install -Dm644 everhour.zsh "$pkgdir/usr/share/zsh/site-functions/_everhour"
  install -Dm644 everhour.fish "$pkgdir/usr/share/fish/vendor_completions.d/everhour.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
