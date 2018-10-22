# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=tealdeer-git
_name=tealdeer
pkgver=r150.c1ca5ce
pkgrel=1
pkgdesc="A fast TLDR client written in Rust."
arch=('x86_64' 'i686')
url="https://github.com/dbrgn/tealdeer"
license=('MIT' 'Apache')
depends=()
makedepends=('git' 'rust' 'cargo')
provides=('tldr')
conflicts=('nodejs-tldr' 'nodejs-tldr-git' 'tealdeer' 'tldr-bash-git' 'tldr-cpp-client'
           'tldr-git' 'tldr-go-client-git' 'tldr-python-client')
options=(!emptydirs)
source=('git+https://github.com/dbrgn/tealdeer')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  sed -i 's/^version = "\(.*\)"/version = "\1-aur-'${pkgver}'"/' Cargo.toml
  cargo build --release
}

package() {
  cd "$srcdir/$_name"

  # Install binary
  mkdir -p $pkgdir/usr/bin
  install -o root -g root -m 755 target/release/tldr $pkgdir/usr/bin

  # Install bash completions
  mkdir -p $pkgdir/usr/share/bash-completion/completions
  install -o root -g root -m 644 bash_tealdeer $pkgdir/usr/share/bash-completion/completions/tldr
}

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
