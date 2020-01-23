# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tealdeer-git
_name=tealdeer
_binname=tldr
pkgver=r204.7a3a565
pkgrel=1
pkgdesc="A fast TLDR client written in Rust."
arch=('x86_64' 'i686')
url="https://github.com/dbrgn/tealdeer"
license=('MIT' 'Apache')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('tldr')
conflicts=('tldr')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/tealdeer')
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name" || exit 1

  # Patch version
  sed -i 's/^version = "\(.*\)"/version = "\1-aur-'${pkgver}'"/' Cargo.toml

  # Build a release build
  cargo build --release
}

package() {
  cd "$srcdir/$_name" || exit 1

  # Install binary
  install -D -o root -g root -m 755 target/release/tldr "$pkgdir/usr/bin/${_binname}"

  # Install shell completions
  install -D -o root -g root -m 644 bash_tealdeer "$pkgdir/usr/share/bash-completion/completions/${_binname}"
  install -D -o root -g root -m 644 fish_tealdeer "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -D -o root -g root -m 644 zsh_tealdeer "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
}

pkgver() {
  cd "$srcdir/$_name" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
