# Maintainer: thialfi17 <thialfi17+arch@gmail.com>
pkgname=lash-git
_pkgname=lash
pkgver=r21.ef251a9
pkgrel=1
pkgdesc='Symlink manager for dotfiles - a GNU Stow alternative'
arch=('any')
url='https://github.com/thialfi17/lash'
license=('GPL3')
makedepends=('cargo' 'git')
provides=('lash')
source=("git+https://github.com/thialfi17/lash")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$_pkgname"

  cargo build --frozen --release --target-dir target
  cargo xtask completions --target-dir target
}

check() {
  cd "$srcdir/$_pkgname"
  cargo test --workspace --frozen
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 target/release/lash "${pkgdir}/usr/bin/lash"

  install -Dm644 target/lash.bash "${pkgdir}/usr/share/bash-completion/completions/lash.bash"
  install -Dm644 target/lash.fish "${pkgdir}/usr/share/fish/vendor_completions.d/lash.fish"
  install -Dm644 target/_lash "${pkgdir}/usr/share/zsh/site-functions/_lash"
}
