pkgname=git-flow-tui
pkgver=1.2.0
pkgrel=2
pkgdesc='Terminal UI for gitflow with extended logic for CI/CD'
arch=('x86_64')
url="https://github.com/Emiliopg91/${pkgname}"
license=('GPL-2')
provides=('gitflow')
depends=(
  'git'
  'glibc'
  'libgcc'
)
makedepends=(
  'rust'
)
source=(
  "git+$url.git#tag=$pkgver-$pkgrel"
)
sha256sums=(
  'SKIP'
)

build() {
  cd "$srcdir/${pkgname}"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}"
  
  #TUI
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  
  #CLI
  ln -s "${pkgname}" "$pkgdir/usr/bin/git-flow"
  install -Dm755 "target/release/${pkgname}" "target/release/cli"

  ./target/release/cli completion > git-flow.bash
  install -Dm644 git-flow.bash \
      "$pkgdir/usr/share/bash-completion/completions/git-flow"
}