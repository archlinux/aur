# Maintainer: Peltoche <dev@halium.fr>
# Co-maintainer: Andrea Pascal <andrea@anodium.net>
# Maintainer: Walter - "d2Nhc2Fub3ZhQGRpc3Jvb3Qub3JnCg=="

pkgname="lsd-git"
_pkgname="lsd"
pkgver=1.1.5.1081.gc1e7a59
pkgrel=1
pkgdesc="The next gen ls command"
arch=("i686" "x86_64" "arm" "aarch64")
url="https://github.com/lsd-rs/lsd"
license=("MIT")
depends=()
optdepends=('nerd-fonts'
            'awesome-terminal-fonts')
makedepends=("rust" "cargo" "git")
provides=("lsd")
conflicts=("lsd")
source=("$_pkgname::git+https://github.com/lsd-rs/lsd.git")
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
  export SHELL_COMPLETIONS_DIR="$PWD/completions"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 completions/_lsd \
  "$pkgdir/usr/share/zsh/site-functions/_lsd"
  install -Dm644 completions/lsd.bash \
  "$pkgdir/usr/share/bash-completion/completions/lsd"
  install -Dm644 completions/lsd.fish \
  "$pkgdir/usr/share/fish/vendor_completions.d/lsd.fish"
}
