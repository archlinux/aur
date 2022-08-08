# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tealdeer-git
_name=tealdeer
_binname=tldr
pkgver=r421.b369678
pkgrel=1
pkgdesc="A fast tldr client in Rust."
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/dbrgn/tealdeer"
license=('MIT' 'Apache')
depends=('openssl')
makedepends=('git' 'rust' 'cargo')
provides=('tldr')
conflicts=('tldr')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/tealdeer#branch=main')
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
  install -D -o root -g root -m 644 completion/bash_tealdeer "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -D -o root -g root -m 644 completion/fish_tealdeer "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -D -o root -g root -m 644 completion/zsh_tealdeer "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"

  # Install MIT license
  install -Dm 644 "${srcdir}/tealdeer/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}

pkgver() {
  cd "$srcdir/$_name" || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
