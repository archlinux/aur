# Maintainer: Peltoche <dev@halium.fr>
# Co-maintainer: Andrea Pascal <andrea@anodium.net>
# Maintainer: Walter  wcasanova at disroot dot com

pkgname="lsd-git"
_pkgname="lsd"
pkgver=0.18.0.566.g16f1b1c
pkgrel=1
pkgdesc="The next gen ls command"
arch=("i686" "x86_64" "arm" "aarch64")
url="https://github.com/Peltoche/lsd"
license=("MIT")
depends=()
optdepends=('powerline-fonts: powerline symbols for terminals'
            'nerd-fonts-complete: popular collections such as Font Awesome & fonts such as Hack')
makedepends=("rust" "cargo" "git")
provides=("lsd")
conflicts=("lsd")
source=("$_pkgname::git+https://github.com/Peltoche/lsd.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  export SHELL_COMPLETIONS_DIR="$PWD/completions"
  cargo build --release --locked
}

check() {
  cd $_pkgname
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 completions/_lsd \
  "$pkgdir/usr/share/zsh/site-functions/_lsd"
  install -Dm644 completions/lsd.bash \
  "$pkgdir/usr/share/bash-completion/completions/lsd"
  install -Dm644 completions/lsd.fish \
  "$pkgdir/usr/share/fish/vendor_completions.d/lsd.fish"
}
