# Maintainer: Walter - "d2Nhc2Fub3ZhQGRpc3Jvb3Qub3JnCg=="

pkgname="starship-git"
_pkgname="starship"
pkgver=1.18.2.3242.g98d0ac8e2
pkgrel=1
pkgdesc="The cross-shell prompt for astronauts"
arch=("x86_64")
url="https://github.com/starship/starship"
license=("ISC")
depends=()
optdepends=('powerline-fonts: powerline symbols for terminals'
            'ttf-font-nerd: Nerd Font Symbols preset')
makedepends=("rust" "cmake" "cargo" "git")
provides=("starship")
conflicts=("starship")
source=("$_pkgname::git+https://github.com/starship/starship.git")
sha256sums=("SKIP")

pkgver() {
    cd "$_pkgname"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
 }

check() {
  cd $_pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
 }

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm 755 "${pkgdir}"/usr/share/{bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}/
  ./target/release/starship completions bash > "${pkgdir}"/usr/share/bash-completion/completions/starship
  ./target/release/starship completions fish > "${pkgdir}"/usr/share/fish/vendor_completions.d/starship.fish
  ./target/release/starship completions zsh > "${pkgdir}"/usr/share/zsh/site-functions/_starship
}
